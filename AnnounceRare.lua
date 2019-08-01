-------------------------------------------------------------------------------
-- Announce Rare (BFA 8.2) By Crackpotx (US, Lightbringer)
-------------------------------------------------------------------------------
local AR = LibStub("AceAddon-3.0"):NewAddon("AnnounceRare", "AceComm-3.0", "AceConsole-3.0", "AceEvent-3.0", "AceTimer-3.0")
local CTL = assert(ChatThrottleLib, "AnnounceRare requires ChatThrottleLib.")
local L = LibStub("AceLocale-3.0"):GetLocale("AnnounceRare", false)

-- local api cache
local C_ChatInfo_GetNumActiveChannels = C_ChatInfo.GetNumActiveChannels
local C_Map_GetBestMapForUnit = C_Map.GetBestMapForUnit
local C_Map_GetMapInfo = C_Map.GetMapInfo
local C_Map_GetPlayerMapPosition = C_Map.GetPlayerMapPosition
local CombatLogGetCurrentEventInfo = _G["CombatLogGetCurrentEventInfo"]
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

AR.title = GetAddOnMetadata("Lorewalkers", "Title")
AR.version = GetAddOnMetadata("AnnounceRare", "Version")
AR.cooldown = 180 -- 3 minutes

local band = bit.band
local ceil = math.ceil
local match = string.match
local format = string.format
local pairs = pairs
local strsplit = strsplit
local tonumber = tonumber
local tostring = tostring

local outputChannel = "|cffffff00%s|r"
local messageToSend = L["%s%s (%s/%s %.2f%%) is at %s %s%s, and %s"]
local deathMessage = L["%s%s has been slain %sat %02d:%02d server time!"]
local defaults = {
	global = {
		armory = true,
		autoAnnounce = false,
		advertise = false,
		announceDeath = true,
		debug = false,
		drill = true,
		lastSeen = nil,
		lastTime = 0,
		monitor = true,
		onLoad = false,
		output = "CHANNEL",
		tomtom = true,
	}
}

-- regex for chat monitoring

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
			width = "full",
		},
		general = {
			type = "group",
			order = 2,
			name = L["General Options"],
			guiInline = true,
			args = {
				advertise = {
					type = "toggle",
					order = 1,
					name = L["Advertise AR"],
					desc = L["Adds a prefix to chat messages with the name of the addon."],
					get = function(info) return AR.db.global.advertise end,
					set = function(info, value) AR.db.global.advertise = value end,
				},
				onLoad = {
					type = "toggle",
					order = 2,
					name = L["Loading Message"],
					desc = L["Display a loading message when the addon first loads."],
					get = function(info) return AR.db.global.onLoad end,
					set = function(info, value) AR.db.global.onLoad = value end,
				},
				monitor = {
					type = "toggle",
					order = 3,
					name = L["Monitor Chat"],
					desc = L["Monitor chat for announcements from other users. This is used as a throttle, or to direct you to a rare via TomTom waypoints (if enabled)."],
					get = function(info) return AR.db.global.monitor end,
					set = function(info, value) AR.db.global.monitor = value end,
				},
				debug = {
					type = "toggle",
					order = 4,
					name = L["Debugging"],
					desc = L["Enable this to assist with fixing a bug or unintended functionality."],
					get = function(info) return AR.db.global.debug end,
					set = function(info, value) AR.db.global.debug = value; self.debug = value end,
				},
			},
		},
		announcements = {
			type = "group",
			order = 3,
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
						["OFFICER"] = L["Officer"],
					},
					get = function(info) return AR.db.global.output end,
					set = function(info, value) AR.db.global.output = value end,
				},
				autoAnnounce = {
					type = "toggle",
					order = 2,
					name = L["Auto Announce"],
					desc = L["Automatically announce rares when targeting one in Mechagon or Nazjatar."],
					get = function(info) return AR.db.global.autoAnnounce end,
					set = function(info, value) AR.db.global.autoAnnounce = value end,
				},

				announceDeath = {
					type = "toggle",
					order = 3,
					name = L["Announce Death"],
					desc = L["Automatically announce when a rare dies."],
					get = function(info) return AR.db.global.announceDeath end,
					set = function(info, value) AR.db.global.announceDeath = value end,
				},
				armory = {
					type = "toggle",
					order = 4,
					name = L["Announce Armories"],
					desc = L["Automatically announces armories when you mouseover a broken one, or mouseover the various items."],
					get = function(info) return AR.db.global.armory end,
					set = function(info, value) AR.db.global.armory = value end,
				},
				drill = {
					type = "toggle",
					order = 5,
					name = L["Drill Announcements"],
					desc = L["Announce drill sites to let people know what mob is about to be available."],
					get = function(info) return AR.db.global.drill end,
					set = function(info, value) AR.db.global.drill = value end,
				},
				tomtom = {
					type = "toggle",
					order = 6,
					name = L["TomTom Waypoints"],
					desc = L["Automatically create TomTom waypoints for you when a drill site is activated.\n\n|cffff0000REQUIRES TOMTOM ADDON!|r"],
					disabled = function() return not AR.db.global.drill end,
					get = function(info) return AR.db.global.tomtom end,
					set = function(info, value)
						AR.db.global.tomtom = value
						if value then
							AR.tomtom = IsAddOnLoaded("TomTom")
						end
					end,
				},
			},
		},
	}
}

local function GetTargetId()
	local guid = UnitGUID("target")
	if guid == nil then return nil end
	local unitType, _, _, _, _, unitId = strsplit("-", guid);
	return (unitType == "Creature" or UnitType == "Vehicle") and tonumber(unitId) or nil
end

local function GetNPCGUID(guid)
	if guid == nil then return nil end
	local unitType, _, _, _, _, unitId = strsplit("-", guid);
	return (unitType == "Creature" or UnitType == "Vehicle") and tonumber(unitId) or nil
end

local function GetGeneralChannelNumber()
	local channelFormat = "%s - %s"
	local channelRUFormat = "%s: %s"
	local zoneText = GetZoneText()
	local general = EnumerateServerChannels()
	if zoneText == nil or general == nil then return false end
	return GetChannelName(GetLocale() == "ruRU" and channelRUFormat:format(general, zoneText) or channelFormat:format(general, zoneText))
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
    if n >= 10^6 then
        return format("%.2fm", n / 10^6)
    elseif n >= 10^3 then
        return format("%.2fk", n / 10^3)
    else
        return tostring(n)
    end
end

local function FindInArray(toFind, arraySearch)
	if #arraySearch == 0 then return false end
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

local function ValidNPC(id)
	return (AR.correctZone and AR.zoneText ~= nil and AR.rares[AR.zoneText] ~= nil and AR.rares[AR.zoneText][id] ~= nil) and true or false
end

function AR:GetRareIDByName(name)
	for key, value in pairs(self.rares["mechagon"]) do
		if value.name == name then
			return key
		end
	end
	for key, value in pairs(self.rares["nazjatar"]) do
		if value.name == name then
			return key
		end
	end
	return false
end

function AR:UpdateDuplicates(id)
	if id == 151884 then
		self.rares["mechagon"][135497].announced = true
	elseif id == 135497 then
		self.rares["mechagon"][151884].announced = true
	elseif id == 151625 then
		self.rares["mechagon"][151623].announced = true
	elseif id == 151623 then
		self.rares["mechagon"][151625].announced = true
	elseif id == 152569 then
		self.rares["mechagon"][152570].announced = true
		self.rares["mechagon"][149847].announced = true
	elseif id == 152570 then
		self.rares["mechagon"][152569].announced = true
		self.rares["mechagon"][149847].announced = true
	elseif id == 149847 then
		self.rares["mechagon"][152569].announced = true
		self.rares["mechagon"][152570].announced = true
	end
end

function AR:AnnounceRare()
	local tarId, tarCombat = GetTargetId(), UnitAffectingCombat("target")
	local tarHealth, tarHealthMax = UnitHealth("target"), UnitHealthMax("target")
	local tarPos = C_Map_GetPlayerMapPosition(C_Map_GetBestMapForUnit("player"), "player")
	local genId = GetGeneralChannelNumber()

	-- internal cooldown of 3 minutes to prevent spam
	if self.lastSeen == tarId and self.lastTime < time() - self.cooldown then
		return
	end

	if tarId == nil then
		self:Print(L["Unable to determine target's GUID."])
	elseif AR.db.global.output:upper() == "CHANNEL" and not genId then
		self:Print(L["Unable to determine your general channel number."])
	else
		CTL:SendChatMessage("NORMAL", "AnnounceRare", messageToSend:format(
			self.db.global.advertise == true and "AnnounceRare: " or "",
			self.rares[self.zoneText][tarId].name,
			FormatNumber(tarHealth),
			FormatNumber(tarHealthMax),
			(tarHealth / tarHealthMax) * 100,
			ceil(tarPos.x * 10000) / 100,
			ceil(tarPos.y * 10000) / 100,
			IsInAltTimeline() == true and " " .. L["in the alternative timeline"] or "",
			UnitAffectingCombat("target") == true and L["has been engaged!"] or L["has NOT been engaged!"]
		), self.db.global.output:upper(), nil, self.db.global.output:upper() == "CHANNEL" and genId or nil)
		
		-- update multiple ids from one sighting
		if self.zoneText == "mechagon" then self:UpdateDuplicates(tarId) end

		self.db.global.lastSeen = tarId
		self.db.global.lastTime = time()
		self.rares[self.zoneText][tarId].announced = true
	end
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

	self.lastWaypoint = TomTom:AddWaypoint(C_Map_GetBestMapForUnit("player"), x / 100, y / 100, {
		title = name,
		persistent = false,
		minimap = true,
		world = true
	})

	-- create an auto expire timer
	if self.tomtomExpire ~= false then self.tomtomExpire:Cancel() end
	self.tomtomExpire = self:ScheduleTimer(120, function()
		if AR.lastWaypoint ~= nil and AR.lastWaypoint ~= false then
			TomTom:RemoveWaypoint(AR.lastWaypoint)
		end
	end)
end

function AR:CheckZone(...)
	local mapId = C_Map_GetBestMapForUnit("player")
	if mapId == nil then
		self.correctZone = false
	else
		local mapInfo = C_Map_GetMapInfo(mapId)
		-- mechagon: 1462, nazjatar: 1355
		if (mapId == 1355 or mapInfo["parentMapID"] == 1355) or (mapId == 1462 or mapInfo["parentMapID"] == 1462) and self.correctZone == false then
			self.correctZone = true
			self.zoneText = mapId == 1462 and "mechagon" or "nazjatar"
		elseif ((mapId ~= 1355 and mapInfo["parentMapID"] ~= 1355 and mapId ~= 1462 and mapInfo["parentMapID"] ~= 1462) or mapId == nil) and self.correctZone == true then
			self.correctZone = false
			self.zoneText = nil
		end
	end
end

function AR:DebugPrint(msg)
	print(("|cffffffff%s:|r |cffffff00%s|r"):format(L["AR2 Log"], msg))
end

function AR:Print(msg)
	print(("|cffff7d0a%s:|r |cffffffff%s|r"):format(L["AR2"], msg))
end

function AR:PLAYER_TARGET_CHANGED()
	if self.db.global.autoAnnounce and self.correctZone and self.zoneText ~= nil then
		local tarId = GetTargetId()
		if tarId ~= nil and ValidNPC(tarId) and self.rares[self.zoneText][tarId].announced == false then
			if self.debug == true then
				self:DebugPrint((L["Announcing Rare: %s (%s)"]):format(UnitName("target"), tarId))
			end
			self:AnnounceRare()
		end
	end
end

function AR:COMBAT_LOG_EVENT_UNFILTERED()
	local _, subevent, _, _, _, sourceFlags, _, srcGuid, srcName = CombatLogGetCurrentEventInfo()
	if subevent == "UNIT_DIED" and self.correctZone then
		local id = GetNPCGUID(srcGuid)
		if id ~= 151623 and self.db.global.announceDeath == true and self.rares[self.zoneText] ~= nil and self.rares[self.zoneText][id] ~= nil then
			local hours, minutes = GetGameTime()
			local genId = GetGeneralChannelNumber()

			if id == nil then
				self:Print(L["Unable to determine the NPC's GUID."])
			elseif self.db.global.output:upper() == "CHANNEL" and not genId then
				self:Print(L["Unable to determine your general channel number."])
			else
				if self.debug == true then
					self:DebugPrint((L["Announcing Rare Death: %s (%s)"]):format(srcName, id))
				end
				CTL:SendChatMessage("NORMAL", "AnnounceRare", deathMessage:format(
					self.db.global.advertise == true and "AnnounceRare: " or "",
					self.rares[self.zoneText][id].name,
					IsInAltTimeline() == true and L["in the alternative timeline"] .. " " or "",
					hours,
					minutes
				), self.db.global.output:upper(), nil, self.db.global.output:upper() == "CHANNEL" and genId or nil)
			end
		end
	end
end

function AR:UPDATE_MOUSEOVER_UNIT(...)
	if self.correctZone then
		local ttItemName = GameTooltip:GetUnit()
		local armoryName = GetItemInfo(169868)
		if self.db.global.armory and (ttItemName == "Broken Rustbolt Armory" or ttItemName == armoryName) and self.lastArmory <= time() - self.cooldown then
			local genId = GetGeneralChannelNumber()
			local tarPos = C_Map_GetPlayerMapPosition(C_Map_GetBestMapForUnit("player"), "player")
			if self.debug then
				self:DebugPrint((L["Announcing Armory at %s, %s"]):format(ceil(tarPos.x * 10000) / 100, ceil(tarPos.y * 10000) / 100))
			end
			CTL:SendChatMessage("NORMAL", "AnnounceRare", (L["%sArmory is located at %s, %s!"]):format(
				ttItemName == "Broken Rustbolt Armory" and L["Broken"] .. " " or "",
				ceil(tarPos.x * 10000) / 100,
				ceil(tarPos.y * 10000) / 100
			), self.db.global.output:upper(), nil, self.db.global.output:upper() == "CHANNEL" and genId or nil)
			self.lastArmory = time()
		end
	end
end

function AR:CHAT_MSG_CHANNEL(self, msg, ...)
	if self.db.global.monitor and self.correctZone and self.zoneText ~= nil then

	end
end

function AR:CHAT_MSG_MONSTER_EMOTE(self, msg, ...)
	if self.db.global.drill and self.correctZone and msg:match("DR-") then		
		local x, y, drill, rareName
		if msg:match("DR-TR28") then
			x, y = 56.25, 36.25
			drill = "DR-TR28"
			rareName = L["Ol' Big Tusk"]
		elseif msg:match("DR-TR35") then
			x, y = 63, 25.75
			drill = "DR-TR35"
			rareName = L["Earthbreaker Gulroc"]
		elseif msg:match("DR-CC61") then
			x, y = 72.71, 53.93
			drill = "DR-CC61"
			rareName = L["Gorged Gear-Cruncher"]
		elseif msg:match("DR-CC73") then
			x, y = 66.50, 58.85
			drill = "DR-CC73"
			rareName = L["Caustic Mechaslime"]
		elseif msg:match("DR-CC88") then
			x, y = 68.40, 48
			drill = "DR-CC88"
			rareName = L["The Kleptoboss"]
		elseif msg:match("DR-JD41") then
			x, y = 51.25, 50.20
			drill = "DR-JD41"
			rareName = L["Boilburn"]
		elseif msg:match("DR-JD99") then
			x, y = 59.75, 67.25
			drill = "DR-JD99"
			rareName = L["Gemicide"]
		else
			return
		end

		CTL:SendChatMessage("NORMAL", "AnnounceRare", (L["%s (%s) is up at %s %s."]):format(
			drill,
			rareName,
			x,
			y	
		), self.db.global.output:upper(), nil, self.db.global.output:upper() == "CHANNEL" and genId or nil)
		
		-- create waypoint
		if self.db.global.tomtom and self.tomtom then
			self:CreateWaypoint(x, y, ("%s: %s"):format(drill, rareName))
		end
	end
end

function AR:PLAYER_ENTERING_WORLD()
	-- init some stuff
	self.rares = {}
	self.correctZone = false
	self.lastArmory = 0
	self:CheckZone()

	-- tomtom waypoint settings
	self.tomtom = IsAddOnLoaded("TomTom")
	self.lastWaypoint = false
	self.tomtomExpire = false

	-- chat command using aceconsole-3.0
	self:RegisterChatCommand("rare", function(args)
		local key = self:GetArgs(args, 1)
		local helpString = "|cffffff00/rare %s|r - %s"
		if key == L["config"] then
			LibStub("AceConfigDialog-3.0"):Open("Announce Rare")
			self:Print(L["Displaying configuration options."])
		elseif key == L["help"] or key == "?" then
			self:Print(L["Command Line Help"])
			self:Print((L["|cffffff00/rare|r - %s"]):format(L["Announce rare to output channel."]))
			self:Print(helpString:format(L["config"], L["Display configuration window."]))
			self:Print(helpString:format(L["help"], L["Print some help."]))
		else 
			local tarId = GetTargetId()
			if self.correctZone and self.zoneText ~= nil and ValidNPC(tarId) then
				self:AnnounceRare()
			else
				self:Print(L["You must be in Mechagon or Nazjatar to use this command."])
			end
		end
	end)

	if self.db.global.onLoad == true then
		self:Print((L["AnnounceRare v%s loaded! Please use |cffffff00/rare help|r for commands."]):format(self.version))
	end
end

function AR:OnInitialize()
	-- setup database and config ui
	self.db = LibStub("AceDB-3.0"):New("AnnounceRareDB", defaults)
	LibStub("AceConfig-3.0"):RegisterOptionsTable("Announce Rare", options)
	self.optionsUI = LibStub("AceConfigDialog-3.0"):AddToBlizOptions("Announce Rare", "Announce Rare")

	self.debug = self.db.global.debug

	-- register our events
	self:RegisterEvent("CHAT_MSG_MONSTER_EMOTE")
	--self:RegisterEvent("CHAT_MSG_CHANNEL")
	self:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
	self:RegisterEvent("PLAYER_ENTERING_WORLD")
	self:RegisterEvent("PLAYER_TARGET_CHANGED")
	self:RegisterEvent("UPDATE_MOUSEOVER_UNIT")
	self:RegisterEvent("ZONE_CHANGED", function() AR:CheckZone() end)
	self:RegisterEvent("ZONE_CHANGED_NEW_AREA", function() AR:CheckZone() end)
end

AR.rares = {
	["mechagon"] = {
		[151934] = {
			["name"] = L["Arachnoid Harvester"],
			["announced"] = false
		},
		[150394] = {
			["name"] = L["Armored Vaultbot"],
			["announced"] = false
		},
		[153200] = {
			["name"] = L["Boilburn"],
			["announced"] = false
		},
		[151308] = {
			["name"] = L["Boggac Skullbash"],
			["announced"] = false
		},
		[152001] = {
			["name"] = L["Bonepicker"],
			["announced"] = false
		},
		[154739] = {
			["name"] = L["Caustic Mechaslime"],
			["announced"] = false
		},
		[151569] = {
			["name"] = L["Deepwater Maw"],
			["announced"] = false
		},
		[150342] = {
			["name"] = L["Earthbreaker Gulroc"],
			["announced"] = false
		},
		[154153] = {
			["name"] = L["Enforcer KX-T57"],
			["announced"] = false
		},
		[151202] = {
			["name"] = L["Foul Manifestation"],
			["announced"] = false
		},
		[151884] = {
			["name"] = L["Fungarian Furor"],
			["announced"] = false
		},
		[135497] = {
			["name"] = L["Fungarian Furor"],
			["announced"] = false
		},
		[153228] = {
			["name"] = L["Gear Checker Cogstar"],
			["announced"] = false
		},
		[153205] = {
			["name"] = L["Gemicide"],
			["announced"] = false
		},
		[154701] = {
			["name"] = L["Gorged Gear-Cruncher"],
			["announced"] = false
		},
		[151684] = {
			["name"] = L["Jawbreaker"],
			["announced"] = false
		},
		[152007] = {
			["name"] = L["Killsaw"],
			["announced"] = false
		},
		[151933] = {
			["name"] = L["Malfunctioning Beastbot"],
			["announced"] = false
		},
		[151124] = {
			["name"] = L["Mechagonian Nullifier"],
			["announced"] = false
		},
		[151672] = {
			["name"] = L["Mecharantula"],
			["announced"] = false
		},
		[151627] = {
			["name"] = L["Mr. Fixthis"],
			["announced"] = false
		},
		[151296] = {
			["name"] = L["OOX-Avenger/MG"],
			["announced"] = false
		},
		[153206] = {
			["name"] = L["Ol' Big Tusk"],
			["announced"] = false
		},
		[152764] = {
			["name"] = L["Oxidized Leachbeast"],
			["announced"] = false
		},
		[151702] = {
			["name"] = L["Paol Pondwader"],
			["announced"] = false
		},
		[150575] = {
			["name"] = L["Rumblerocks"],
			["announced"] = false
		},
		[152182] = {
			["name"] = L["Rustfeather"],
			["announced"] = false
		},
		[155583] = {
			["name"] = L["Scrapclaw"],
			["announced"] = false
		},
		[150937] = {
			["name"] = L["Seaspit"],
			["announced"] = false
		},
		[153000] = {
			["name"] = L["Sparkqueen P'Emp"],
			["announced"] = false
		},
		[153226] = {
			["name"] = L["Steel Singer Freza"],
			["announced"] = false
		},
		[155060] = {
			["name"] = L["The Doppel Gang"],
			["announced"] = false
		},
		[152113] = {
			["name"] = L["The Kleptoboss"],
			["announced"] = false
		},
		[151940] = {
			["name"] = L["Uncle T'Rogg"],
			["announced"] = false
		},
		[151625] = {
			["name"] = L["The Scrap King"],
			["announced"] = false
		},
		[151623] = {
			["name"] = L["The Scrap King (Mounted)"],
			["announced"] = false
		},
		[154342] = {
			["name"] = L["Arachnoid Harvester (Alt Time)"],
			["announced"] = false
		},
		[154225] = {
			["name"] = L["The Rusty Prince (Alt Time)"],
			["announced"] = false
		},
		[154968] = {
			["name"] = L["Armored Vaultbot (Alt Time)"],
			["announced"] = false
		},
		[152569] = {
			["name"] = L["Crazed Trogg (Green)"],
			["announced"] = false
		},
		[152570] = {
			["name"] = L["Crazed Trogg (Blue)"],
			["announced"] = false
		},
		[149847] = {
			["name"] = L["Crazed Trogg (Orange)"],
			["announced"] = false
		},
	},
	["nazjatar"] = {
		[152415] = {
			["name"] = L["Alga the Eyeless"],
			["announced"] = false
		},                 
		[152681] = {
			["name"] = L["Prince Typhonus"],
			["announced"] = false
		},                  
		[153658] = {
			["name"] = L["Shiz'narasz the Consumer"],
			["announced"] = false
		},         
		[151719] = {
			["name"] = L["Voice in the Deeps"],
			["announced"] = false
		},               
		[152794] = {
			["name"] = L["Amethyst Spireshell"],
			["announced"] = false
		},              
		[152756] = {
			["name"] = L["Daggertooth Terror"],
			["announced"] = false
		},               
		[144644] = {
			["name"] = L["Mirecrawler"],
			["announced"] = false
		},                      
		[152465] = {
			["name"] = L["Needlespine"],
			["announced"] = false
		},                      
		[152795] = {
			["name"] = L["Sandclaw Stoneshell"],
			["announced"] = false
		},              
		[150191] = {
			["name"] = L["Avarius"],
			["announced"] = false
		},                          
		[152361] = {
			["name"] = L["Banescale the Packfather"],
			["announced"] = false
		},         
		[149653] = {
			["name"] = L["Carnivorous Lasher"],
			["announced"] = false
		},               
		[152323] = {
			["name"] = L["King Gakula"],
			["announced"] = false
		},                      
		[150583] = {
			["name"] = L["Rockweed Shambler"],
			["announced"] = false
		},                
		[151870] = {
			["name"] = L["Sandcastle"],
			["announced"] = false
		},                       
		[153898] = {
			["name"] = L["Tidelord Aquatus"],
			["announced"] = false
		},                 
		[153928] = {
			["name"] = L["Tidelord Dispersius"],
			["announced"] = false
		},              
		[154148] = {
			["name"] = L["Tidemistress Leth'sindra"],
			["announced"] = false
		},         
		[150468] = {
			["name"] = L["Vor'koth"],
			["announced"] = false
		},                         
		[152566] = {
			["name"] = L["Anemonar"],
			["announced"] = false
		},                         
		[152567] = {
			["name"] = L["Kelpwillow"],
			["announced"] = false
		},                       
		[152397] = {
			["name"] = L["Oronu"],
			["announced"] = false
		},                            
		[152568] = {
			["name"] = L["Urduu"],
			["announced"] = false
		},                            
		[152548] = {
			["name"] = L["Scale Matriarch Gratinax"],
			["announced"] = false
		},         
		[152542] = {
			["name"] = L["Scale Matriarch Zodia"],
			["announced"] = false
		},            
		[152545] = {
			["name"] = L["Scale Matriarch Vynara"],
			["announced"] = false
		},           
		[152712] = {
			["name"] = L["Blindlight"],
			["announced"] = false
		},                       
		[152556] = {
			["name"] = L["Chasm-Haunter"],
			["announced"] = false
		},                    
		[152291] = {
			["name"] = L["Deepglider"],
			["announced"] = false
		},                       
		[152555] = {
			["name"] = L["Elderspawn Nalaada"],
			["announced"] = false
		},               
		[152414] = {
			["name"] = L["Elder Unu"],
			["announced"] = false
		},                        
		[152553] = {
			["name"] = L["Garnetscale"],
			["announced"] = false
		},                      
		[152448] = {
			["name"] = L["Iridescent Glimmershell"],
			["announced"] = false
		},          
		[152682] = {
			["name"] = L["Prince Vortran"],
			["announced"] = false
		},                   
		[152552] = {
			["name"] = L["Shassera"],
			["announced"] = false
		},                         
		[152359] = {
			["name"] = L["Siltstalker the Packmother"],
			["announced"] = false
		},       
		[152290] = {
			["name"] = L["Soundless"],
			["announced"] = false
		},                        
		[152360] = {
			["name"] = L["Toxigore the Alpha"],
			["announced"] = false
		},               
		[152416] = {
			["name"] = L["Allseer Oma'kill"],
			["announced"] = false
		}, 
	}
}