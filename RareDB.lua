-------------------------------------------------------------------------------
-- Announce Rare By Crackpot
-------------------------------------------------------------------------------
local AR = LibStub("AceAddon-3.0"):GetAddon("AnnounceRare")
local L = LibStub("AceLocale-3.0"):GetLocale("AnnounceRare", false)

if not AR then
    return
end

function AR:LoadRares()
    return {
        --Mechagon
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
        -- Nazjatar
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
        -- Uldum
        [157170] = {
            ["name"] = L["Acolyte Taspu"],
            ["announced"] = false
        },
        [158557] = {
            ["name"] = L["Actiss the Deceiver"],
            ["announced"] = false
        },
        [151883] = {
            ["name"] = L["Anaua"],
            ["announced"] = false
        },
        [155703] = {
            ["name"] = L["Anq'uri the Titanic"],
            ["announced"] = false
        },
        [157472] = {
            ["name"] = L["Aphrom the Guise of Madness"],
            ["announced"] = false
        },
        [154578] = {
            ["name"] = L["Aqir Flayer"],
            ["announced"] = false
        },
        [154576] = {
            ["name"] = L["Aqir Titanus"],
            ["announced"] = false
        },
        [162172] = {
            ["name"] = L["Aqir Warcaster"],
            ["announced"] = false
        },
        [162370] = {
            ["name"] = L["Armagedillo"],
            ["announced"] = false
        },
        [152757] = {
            ["name"] = L["Atekhramun"],
            ["announced"] = false
        },
        [162171] = {
            ["name"] = L["Captain Dunewalker"],
            ["announced"] = false
        },
        [162147] = {
            ["name"] = L["Corpse Eater"],
            ["announced"] = false
        },
        [158594] = {
            ["name"] = L["Doomsayer Vathiris"],
            ["announced"] = false
        },
        [158491] = {
            ["name"] = L["Falconer Amenophis"],
            ["announced"] = false
        },
        [157120] = {
            ["name"] = L["Fangtaker Orsa"],
            ["announced"] = false
        },
        [158633] = {
            ["name"] = L["Gaze of N'Zoth"],
            ["announced"] = false
        },
        [158597] = {
            ["name"] = L["High Executor Yothrim"],
            ["announced"] = false
        },
        [158528] = {
            ["name"] = L["High Guard Reshef"],
            ["announced"] = false
        },
        [162163] = {
            ["name"] = L["High Priest Ytaessis"],
            ["announced"] = false
        },
        [151995] = {
            ["name"] = L["Hik-ten the Taskmaster"],
            ["announced"] = false
        },
        [160623] = {
            ["name"] = L["Hungering Miasma"],
            ["announced"] = false
        },
        [155531] = {
            ["name"] = L["Infested Wastewander Captain"],
            ["announced"] = false
        },
        [157134] = {
            ["name"] = L["Ishak of the Four Winds"],
            ["announced"] = false
        },
        [156655] = {
            ["name"] = L["Korzaran the Slaughterer"],
            ["announced"] = false
        },
        [154604] = {
            ["name"] = L["Lord Aj'qirai"],
            ["announced"] = false
        },
        [156078] = {
            ["name"] = L["Magus Rehleth"],
            ["announced"] = false
        },
        [161451] = {
            ["name"] = L["Manipulator Yar'shath"],
            ["announced"] = false
        },
        [157157] = {
            ["name"] = L["Muminah the Incandescent"],
            ["announced"] = false
        },
        [152677] = {
            ["name"] = L["Nebet the Ascended"],
            ["announced"] = false
        },
        [162196] = {
            ["name"] = L["Obsidian Annihilator"],
            ["announced"] = false
        },
        [161467] = {
            ["name"] = L["Portalkeeper Jin'tashal"],
            ["announced"] = false
        },
        [162142] = {
            ["name"] = L["Qho"],
            ["announced"] = false
        },
        [157470] = {
            ["name"] = L["R'aas the Anima Devourer"],
            ["announced"] = false
        },
        [156299] = {
            ["name"] = L["R'khuzj The Unfathomable"],
            ["announced"] = false
        },
        [162173] = {
            ["name"] = L["R'krox the Runt"],
            ["announced"] = false
        },
        [157146] = {
            ["name"] = L["Rotfeaster"],
            ["announced"] = false
        },
        [152040] = {
            ["name"] = L["Scoutmaster Moswen"],
            ["announced"] = false
        },
        [151948] = {
            ["name"] = L["Senbu the Pridefather"],
            ["announced"] = false
        },
        [161033] = {
            ["name"] = L["Shadowmaw"],
            ["announced"] = false
        },
        [156654] = {
            ["name"] = L["Shol'thoss the Doomspeaker"],
            ["announced"] = false
        },
        [160532] = {
            ["name"] = L["Shoth the Darkened"],
            ["announced"] = false
        },
        [157476] = {
            ["name"] = L["Shugshul the Flesh Gorger"],
            ["announced"] = false
        },
        [162140] = {
            ["name"] = L["Skikx'traz"],
            ["announced"] = false
        },
        [162372] = {
            ["name"] = L["Spirit of Cyrus the Black"],
            ["announced"] = false
        },
        [151878] = {
            ["name"] = L["Sun King Nahkotep"],
            ["announced"] = false
        },
        [151897] = {
            ["name"] = L["Sun Priestess Nubitt"],
            ["announced"] = false
        },
        [151609] = {
            ["name"] = L["Sun Prophet Epaphos"],
            ["announced"] = false
        },
        [152657] = {
            ["name"] = L["Tat the Bonechewer"],
            ["announced"] = false
        },
        [158636] = {
            ["name"] = L["The Grand Executor"],
            ["announced"] = false
        },
        [162170] = {
            ["name"] = L["Warcaster Xeshro"],
            ["announced"] = false
        },
        [151852] = {
            ["name"] = L["Watcher Rehu"],
            ["announced"] = false
        },
        [157164] = {
            ["name"] = L["Zealot Tekem"],
            ["announced"] = false
        },
        [162141] = {
            ["name"] = L["Zuythiz"],
            ["announced"] = false
        },
        [157167] = {
            ["name"] = L["Champion Sen-mat"],
            ["announced"] = false
        },
        [152431] = {
            ["name"] = L["Kaneb-ti"],
            ["announced"] = false
        },
        [152788] = {
            ["name"] = L["Uat-ka the Sun's Wrath"],
            ["announced"] = false
        },
        [157188] = {
            ["name"] = L["The Tomb Widow"],
            ["announced"] = false
        },
        [162352] = {
            ["name"] = L["Spirit of Dark Ritualist Zakahn"],
            ["announced"] = false
        },
        [158531] = {
            ["name"] = L["Corrupted Neferset Guard"],
            ["announced"] = false
        },
        [157593] = {
            ["name"] = L["Amalgamation of Flesh"],
            ["announced"] = false
        },
        [158595] = {
            ["name"] = L["Thoughtstealer Vos"],
            ["announced"] = false
        },
        [157473] = {
            ["name"] = L["Yiphrim the Will Ravager"],
            ["announced"] = false
        },
        [157469] = {
            ["name"] = L["Zoth'rum the Intellect Pillager"],
            ["announced"] = false
        },
        [157390] = {
            ["name"] = L["R'oyolok the Reality Eater"],
            ["announced"] = false
        },
        [162765] = {
            ["name"] = L["Friendly Alpaca"],
            ["announced"] = false
        },
        -- Vale of the Eternal Blossoms
        [154087] = {
            ["name"] = L["Zror'um the Infinite"],
            ["announced"] = false
        },
        [154106] = {
            ["name"] = L["Quid"],
            ["announced"] = false
        },
        [159318] = {
            ["name"] = L["Shadow-Walker Yash'gth"],
            ["announced"] = false
        },
        [154332] = {
            ["name"] = L["Voidtender Malketh"],
            ["announced"] = false
        },
        [154394] = {
            ["name"] = L["Veskan the Fallen"],
            ["announced"] = false
        },
        [154447] = {
            ["name"] = L["Brother Meller"],
            ["announced"] = false
        },
        [154467] = {
            ["name"] = L["Chief Mek-mek"],
            ["announced"] = false
        },
        [154490] = {
            ["name"] = L["Rijz'x the Devourer"],
            ["announced"] = false
        },
        [154495] = {
            ["name"] = L["Will of N'Zoth"],
            ["announced"] = false
        },
        [154559] = {
            ["name"] = L["Deeplord Zrihj"],
            ["announced"] = false
        },
        [154600] = {
            ["name"] = L["Teng the Awakened"],
            ["announced"] = false
        },
        [155958] = {
            ["name"] = L["Tashara"],
            ["announced"] = false
        },
        [156083] = {
            ["name"] = L["Sanguifang"],
            ["announced"] = false
        },
        [157153] = {
            ["name"] = L["Ha-Li"],
            ["announced"] = false
        },
        [157160] = {
            ["name"] = L["Houndlord Ren"],
            ["announced"] = false
        },
        [157162] = {
            ["name"] = L["Rei Lun"],
            ["announced"] = false
        },
        [157171] = {
            ["name"] = L["Heixi the Stonelord"],
            ["announced"] = false
        },
        [157176] = {
            ["name"] = L["The Forgotten"],
            ["announced"] = false
        },
        [157183] = {
            ["name"] = L["Coagulated Anima"],
            ["announced"] = false
        },
        [157266] = {
            ["name"] = L["Kilxl the Gaping Maw"],
            ["announced"] = false
        },
        [157267] = {
            ["name"] = L["Escaped Mutation"],
            ["announced"] = false
        },
        [157279] = {
            ["name"] = L["Stormhowl"],
            ["announced"] = false
        },
        [157287] = {
            ["name"] = L["Dokani Obliterator"],
            ["announced"] = false
        },
        [157290] = {
            ["name"] = L["Jade Watcher"],
            ["announced"] = false
        },
        [157291] = {
            ["name"] = L["Spymaster Hul'ach"],
            ["announced"] = false
        },
        [157443] = {
            ["name"] = L["Xiln the Mountain"],
            ["announced"] = false
        },
        [157466] = {
            ["name"] = L["Anh-De the Loyal"],
            ["announced"] = false
        },
        [157468] = {
            ["name"] = L["Tisiphon"],
            ["announced"] = false
        },
        [160810] = {
            ["name"] = L["Harbinger Il'koxik"],
            ["announced"] = false
        },
        [160825] = {
            ["name"] = L["Amber-Shaper Esh'ri"],
            ["announced"] = false
        },
        [160826] = {
            ["name"] = L["Hive-Guard Naz'ruzek"],
            ["announced"] = false
        },
        [160867] = {
            ["name"] = L["Kzit'kovok"],
            ["announced"] = false
        },
        [160868] = {
            ["name"] = L["Harrier Nir'verash"],
            ["announced"] = false
        },
        [160872] = {
            ["name"] = L["Destroyer Krox'tazar"],
            ["announced"] = false
        },
        [160874] = {
            ["name"] = L["Drone Keeper Ak'thet"],
            ["announced"] = false
        },
        [160876] = {
            ["name"] = L["Enraged Amber Elemental"],
            ["announced"] = false
        },
        [160878] = {
            ["name"] = L["Buh'gzaki the Blasphemous"],
            ["announced"] = false
        },
        [160893] = {
            ["name"] = L["Captain Vor'lek"],
            ["announced"] = false
        },
        [160920] = {
            ["name"] = L["Kal'tik the Blight"],
            ["announced"] = false
        },
        [160922] = {
            ["name"] = L["Needler Zhesalla"],
            ["announced"] = false
        },
        [160930] = {
            ["name"] = L["Infused Amber Ooze"],
            ["announced"] = false
        },
        [160968] = {
            ["name"] = L["Jade Colossus"],
            ["announced"] = false
        },
        [159087] = {
            ["name"] = L["Corrupted Bonestripper"],
            ["announced"] = false
        },
        [160906] = {
            ["name"] = L["Skiver"],
            ["announced"] = false
        },
        -- The Maw (From: https://www.wowhead.com/guides/shadowlands-the-maw-events-rares#rare-locations-in-the-maw)
        [157964] = {
            ["name"] = L["Adjutant Dekaris"],
            ["announced"] = false
        },
        [157833] = {
            ["name"] = L["Borr-Geth"],
            ["announced"] = false
        },
        [160770] = {
            ["name"] = L["Darithis the Bleak"],
            ["announced"] = false
        },
        [170711] = {
            ["name"] = L["Dolos"],
            ["announced"] = false
        },
        [169827] = {
            ["name"] = L["Ekphoras, Herald of Grief"],
            ["announced"] = false
        },
        [170301] = {
            ["name"] = L["Apholeias, Herald of Loss"],
            ["announced"] = false
        },
        [170302] = {
            ["name"] = L["Talaporas, Herald of Pain"],
            ["announced"] = false
        },
        [170303] = {
            ["name"] = L["Exos, Herald of Domination"],
            ["announced"] = false
        },
        [158278] = {
            ["name"] = L["Nascent Devourer"],
            ["announced"] = false
        },
        [172577] = {
            ["name"] = L["Orophea"],
            ["announced"] = false
        },
        [166398] = {
            ["name"] = L["Soulforger Rhovus"],
            ["announced"] = false
        },
        [170731] = {
            ["name"] = L["Thanassos"],
            ["announced"] = false
        },
        [172862] = {
            ["name"] = L["Yero the Skittish"],
            ["announced"] = false
        },
        [171317] = {
            ["name"] = L["Conjured Death"],
            ["announced"] = false
        },
        [158025] = {
            ["name"] = L["Darklord Taraxis"],
            ["announced"] = false
        },
        [170774] = {
            ["name"] = L["Eketra"],
            ["announced"] = false
        },
        [154330] = {
            ["name"] = L["Eternas the Tormentor"],
            ["announced"] = false
        },
        [162849] = {
            ["name"] = L["Morguliax"],
            ["announced"] = false
        },
        [164064] = {
            ["name"] = L["Obolos"],
            ["announced"] = false
        },
        [170634] = {
            ["name"] = L["Shadeweaver Zeris"],
            ["announced"] = false
        },
        [175012] = {
            ["name"] = L["Ikras the Devourer"],
            ["announced"] = false
        },
        -- Kothria (From: https://www.wowhead.com/guides/shadowlands-korthia-desmotaeron-rares-treasures)
        [180246] = {
            ["name"] = L["Carriage Crusher"],
            ["announced"] = false
        },
        [179755] = {
            ["name"] = L["Consumption"],
            ["announced"] = false
        },
        [179768] = {
            ["name"] = L["Consumption"],
            ["announced"] = false
        },
        [177903] = {
            ["name"] = L["Dominated Protector"],
            ["announced"] = false
        },
        [179684] = {
            ["name"] = L["Malbog"],
            ["announced"] = false
        },
        [179823] = {
            ["name"] = L["Relic Gatherer"],
            ["announced"] = false
        },
        [179108] = {
            ["name"] = L["Kroke the Tormented"],
            ["announced"] = false
        },
        [179760] = {
            ["name"] = L["Towering Exterminator"],
            ["announced"] = false
        },
        [179472] = {
            ["name"] = L["Konthrogz the Obliterator"],
            ["announced"] = false
        },
        [180162] = {
            ["name"] = L["Ve'rayn"],
            ["announced"] = false
        },
        [180160] = {
            ["name"] = L["Reliwik the Defiant"],
            ["announced"] = false
        },
        [177336] = {
            ["name"] = L["Zelnithop"],
            ["announced"] = false
        },
        [179931] = {
            ["name"] = L["Relic Breaker Krelva"],
            ["announced"] = false
        },
        [180032] = {
            ["name"] = L["Wild Worldcracker"],
            ["announced"] = false
        },
        [180042] = {
            ["name"] = L["Fleshwing"],
            ["announced"] = false
        },
        [180014] = {
            ["name"] = L["Escaped Wilderling"],
            ["announced"] = false
        },
        [179985] = {
            ["name"] = L["Stygian Stonecrusher"],
            ["announced"] = false
        },
        [179802] = {
            ["name"] = L["Yarxhov the Pillager"],
            ["announced"] = false
        },
        [179859] = {
            ["name"] = L["Xyraxz the Unknowable"],
            ["announced"] = false
        },
        [179914] = {
            ["name"] = L["Observer Yorik"],
            ["announced"] = false
        },
        [179911] = {
            ["name"] = L["Silent Soulstalker"],
            ["announced"] = false
        },
        [179608] = {
            ["name"] = L["Screaming Shade"],
            ["announced"] = false
        },
        [179913] = {
            ["name"] = L["Deadsoul Hatcher"],
            ["announced"] = false
        },
        [179460] = {
            ["name"] = L["Fallen Charger"],
            ["announced"] = false
        },
        [179779] = {
            ["name"] = L["Deomen the Vortex"],
            ["announced"] = false
        },
        [179805] = {
            ["name"] = L["Traitor Balthier"],
            ["announced"] = false
        },
        [177444] = {
            ["name"] = L["Ylva"],
            ["announced"] = false
        },
        [179851] = {
            ["name"] = L["Guard Orguluus"],
            ["announced"] = false
        },
        [179853] = {
            ["name"] = L["Blinding Shadow"],
            ["announced"] = false
        },
        [179735] = {
            ["name"] = L["Torglluun"],
            ["announced"] = false
        },
        -- Zereth Mortis
        [180746] = {
            ["name"] = L["Protector of the First Ones"],
            ["announced"] = false
        },
        [180917] = {
            ["name"] = L["Destabilized Core"],
            ["announced"] = false
        },
        [180924] = {
            ["name"] = L["Garudeon"],
            ["announced"] = false
        },
        [180978] = {
            ["name"] = L["Hirukon"],
            ["announced"] = false
        },
        [181249] = {
            ["name"] = L["Tethos"],
            ["announced"] = false
        },
        [181360] = {
            ["name"] = L["Vexis"],
            ["announced"] = false
        },
        [182114] = {
            ["name"] = L["Iska, Outrider of Ruin"],
            ["announced"] = false
        },
        [182155] = {
            ["name"] = L["High Reaver Damaris"],
            ["announced"] = false
        },
        [182158] = {
            ["name"] = L["Reanimatrox Marzan"],
            ["announced"] = false
        },
        [182318] = {
            ["name"] = L["General Zarathura"],
            ["announced"] = false
        },
        [183516] = {
            ["name"] = L["The Engulfer"],
            ["announced"] = false
        },
        [183596] = {
            ["name"] = L["Chitali the Eldest"],
            ["announced"] = false
        },
        [183646] = {
            ["name"] = L["Furidian"],
            ["announced"] = false
        },
        [183722] = {
            ["name"] = L["Sorranos"],
            ["announced"] = false
        },
        [183737] = {
            ["name"] = L["Xy'rath the Covetous"],
            ["announced"] = false
        },
        [183746] = {
            ["name"] = L["Otiosen"],
            ["announced"] = false
        },
        [183747] = {
            ["name"] = L["Vitiane"],
            ["announced"] = false
        },
        [183748] = {
            ["name"] = L["Helmix"],
            ["announced"] = false
        },
        [183749] = {
            ["name"] = L["Helmix"],
            ["announced"] = false
        },
        [183764] = {
            ["name"] = L["Zatojin"],
            ["announced"] = false
        },
        [183814] = {
            ["name"] = L["Otaris the Provoked"],
            ["announced"] = false
        },
        [183925] = {
            ["name"] = L["Tahkwitz"],
            ["announced"] = false
        },
        [183927] = {
            ["name"] = L["Sand Matriarch Ileus"],
            ["announced"] = false
        },
        [183953] = {
            ["name"] = L["Corrupted Architect"],
            ["announced"] = false
        },
        [184409] = {
            ["name"] = L["Euv'ouk"],
            ["announced"] = false
        },
        [184413] = {
            ["name"] = L["Shifting Stargorger"],
            ["announced"] = false
        },
        [184804] = {
            ["name"] = L["Helmix"],
            ["announced"] = false
        },
    }
end
