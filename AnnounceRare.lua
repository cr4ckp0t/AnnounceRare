-------------------------------------------------------------------------------
-- Announce Rare By Crackpot
-------------------------------------------------------------------------------
local AR =
	LibStub("AceAddon-3.0"):NewAddon(
	"AnnounceRare",
	"AceComm-3.0",
	"AceConsole-3.0",
	"AceEvent-3.0",
	"AceHook-3.0",
	"AceTimer-3.0"
)
local L = LibStub("AceLocale-3.0"):GetLocale("AnnounceRare", false)

-- local api cache
local C_ChatInfo_GetNumActiveChannels = C_ChatInfo.GetNumActiveChannels
local C_Map_ClearUserWaypoint = C_Map.ClearUserWaypoint
local C_Map_GetBestMapForUnit = C_Map.GetBestMapForUnit
local C_Map_GetMapInfo = C_Map.GetMapInfo
local C_Map_GetPlayerMapPosition = C_Map.GetPlayerMapPosition
local C_Map_GetUserWaypointHyperlink = C_Map.GetUserWaypointHyperlink
local C_Map_SetUserWaypoint = C_Map.SetUserWaypoint
local CombatLogGetCurrentEventInfo = _G["CombatLogGetCurrentEventInfo"]
local CreateFrame = _G["CreateFrame"]
local EnumerateServerChannels = _G["EnumerateServerChannels"]
local GetAddOnMetadata = _G["GetAddOnMetadata"]
local GetChannelName = _G["GetChannelName"]
local GetGameTime = _G["GetGameTime"]
local GetItemInfo = _G["GetItemInfo"]
local GetLocale = _G["GetLocale"]
local GetPlayerMapPosition = _G["GetPlayerMapPosition"]
local GetZoneText = _G["GetZoneText"]
local IsAddOnLoaded = _G["IsAddOnLoaded"]
local SendChatMessage = _G["SendChatMessage"]
local UnitAffectingCombat = _G["UnitAffectingCombat"]
local UnitAura = _G["UnitAura"]
local UnitClassification = _G["UnitClassification"]
local UnitExists = _G["UnitExists"]
local UnitGUID = _G["UnitGUID"]
local UnitHealth = _G["UnitHealth"]
local UnitHealthMax = _G["UnitHealthMax"]
local UnitIsDead = _G["UnitIsDead"]
local UnitName = _G["UnitName"]

AR.title = GetAddOnMetadata("AnnounceRare", "Title")
AR.version = GetAddOnMetadata("AnnounceRare", "Version")
AR.cooldown = 180 -- 3 minutes
AR.mouseCooldown = 30 -- 30 seconds
AR.linkCooldown = 15 -- 1 minute
AR.zones = {
	1462, -- mechagon
	1355, -- nazjatar
	1530, -- vale of eternal blossoms
	1527, -- uldum
	1571, -- uldum (vision zone)
	1543, -- the maw
	1961 -- kothria
}
local band = bit.band
local ceil = math.ceil
local match = string.match
local format = string.format
local pairs = pairs
local strsplit = strsplit
local tonumber = tonumber
local tostring = tostring

local outputChannel = "|cffffff00%s|r"
local messageToSend = L["%s%s (%s/%s %.2f%%) %.2f %.2f %s"]
local deathMessage = L["%s%s died at %02d:%02d server time!"]
local chatLink =
	"|HAR2_RARE:%1$d:%2$d:%3$d|h|cffffffffRare Found:|r |cFFFFFF00[%4$s (" .. L["Click to Announce"] .. ")]|r|h"
local chatLinkDead = "|HAR2_DEATH:%1$d|h|cffffffffRare Died:|r |cFFFFFF00[%2$s (" .. L["Click to Announce"] .. ")]|r|h"
local chatLinkDrill =
	"|HAR2_DRILL:%1$d|h|cffffffffDrill Found:|r |cFFFFFF00[%2$s (" .. L["Click to Announce"] .. ")]|r|h"

local defaults = {
	global = {
		advertise = false,
		debug = false,
		drill = true,
		lastSeen = nil,
		lastTime = 0,
		monitor = false,
		notify = "link",
		onLoad = false,
		output = "CHANNEL",
		tomtom = true
	}
}

-- options table
local options = {
	name = AR.title,
	handler = AR,
	type = "group",
	args = {
		header = {
			type = "header",
			order = 1,
			name = (L["|cffff7d0a%s:|r %s"]):format(L["Version"], AR.version),
			width = "full"
		},
		apiChanges = {
			type = "description",
			order = 2,
			name = L[
				'Beginning in WOW patch 8.2.5 the API function |cffffff00SendChatMessage|r is now a protected. This essentially means that user input is required to trigger the chat message, otherwise you will receive an "ADDON_ACTION_BLOCKED" error you may have seen with previous versions of AR.'
			],
			width = "full"
		},
		space = {
			type = "description",
			order = 3,
			name = "",
			width = "full"
		},
		general = {
			type = "group",
			order = 4,
			name = L["General Options"],
			guiInline = true,
			args = {
				notify = {
					type = "select",
					order = 1,
					name = L["Notification Method"],
					desc = L[
						"How do you want to be notified of a rare?\n\nChat Link (Default) - Prints a link in your default chat frame that you click to send the announcement.\nButton - A button will appear when you target a rare to send the announcement."
					],
					values = {
						["link"] = L["Chat Link"]
						--["btn"] = L["Button"],
					},
					get = function(info)
						return AR.db.global.notify
					end,
					set = function(info, value)
						AR.db.global.notify = value
					end
				},
				advertise = {
					type = "toggle",
					order = 2,
					name = L["Advertise AR"],
					desc = L["Adds a prefix to chat messages with the name of the addon."],
					get = function(info)
						return AR.db.global.advertise
					end,
					set = function(info, value)
						AR.db.global.advertise = value
					end
				},
				onLoad = {
					type = "toggle",
					order = 3,
					name = L["Loading Message"],
					desc = L["Display a loading message when the addon first loads."],
					get = function(info)
						return AR.db.global.onLoad
					end,
					set = function(info, value)
						AR.db.global.onLoad = value
					end
				},
				debug = {
					type = "toggle",
					order = 4,
					name = L["Debugging"],
					desc = L["Enable this to assist with fixing a bug or unintended functionality."],
					get = function(info)
						return AR.db.global.debug
					end,
					set = function(info, value)
						AR.db.global.debug = value
						AR.debug = value
					end
				}
			}
		},
		announcements = {
			type = "group",
			order = 5,
			guiInline = true,
			name = L["Announcement Options"],
			args = {
				output = {
					type = "select",
					order = 1,
					name = L["Channel Output"],
					desc = L["Channel to send the messages to."],
					values = {
						["CHANNEL"] = L["General Chat"],
						["SAY"] = L["Say"],
						["YELL"] = L["Yell"],
						["PARTY"] = L["Party"],
						["RAID"] = L["Raid"],
						["GUILD"] = L["Guild"],
						["OFFICER"] = L["Officer"]
					},
					get = function(info)
						return AR.db.global.output
					end,
					set = function(info, value)
						AR.db.global.output = value
					end
				},
				drill = {
					type = "toggle",
					order = 2,
					name = L["Drill Announcements"],
					desc = L["Announce drill sites to let people know what mob is about to be available."],
					get = function(info)
						return AR.db.global.drill
					end,
					set = function(info, value)
						AR.db.global.drill = value
					end
				},
				tomtom = {
					type = "toggle",
					order = 3,
					name = L["TomTom Waypoints"],
					desc = L[
						"Automatically create TomTom waypoints for you when a drill site is activated.\n\n|cffff0000REQUIRES TOMTOM ADDON!|r"
					],
					disabled = function()
						return not AR.db.global.drill
					end,
					get = function(info)
						return AR.db.global.tomtom
					end,
					set = function(info, value)
						AR.db.global.tomtom = value
						if value then
							AR.tomtom = IsAddOnLoaded("TomTom")
						end
					end
				},
				monitor = {
					type = "toggle",
					order = 4,
					name = L["Monitor Chat"],
					desc = L["Monitor chat for rare notifications and create TomTom waypoints for them."],
					disabled = function()
						return not IsAddOnLoaded("TomTom")
					end,
					get = function(info)
						return AR.db.global.monitor
					end,
					set = function(info, value)
						AR.db.global.monitor = value
					end
				}
			}
		}
	}
}

local function GetTargetId()
	local guid = UnitGUID("target")
	if guid == nil then
		return nil
	end
	local unitType, _, _, _, _, unitId, _ = strsplit("-", guid)
	return (unitType == "Creature" or unitType == "Vehicle") and tonumber(unitId) or nil
end

local function GetNPCGUID(guid)
	if guid == nil then
		return nil
	end
	local unitType, _, _, _, _, unitId, _ = strsplit("-", guid)
	return (unitType == "Creature" or unitType == "Vehicle") and tonumber(unitId) or nil
end

local function GetGeneralChannelNumber()
	local channelFormat = "%s - %s"
	local channelRUFormat = "%s: %s"
	local zoneText = GetZoneText()
	local general = EnumerateServerChannels()
	if zoneText == nil or general == nil then
		return false
	end
	return GetChannelName(
		(GetLocale() == "ruRU" or GetLocale() == "esMX") and channelRUFormat:format(general, zoneText) or
			channelFormat:format(general, zoneText)
	)
end

-- Time Displacement
local function IsInAltTimeline()
	for i = 1, 40 do
		local name = UnitAura("player", i)
		if name == L["Time Displacement"] then
			return true
		end
	end
	return false
end

local function GetConfigStatus(configVar)
	return configVar == true and ("|cff00ff00%s|r"):format(L["ENABLED"]) or ("|cffff0000%s|r"):format(L["DISABLED"])
end

local function FormatNumber(n)
	if n >= 10 ^ 6 then
		return format("%.2fm", n / 10 ^ 6)
	elseif n >= 10 ^ 3 then
		return format("%.2fk", n / 10 ^ 3)
	else
		return tostring(n)
	end
end

local function FindInArray(toFind, arraySearch)
	if #arraySearch == 0 then
		return false
	end
	for _, value in pairs(arraySearch) do
		if value == toFind then
			return true
		end
	end
	return false
end

local function DecRound(num, decPlaces)
	return format("%." .. (decPlaces or 0) .. "f", num)
end

local function GetVerbage(key)
	if key == "tear" then
		return L["Spectral Tear"]
	elseif key == "key" then
		return L["Spectral Key"]
	elseif key == "cache" then
		return L["Cache"]
	elseif key == "crate" then
		return L["Relic Crate"]
	elseif key == "teleporter" or key == "tele" then
		return L["Active Teleporter"]
	elseif key == "maelie" then
		return L["Maelie"]
	else
		return
	end
end

function AR:ParseLink(link, text, button, frame)
	local linkType, id, health, healthMax = strsplit(":", link)

	if self.db.global.debug and linkType:find("AR2_") and linkType ~= "AR2_DEATH" then
		self:DebugPrint((L["Link Type: %s, ID: %s, Health: %s, Max: %s"]):format(linkType, id, health, healthMax))
	end

	if linkType == "AR2_RARE" then
		self:AnnounceRare(tonumber(id), tonumber(health), tonumber(healthMax))
	elseif linkType == "AR2_DEATH" then
		self:AnnounceDeath(tonumber(id))
	elseif linkType == "AR2_DRILL" then
		self:AnnounceDrill(tonumber(id))
	else
		return self.hooks["SetItemRef"](link, text, button, frame)
	end
end

function AR:ValidNPC(id)
	return (self.correctZone and self.rares[id] ~= nil) and true or false
end

function AR:GetRareIDByName(name)
	for key, value in pairs(self.rares) do
		if value.name == name then
			return key
		end
	end
	return false
end

function AR:UpdateDuplicates(id)
	if id == 151884 then
		self.rares[135497].announced = true
	elseif id == 135497 then
		self.rares[151884].announced = true
	elseif id == 151625 then
		self.rares[151623].announced = true
	elseif id == 151623 then
		self.rares[151625].announced = true
	elseif id == 152569 then
		self.rares[152570].announced = true
		self.rares[149847].announced = true
	elseif id == 152570 then
		self.rares[152569].announced = true
		self.rares[149847].announced = true
	elseif id == 149847 then
		self.rares[152569].announced = true
		self.rares[152570].announced = true
	end
end

function AR:AnnounceDrill(id)
	local x, y, drill, rareName
	if id == 1 then
		x, y = 56.25, 36.25
		drill = "DR-TR28"
		rareName = L["Ol' Big Tusk"]
	elseif id == 2 then
		x, y = 63, 25.75
		drill = "DR-TR35"
		rareName = L["Earthbreaker Gulroc"]
	elseif id == 3 then
		x, y = 72.71, 53.93
		drill = "DR-CC61"
		rareName = L["Gorged Gear-Cruncher"]
	elseif id == 4 then
		x, y = 66.50, 58.85
		drill = "DR-CC73"
		rareName = L["Caustic Mechaslime"]
	elseif id == 5 then
		x, y = 68.40, 48
		drill = "DR-CC88"
		rareName = L["The Kleptoboss"]
	elseif id == 6 then
		x, y = 51.25, 50.20
		drill = "DR-JD41"
		rareName = L["Boilburn"]
	elseif id == 7 then
		x, y = 59.75, 67.25
		drill = "DR-JD99"
		rareName = L["Gemicide"]
	else
		return
	end

	SendChatMessage(
		(L["%s (%s) is up at %s %s."]):format(drill, rareName, x, y),
		self.db.global.output:upper(),
		nil,
		self.db.global.output:upper() == "CHANNEL" and genId or nil
	)
end

function AR:AnnounceRare(id, tarHealth, tarHealthMax)
	local tarCombat = UnitAffectingCombat("target")
	local bestMap = C_Map_GetBestMapForUnit("player")
	local tarPos = C_Map_GetPlayerMapPosition(bestMap, "player")
	local genId = GetGeneralChannelNumber()

	-- unable to determine the target's id
	if not id or not self.rares[id] then
		if self.db.global.debug then
			self:DebugPrint(L["Invalid ID provided."])
		end
		return
	end

	-- internal cooldown of 3 minutes to prevent spam
	if self.db.global.lastSeen == id and self.db.global.lastTime < time() - self.cooldown then
		if self.db.global.debug then
			self:DebugPrint(L["Skipping print due to throttle."])
		end
		return
	end

	if AR.db.global.output:upper() == "CHANNEL" and not genId then
		self:Print(L["Unable to determine your general channel number."])
	else
		-- set a user waypoint to be able to send a link
		C_Map_SetUserWaypoint(UiMapPoint.CreateFromCoordinates(bestMap, tarPos.x, tarPos.y))
		SendChatMessage(
			messageToSend:format(
				self.db.global.advertise == true and "AnnounceRare: " or "",
				self.rares[id].name,
				FormatNumber(tarHealth),
				FormatNumber(tarHealthMax),
				(tarHealth / tarHealthMax) * 100,
				ceil(tarPos.x * 10000) / 100,
				ceil(tarPos.y * 10000) / 100,
				C_Map_GetUserWaypointHyperlink()
			),
			self.db.global.output:upper(),
			nil,
			self.db.global.output:upper() == "CHANNEL" and genId or nil
		)

		C_Map_ClearUserWaypoint()

		-- update multiple ids from one sighting
		if self.zoneText == "mechagon" then
			self:UpdateDuplicates(id)
		end

		self.db.global.lastSeen = id
		self.db.global.lastTime = time()
		self.rares[id].announced = true
	end
end

function AR:AnnounceDeath(id)
	local hours, minutes = GetGameTime()
	local genId = GetGeneralChannelNumber()

	if id == nil then
		self:Print(L["Unable to determine the NPC's GUID."])
	elseif self.db.global.output:upper() == "CHANNEL" and not genId then
		self:Print(L["Unable to determine your general channel number."])
	else
		if self.debug == true then
			self:DebugPrint((L["Announcing Rare Death: %s"]):format(self.rares[id].name))
		end
		SendChatMessage(
			deathMessage:format(self.db.global.advertise == true and "AnnounceRare: " or "", self.rares[id].name, hours, minutes),
			self.db.global.output:upper(),
			nil,
			self.db.global.output:upper() == "CHANNEL" and genId or nil
		)
	end
end

function AR:AnnounceMouseover(name)
	local genId = GetGeneralChannelNumber()
	local tarPos = C_Map_GetPlayerMapPosition(C_Map_GetBestMapForUnit("player"), "player")
	if self.debug then
		self:DebugPrint((L["Announcing Armory at %s, %s"]):format(ceil(tarPos.x * 10000) / 100, ceil(tarPos.y * 10000) / 100))
	end
	SendChatMessage(
		(L["%sArmory is located at %s, %s!"]):format(
			ttItemName == "Broken Rustbolt Armory" and L["Broken"] .. " " or "",
			ceil(tarPos.x * 10000) / 100,
			ceil(tarPos.y * 10000) / 100
		),
		self.db.global.output:upper(),
		nil,
		self.db.global.output:upper() == "CHANNEL" and genId or nil
	)
end

function AR:CreateWaypoint(x, y, name)
	if not TomTom then
		self:Print(L["You must have TomTom installed to use waypoints."])
		return
	elseif not self.db.global.tomtom then
		return
	end
	if self.lastWaypoint ~= false then
		TomTom:RemoveWaypoint(self.lastWaypoint)
	end

	self.lastWaypoint =
		TomTom:AddWaypoint(
		C_Map_GetBestMapForUnit("player"),
		x / 100,
		y / 100,
		{
			title = name,
			persistent = false,
			minimap = true,
			world = true
		}
	)

	-- create an auto expire timer
	if self.tomtomExpire ~= false then
		self.tomtomExpire:Cancel()
	end
	self.tomtomExpire =
		self:ScheduleTimer(
		120,
		function()
			if AR.lastWaypoint ~= nil and AR.lastWaypoint ~= false then
				TomTom:RemoveWaypoint(AR.lastWaypoint)
			end
		end
	)
end

function AR:CheckZone(...)
	local mapId = C_Map_GetBestMapForUnit("player")
	if mapId == nil then
		self.correctZone = false
	else
		local mapInfo = C_Map_GetMapInfo(mapId)
		if (FindInArray(mapId, self.zones) or FindInArray(mapInfo["parentMapID"], self.zones)) and self.correctZone == false then
			self.correctZone = true
			self.zoneText = mapId == 1462 and "mechagon" or "nazjatar"
		elseif
			(FindInArray(mapId, self.zones) == false and FindInArray(mapInfo["parentMapID"], self.zones) == false) and
				self.correctZone == true
		 then
			self.correctZone = false
			self.zoneText = nil
		end
	end
end

function AR:DebugPrint(msg)
	print(("|cffff7d0a%s:|r |cffffff00%s|r"):format(L["AR2 Log"], msg))
end

function AR:Print(msg)
	print(("|cffff7d0a%s:|r |cffffffff%s|r"):format(L["AR2"], msg))
end

function AR:PLAYER_TARGET_CHANGED()
	if self.correctZone then
		local tarId = GetTargetId()

		if not tarId or tarId == nil then
			return
		end

		--[[ internal cooldown of 1 minute to prevent spam
		if self.db.global.linkLastSeen == tarId and self.db.global.linkLastTime < time() - self.linkCooldown then
			if self.db.global.debug then
				self:DebugPrint(L["Chat link skipped due to throttle."])
			end
			return
		end]]
		if tarId ~= nil and self:ValidNPC(tarId) and self.rares[tarId].announced == false then
			-- self.db.global.linkLastSeen = tarId
			-- self.db.global.linkLastTime = time()
			if UnitIsDead("target") then
				if self.db.global.debug then
					self:DebugPrint(L["Chat link skipped due to target being dead."])
				end
				return
			end
			self:Print(chatLink:format(tarId, UnitHealth("target"), UnitHealthMax("target"), self.rares[tarId].name))
		elseif tarId == nil and self.db.global.debug then
			self:DebugPrint((L["Unable to determine %s's ID."]):format(UnitName("target")))
		elseif self.rares[tarId].announced and self.db.global.debug then
			self:DebugPrint((L["%s has already been announced."]):format(self.rares[tarId].name))
		end
	end
end

function AR:COMBAT_LOG_EVENT_UNFILTERED()
	local _, subevent, _, _, _, sourceFlags, _, srcGuid, srcName = CombatLogGetCurrentEventInfo()
	if subevent == "UNIT_DIED" and self.correctZone then
		local id = GetNPCGUID(srcGuid)
		if id ~= 151623 and self.rares[id] ~= nil then
			self:Print(chatLinkDead:format(id, self.rares[id].name))
		end
	end
end

function AR:CHAT_MSG_CHANNEL(msg, ...)
	--[[ chat monitoring
	if self.db.global.monitor and self.tomtom then
		-- announcerare
		--local messageToSend = L["%s%s (%s/%s %.2f%%) is at %s %s%s and %s"]
		if msg:find("(.+) %(.+%) is at ([0-9.]+) ([0-9.]+) .+") then
			local npcName, x, y = msg:match(
		end
	end]]
end

function AR:CHAT_MSG_MONSTER_EMOTE(msg, ...)
	if self.db.global.drill and self.correctZone and msg:match("DR-") then
		local rareName, id
		if msg:match("DR-TR28") then
			id = 1
			rareName = L["Ol' Big Tusk"]
		elseif msg:match("DR-TR35") then
			id = 2
			rareName = L["Earthbreaker Gulroc"]
		elseif msg:match("DR-CC61") then
			id = 3
			rareName = L["Gorged Gear-Cruncher"]
		elseif msg:match("DR-CC73") then
			id = 4
			rareName = L["Caustic Mechaslime"]
		elseif msg:match("DR-CC88") then
			id = 5
			rareName = L["The Kleptoboss"]
		elseif msg:match("DR-JD41") then
			id = 6
			rareName = L["Boilburn"]
		elseif msg:match("DR-JD99") then
			id = 7
			rareName = L["Gemicide"]
		else
			return
		end
		self:Print(chatLinkDrill:format(id, rareName))

		-- create waypoint
		if self.db.global.tomtom and self.tomtom then
			self:CreateWaypoint(x, y, ("%s: %s"):format(drill, rareName))
		end
	end
end

function AR:OnEnable()
	self:RawHook("SetItemRef", "ParseLink", true)

	-- register our events
	self:RegisterEvent("CHAT_MSG_CHANNEL")
	self:RegisterEvent("CHAT_MSG_MONSTER_EMOTE")
	self:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
	self:RegisterEvent("PLAYER_ENTERING_WORLD")
	self:RegisterEvent("PLAYER_TARGET_CHANGED")
	self:RegisterEvent(
		"ZONE_CHANGED",
		function()
			AR:CheckZone()
		end
	)
	self:RegisterEvent(
		"ZONE_CHANGED_NEW_AREA",
		function()
			AR:CheckZone()
		end
	)
end

function AR:OnDisable()
	self:UnhookAll()

	-- unregister our events
	self:UnregisterEvent("CHAT_MSG_CHANNEL")
	self:UnregisterEvent("CHAT_MSG_MONSTER_EMOTE")
	self:UnregisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
	self:UnregisterEvent("PLAYER_ENTERING_WORLD")
	self:UnregisterEvent("PLAYER_TARGET_CHANGED")
	self:UnregisterEvent(
		"ZONE_CHANGED",
		function()
			AR:CheckZone()
		end
	)
	self:UnregisterEvent(
		"ZONE_CHANGED_NEW_AREA",
		function()
			AR:CheckZone()
		end
	)
end

function AR:PLAYER_ENTERING_WORLD()
	-- init some stuff
	self.rares = self:LoadRares()
	self.correctZone = false
	self:CheckZone()

	-- tomtom waypoint settings
	self.tomtom = IsAddOnLoaded("TomTom")
	self.lastWaypoint = false
	self.tomtomExpire = false

	-- chat command using aceconsole-3.0
	self:RegisterChatCommand(
		"rare",
		function(args)
			local key = self:GetArgs(args, 1)
			local helpString = "|cffffff00/rare %s|r - %s"
			if key == "config" then
				LibStub("AceConfigDialog-3.0"):Open("Announce Rare")
				self:Print(L["Displaying configuration options."])
			elseif key == "debug" then
				self.db.global.debug = not self.db.global.debug
				self:Print((L["Debugging has been %s!"]):format(GetConfigStatus(self.db.global.debug)))
			elseif key == "frame" then
				self.frame:Show()
			elseif key == "help" or key == "?" then
				self:Print(L["Command Line Help"])
				self:Print((L["|cffffff00/rare|r - %s"]):format(L["Announce rare to output channel."]))
				self:Print(helpString:format("config", L["Display configuration window."]))
				self:Print(helpString:format("debug", L["Toggle addon debugging."]))
				self:Print(helpString:format("cache", L["Announce cache location."]))
				self:Print(helpString:format("tear", L["Announce void tear location."]))
				self:Print(helpString:format("key", L["Announce spectral key location."]))
				self:Print(helpString:format("help", L["Print some help."]))
				if self.db.global.debug then
					self:Print(helpString:format("id", L["Print target information."]))
					self:Print(helpString:format("zone", L["Print zone information."]))
				end
			elseif key == "id" then
				if not self.db.global.debug then
					self:Print(L["Debugging must be enabled to use this command."])
				else
					local tarId = GetTargetId()
					if tarId == nil then
						self:Print(L["Unable to determine target's ID."])
					else
						local entry = (self.rares[tarId] ~= nil) and "True" or "False"
						self:Print(("%s: %s"):format(UnitName("target"), tarId))
						self:Print(("%s: %s, %s: %s"):format(L["Has Entry"], entry, L["Valid NPC"], tostring(self:ValidNPC(tarId))))
					end
				end
			elseif key == "zone" then
				if not self.db.global.debug then
					self:Print(L["Debugging must be enabled to use this command."])
				else
					self:Print(("%s: %s"):format(L["Zone ID:"], C_Map_GetBestMapForUnit("player")))
				end
			elseif
				key == "tear" or key == "key" or key == "crate" or key == "cache" or key == "teleporter" or key == "tele" or
					key == "maelie"
			 then
				if self.correctZone then
					local genId = GetGeneralChannelNumber()
					local bestMap = C_Map_GetBestMapForUnit("player")
					local tarPos = C_Map_GetPlayerMapPosition(C_Map_GetBestMapForUnit("player"), "player")
					C_Map_SetUserWaypoint(UiMapPoint.CreateFromCoordinates(bestMap, tarPos.x, tarPos.y))
					SendChatMessage(
						(L["%s at %s, %s! %s"]):format(
							GetVerbage(key:lower()),
							ceil(tarPos.x * 10000) / 100,
							ceil(tarPos.y * 10000) / 100,
							C_Map_GetUserWaypointHyperlink()
						),
						self.db.global.output:upper(),
						nil,
						self.db.global.output:upper() == "CHANNEL" and genId or nil
					)
					C_Map_ClearUserWaypoint()
				else
					self:Print(L["You must be in a valid zone to send announcements."])
				end
			else
				local tarId = GetTargetId()
				if self.correctZone and self:ValidNPC(tarId) and not UnitIsDead("target") then
					self:AnnounceRare(tonumber(tarId), tonumber(UnitHealth("target")), tonumber(UnitHealthMax("target")))
				elseif self.correctZone and self:ValidNPC(tarId) and UnitIsDead("target") then
					self:Print(L["You cannot announce a dead rare's position."])
				elseif not self.correctZone then
					self:Print(L["You must be in a valid zone to send announcements."])
				else
					self:Print(L["Target does not meet criteria to be announced."])
				end
			end
		end
	)
end

function AR:InitFrame()
	self.frame:ClearAllPoints()
	self.frame:SetPoint("CENTER")
	self.frame:SetWidth(36)
	self.frame:SetHeight(36)

	local button = CreateFrame("Button", "AR_AnnounceButton", _G["AR_Frame"])
	button:SetHeight(36)
	button:SetWidth(36)
	button:SetPoint("TOP", 0, -3)

	local image = button:CreateTexture(nil, "BACKGROUND")
	image:SetAllPoints()
	image:SetTexture("Interface\\Addons\\AnnounceRare\\Textures\\icon.tga")

	button:RegisterForClicks("AnyDown")

	button:SetScript(
		"OnClick",
		function()
			AR.frame:Hide()
		end
	)
	self.frame.button = button
end

function AR:OnInitialize()
	-- setup database and config ui
	self.db = LibStub("AceDB-3.0"):New("AnnounceRareDB", defaults)
	LibStub("AceConfig-3.0"):RegisterOptionsTable("Announce Rare", options)
	self.optionsUI = LibStub("AceConfigDialog-3.0"):AddToBlizOptions("Announce Rare", "Announce Rare")

	self.debug = self.db.global.debug

	--[[ create the notify frame
	self.frame = CreateFrame("Frame", "AR_Frame", UIParent, BackdropTemplate)
	self.frame:SetResizable(false)
	self.frame:SetClampedToScreen(true)
	self:InitFrame()
	--self.frame:Hide()]]
	if self.db.global.onLoad == true then
		self:Print((L["AnnounceRare v%s loaded! Please use |cffffff00/rare help|r for commands."]):format(self.version))
	end
end
