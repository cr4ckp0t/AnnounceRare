-------------------------------------------------------------------------------
-- Announce Rare (BFA 8.2) By Crackpotx (US, Lightbringer)
-------------------------------------------------------------------------------
local AR = LibStub("AceAddon-3.0"):NewAddon("AnnounceRare", "AceConsole-3.0", "AceEvent-3.0", "AceTimer-3.0")
local CTL = assert(ChatThrottleLib, "AnnounceRare requires ChatThrottleLib.")

-- local api cache
local C_Map_GetBestMapForUnit = C_Map.GetBestMapForUnit
local C_Map_GetPlayerMapPosition = C_Map.GetPlayerMapPosition
local GetPlayerMapPosition = GetPlayerMapPosition
local GetZoneText = GetZoneText
local SendChatMessage = SendChatMessage
local UnitAffectingCombat = UnitAffectingCombat
local UnitClassification = UnitClassification
local UnitExists = UnitExists
local UnitHealth = UnitHealth
local UnitHealthMax = UnitHealthMax
local UnitIsDead = UnitIsDead
local UnitName = UnitName

local ceil = math.ceil
local format = string.format
local tostring = tostring

local messageToSend = "<NAME> (<HEALTH>) is at <COORDS>, and <COMBAT>"
local healthString = "%s/%s %.2f"
local coordString = "%s %s"
local defaults = {
	global = {
		autoAnnounce = false,
	}
}

local function FormatNumber(n)
    if n >= 10^6 then
        return format("%.2fm", n / 10^6)
    elseif n >= 10^3 then
        return format("%.2fk", n / 10^3)
    else
        return tostring(n)
    end
end

local function DecRound(num, decPlaces)
	return format("%." .. (decPlaces or 0) .. "f", num)
end

local function AnnounceRare()
	-- player target is a rare
	local tarName, tarCombat = UnitName("target"), UnitAffectingCombat("target")
	local tarHealth, tarHealthMax = UnitHealth("target"), UnitHealthMax("target")
	local tarHealthPercent = (tarHealth / tarHealthMax) * 100
	local tarPos = C_Map_GetPlayerMapPosition(C_Map_GetBestMapForUnit("player"), "player")

	-- fill in the wildcards
	local chatMsg = messageToSend:gsub("<NAME>", UnitName("target"))
	chatMsg = chatMsg:gsub("<HEALTH>", healthString:format(FormatNumber(tarHealth), FormatNumber(tarHealthMax), tarHealthPercent) .. "%%")
	chatMsg = chatMsg:gsub("<COORDS>", coordString:format(ceil(tarPos.x * 10000) / 100, ceil(tarPos.y * 10000) / 100))
	chatMsg = chatMsg:gsub("<COMBAT>", UnitAffectingCombat("target") and "has been engaged!" or "has NOT been engaged!")

	-- send the message
	CTL:SendChatMessage("NORMAL", "AnnounceRare", chatMsg, "CHANNEL", "COMMON", 1)
end

local function FindInArray(toFind, arraySearch)
	for _, value in pairs(arraySearch) do
		if value == toFind then
			return true
		end
	end
	return false
end

function AR:Print(msg)
	print(("|cffffff00AnnounceRare:|r |cffffffff%s|r"):format(msg))
end

function AR:PLAYER_TARGET_CHANGED()
	if self.db.global.autoAnnounce then
		local zoneText = GetZoneText()
		local tarClass = UnitClassification("target")
			-- only do anything when the player is in mechagon or nazjatar
		if zoneText:lower() == "mechagon" or zoneText:lower() == "nazjatar" then
			if UnitExists("target") and (tarClass == "rare" or tarClass == "rareelite") and not UnitIsDead("target") then
				if not FindInArray(UnitName("target"), self.rares) then
					-- announce the rare
					AnnounceRare()

					-- add it to the filter
					self.rares[#self.rares + 1] = UnitName("target")
				else
					self:Print("Announcement suppressed due to throttle limit.")
				end
			end
		end
	end
end

function AR:PLAYER_ENTERING_WORLD()
	self.rares = {}

	self:RegisterChatCommand("rare", function(args)
		if args == "auto" then
			self.db.global.autoAnnounce = not self.db.global.autoAnnounce
			self:Print("Auto Announce has been " .. (self.db.global.autoAnnounce == true and "ENABLED!" or "DISABLED"))
		elseif args == "autostatus" then
			self:Print("Auto Announce is " .. (self.db.global.autoAnnounce == true and "ENABLED!" or "DISABLED!"))
		elseif args == "armory" then
			if GetZoneText():lower() == "mechagon" then
				local tarPos = C_Map_GetPlayerMapPosition(C_Map_GetBestMapForUnit("player"), "player")
				CTL:SendChatMessage("NORMAL", "AnnounceRare", ("Armory is located at %s"):format(coordString:format(ceil(tarPos.x * 10000) / 100, ceil(tarPos.y * 10000) / 100)), "CHANNEL", "COMMON", 1)
			else
				self:Print("You must be in Mechagon to announce armories.")
			end
		else
			local zoneText = GetZoneText()
			-- only do anything when the player is in mechagon or nazjatar
			if zoneText:lower() == "mechagon" or zoneText:lower() == "nazjatar" then
				local tarClass = UnitClassification("target")
				if UnitExists("target") and (tarClass == "rare" or tarClass == "rareelite") and not UnitIsDead("target") then
					AnnounceRare()

					-- add it to the filter
					self.rares[#self.rares + 1] = UnitName("target")
				elseif not UnitExists("target") then
					self:Print("You do not have a target.")
				elseif UnitIsDead("target") then
					self:Print(format("%s is already dead.", UnitName("target"))) 
				elseif (tarClass ~= "rare" and tarClass ~= "rareelite") then
					self:Print(format("%s is not a rare or you have killed it today.", UnitName("target")))
				end
			else
				self:Print("You must be in Mechagon or Nazjatar to use this command.")
			end
		end
	end)
end

function AR:OnInitialize()
	self.db = LibStub("AceDB-3.0"):New("AnnounceRareDB", defaults)
	self:RegisterEvent("PLAYER_ENTERING_WORLD")
	self:RegisterEvent("PLAYER_TARGET_CHANGED")
end

