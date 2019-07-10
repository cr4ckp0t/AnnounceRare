-------------------------------------------------------------------------------
-- AnnounceRare By Crackpotx (US, Lightbringer)
-------------------------------------------------------------------------------
local AceLocale = LibStub:GetLibrary("AceLocale-3.0")
local L = AceLocale:NewLocale("AnnounceRare", "enUS", true, true)
if not L then return end

L["%s is already dead."] = true
L["%s is not a rare or you have killed it today."] = true
L["%s%s (%s/%s %.2f%%) is at %s %s%s, and %s"] = true
L["%s%s has been slain %sat %02d:%02d!"] = true
L["Advertisements have been %s!"] = true
L["Advertisements: %s"] = true
L["AnnounceRare by Crackpotx v%s"] = true
L["AnnounceRare v%s loaded! Please use |cffffff00/rare help|r for commands."] = true
L["Armory is located at %s %s!"] = true
L["Auto Announce has been %s!"] = true
L["Automatic Announcements: %s"] = true
L["Changed output to %s!"] = true
L["Command Line Help"] = true
L["Death Announcements have been %s!"] = true
L["Death Announcements: %s"] = true
L["For Help: |cffffff00/rare help|r"] = true
L["Load Announcement: %s"] = true
L["Loading message has been %s!"] = true
L["Output Channel: |cffffff00%s|r"] = true
L["Unable to determine your general channel number."] = true
L["Valid Outputs: %s, %s, %s, %s, %s, %s"] = true
L["You do not have a target."] = true
L["You must be in Mechagon or Nazjatar to use this command."] = true
L["You must be in Mechagon to announce armories."] = true
L["You must provide an output channel for the announcements."] = true
L["general"] = true
L["guild"] = true
L["has NOT been engaged!"] = true
L["has been engaged!"] = true
L["in the alternative timeline"] = true
L["party"] = true
L["raid"] = true
L["say"] = true
L["yell"] = true
L["|cff00ff00ENABLED|r"] = true
L["|cffff0000DISABLED|r"] = true
L["|cffffff00/rare armory|r - Announce Mechagon armory location to general chat."] = true
L["|cffffff00/rare auto|r - Toggle auto announcements."] = true
L["|cffffff00/rare death|r - Toggle death announcements."] = true
L["|cffffff00/rare help|r or |cffffff00/rare ?|r - Print this help again."] = true
L["|cffffff00/rare load|r - Toggle loading announcement."] = true
L["|cffffff00/rare output (general|say|yell|guild|party|raid)|r - Change output channel."] = true
L["|cffffff00/rare status|r or |cffffff00/rare config|r - Print current configuration."] = true
L["|cffffff00/rare|r - Announce rare to general chat."] = true
