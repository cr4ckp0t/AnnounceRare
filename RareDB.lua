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
            ["name"] = "Arachnoid Harvester",
            ["announced"] = false
        },
        [150394] = {
            ["name"] = "Armored Vaultbot",
            ["announced"] = false
        },
        [153200] = {
            ["name"] = "Boilburn",
            ["announced"] = false
        },
        [151308] = {
            ["name"] = "Boggac Skullbash",
            ["announced"] = false
        },
        [152001] = {
            ["name"] = "Bonepicker",
            ["announced"] = false
        },
        [154739] = {
            ["name"] = "Caustic Mechaslime",
            ["announced"] = false
        },
        [151569] = {
            ["name"] = "Deepwater Maw",
            ["announced"] = false
        },
        [150342] = {
            ["name"] = "Earthbreaker Gulroc",
            ["announced"] = false
        },
        [154153] = {
            ["name"] = "Enforcer KX-T57",
            ["announced"] = false
        },
        [151202] = {
            ["name"] = "Foul Manifestation",
            ["announced"] = false
        },
        [151884] = {
            ["name"] = "Fungarian Furor",
            ["announced"] = false
        },
        [135497] = {
            ["name"] = "Fungarian Furor",
            ["announced"] = false
        },
        [153228] = {
            ["name"] = "Gear Checker Cogstar",
            ["announced"] = false
        },
        [153205] = {
            ["name"] = "Gemicide",
            ["announced"] = false
        },
        [154701] = {
            ["name"] = "Gorged Gear-Cruncher",
            ["announced"] = false
        },
        [151684] = {
            ["name"] = "Jawbreaker",
            ["announced"] = false
        },
        [152007] = {
            ["name"] = "Killsaw",
            ["announced"] = false
        },
        [151933] = {
            ["name"] = "Malfunctioning Beastbot",
            ["announced"] = false
        },
        [151124] = {
            ["name"] = "Mechagonian Nullifier",
            ["announced"] = false
        },
        [151672] = {
            ["name"] = "Mecharantula",
            ["announced"] = false
        },
        [151627] = {
            ["name"] = "Mr. Fixthis",
            ["announced"] = false
        },
        [151296] = {
            ["name"] = "OOX-Avenger/MG",
            ["announced"] = false
        },
        [153206] = {
            ["name"] = "Ol' Big Tusk",
            ["announced"] = false
        },
        [152764] = {
            ["name"] = "Oxidized Leachbeast",
            ["announced"] = false
        },
        [151702] = {
            ["name"] = "Paol Pondwader",
            ["announced"] = false
        },
        [150575] = {
            ["name"] = "Rumblerocks",
            ["announced"] = false
        },
        [152182] = {
            ["name"] = "Rustfeather",
            ["announced"] = false
        },
        [155583] = {
            ["name"] = "Scrapclaw",
            ["announced"] = false
        },
        [150937] = {
            ["name"] = "Seaspit",
            ["announced"] = false
        },
        [153000] = {
            ["name"] = "Sparkqueen P'Emp",
            ["announced"] = false
        },
        [153226] = {
            ["name"] = "Steel Singer Freza",
            ["announced"] = false
        },
        [155060] = {
            ["name"] = "The Doppel Gang",
            ["announced"] = false
        },
        [152113] = {
            ["name"] = "The Kleptoboss",
            ["announced"] = false
        },
        [151940] = {
            ["name"] = "Uncle T'Rogg",
            ["announced"] = false
        },
        [151625] = {
            ["name"] = "The Scrap King",
            ["announced"] = false
        },
        [151623] = {
            ["name"] = "The Scrap King (Mounted)",
            ["announced"] = false
        },
        [154342] = {
            ["name"] = "Arachnoid Harvester (Alt Time)",
            ["announced"] = false
        },
        [154225] = {
            ["name"] = "The Rusty Prince (Alt Time)",
            ["announced"] = false
        },
        [154968] = {
            ["name"] = "Armored Vaultbot (Alt Time)",
            ["announced"] = false
        },
        [152569] = {
            ["name"] = "Crazed Trogg (Green)",
            ["announced"] = false
        },
        [152570] = {
            ["name"] = "Crazed Trogg (Blue)",
            ["announced"] = false
        },
        [149847] = {
            ["name"] = "Crazed Trogg (Orange)",
            ["announced"] = false
        },
        -- Nazjatar
        [152415] = {
            ["name"] = "Alga the Eyeless",
            ["announced"] = false
        },
        [152681] = {
            ["name"] = "Prince Typhonus",
            ["announced"] = false
        },
        [153658] = {
            ["name"] = "Shiz'narasz the Consumer",
            ["announced"] = false
        },
        [151719] = {
            ["name"] = "Voice in the Deeps",
            ["announced"] = false
        },
        [152794] = {
            ["name"] = "Amethyst Spireshell",
            ["announced"] = false
        },
        [152756] = {
            ["name"] = "Daggertooth Terror",
            ["announced"] = false
        },
        [144644] = {
            ["name"] = "Mirecrawler",
            ["announced"] = false
        },
        [152465] = {
            ["name"] = "Needlespine",
            ["announced"] = false
        },
        [152795] = {
            ["name"] = "Sandclaw Stoneshell",
            ["announced"] = false
        },
        [150191] = {
            ["name"] = "Avarius",
            ["announced"] = false
        },
        [152361] = {
            ["name"] = "Banescale the Packfather",
            ["announced"] = false
        },
        [149653] = {
            ["name"] = "Carnivorous Lasher",
            ["announced"] = false
        },
        [152323] = {
            ["name"] = "King Gakula",
            ["announced"] = false
        },
        [150583] = {
            ["name"] = "Rockweed Shambler",
            ["announced"] = false
        },
        [151870] = {
            ["name"] = "Sandcastle",
            ["announced"] = false
        },
        [153898] = {
            ["name"] = "Tidelord Aquatus",
            ["announced"] = false
        },
        [153928] = {
            ["name"] = "Tidelord Dispersius",
            ["announced"] = false
        },
        [154148] = {
            ["name"] = "Tidemistress Leth'sindra",
            ["announced"] = false
        },
        [150468] = {
            ["name"] = "Vor'koth",
            ["announced"] = false
        },
        [152566] = {
            ["name"] = "Anemonar",
            ["announced"] = false
        },
        [152567] = {
            ["name"] = "Kelpwillow",
            ["announced"] = false
        },
        [152397] = {
            ["name"] = "Oronu",
            ["announced"] = false
        },
        [152568] = {
            ["name"] = "Urduu",
            ["announced"] = false
        },
        [152548] = {
            ["name"] = "Scale Matriarch Gratinax",
            ["announced"] = false
        },
        [152542] = {
            ["name"] = "Scale Matriarch Zodia",
            ["announced"] = false
        },
        [152545] = {
            ["name"] = "Scale Matriarch Vynara",
            ["announced"] = false
        },
        [152712] = {
            ["name"] = "Blindlight",
            ["announced"] = false
        },
        [152556] = {
            ["name"] = "Chasm-Haunter",
            ["announced"] = false
        },
        [152291] = {
            ["name"] = "Deepglider",
            ["announced"] = false
        },
        [152555] = {
            ["name"] = "Elderspawn Nalaada",
            ["announced"] = false
        },
        [152414] = {
            ["name"] = "Elder Unu",
            ["announced"] = false
        },
        [152553] = {
            ["name"] = "Garnetscale",
            ["announced"] = false
        },
        [152448] = {
            ["name"] = "Iridescent Glimmershell",
            ["announced"] = false
        },
        [152682] = {
            ["name"] = "Prince Vortran",
            ["announced"] = false
        },
        [152552] = {
            ["name"] = "Shassera",
            ["announced"] = false
        },
        [152359] = {
            ["name"] = "Siltstalker the Packmother",
            ["announced"] = false
        },
        [152290] = {
            ["name"] = "Soundless",
            ["announced"] = false
        },
        [152360] = {
            ["name"] = "Toxigore the Alpha",
            ["announced"] = false
        },
        [152416] = {
            ["name"] = "Allseer Oma'kill",
            ["announced"] = false
        },
        -- Uldum
        [157170] = {
            ["name"] = "Acolyte Taspu",
            ["announced"] = false
        },
        [158557] = {
            ["name"] = "Actiss the Deceiver",
            ["announced"] = false
        },
        [151883] = {
            ["name"] = "Anaua",
            ["announced"] = false
        },
        [155703] = {
            ["name"] = "Anq'uri the Titanic",
            ["announced"] = false
        },
        [157472] = {
            ["name"] = "Aphrom the Guise of Madness",
            ["announced"] = false
        },
        [154578] = {
            ["name"] = "Aqir Flayer",
            ["announced"] = false
        },
        [154576] = {
            ["name"] = "Aqir Titanus",
            ["announced"] = false
        },
        [162172] = {
            ["name"] = "Aqir Warcaster",
            ["announced"] = false
        },
        [162370] = {
            ["name"] = "Armagedillo",
            ["announced"] = false
        },
        [152757] = {
            ["name"] = "Atekhramun",
            ["announced"] = false
        },
        [162171] = {
            ["name"] = "Captain Dunewalker",
            ["announced"] = false
        },
        [162147] = {
            ["name"] = "Corpse Eater",
            ["announced"] = false
        },
        [158594] = {
            ["name"] = "Doomsayer Vathiris",
            ["announced"] = false
        },
        [158491] = {
            ["name"] = "Falconer Amenophis",
            ["announced"] = false
        },
        [157120] = {
            ["name"] = "Fangtaker Orsa",
            ["announced"] = false
        },
        [158633] = {
            ["name"] = "Gaze of N'Zoth",
            ["announced"] = false
        },
        [158597] = {
            ["name"] = "High Executor Yothrim",
            ["announced"] = false
        },
        [158528] = {
            ["name"] = "High Guard Reshef",
            ["announced"] = false
        },
        [162163] = {
            ["name"] = "High Priest Ytaessis",
            ["announced"] = false
        },
        [151995] = {
            ["name"] = "Hik-ten the Taskmaster",
            ["announced"] = false
        },
        [160623] = {
            ["name"] = "Hungering Miasma",
            ["announced"] = false
        },
        [155531] = {
            ["name"] = "Infested Wastewander Captain",
            ["announced"] = false
        },
        [157134] = {
            ["name"] = "Ishak of the Four Winds",
            ["announced"] = false
        },
        [156655] = {
            ["name"] = "Korzaran the Slaughterer",
            ["announced"] = false
        },
        [154604] = {
            ["name"] = "Lord Aj'qirai",
            ["announced"] = false
        },
        [156078] = {
            ["name"] = "Magus Rehleth",
            ["announced"] = false
        },
        [161451] = {
            ["name"] = "Manipulator Yar'shath",
            ["announced"] = false
        },
        [157157] = {
            ["name"] = "Muminah the Incandescent",
            ["announced"] = false
        },
        [152677] = {
            ["name"] = "Nebet the Ascended",
            ["announced"] = false
        },
        [162196] = {
            ["name"] = "Obsidian Annihilator",
            ["announced"] = false
        },
        [161467] = {
            ["name"] = "Portalkeeper Jin'tashal",
            ["announced"] = false
        },
        [162142] = {
            ["name"] = "Qho",
            ["announced"] = false
        },
        [157470] = {
            ["name"] = "R'aas the Anima Devourer",
            ["announced"] = false
        },
        [156299] = {
            ["name"] = "R'khuzj The Unfathomable",
            ["announced"] = false
        },
        [162173] = {
            ["name"] = "R'krox the Runt",
            ["announced"] = false
        },
        [157146] = {
            ["name"] = "Rotfeaster",
            ["announced"] = false
        },
        [152040] = {
            ["name"] = "Scoutmaster Moswen",
            ["announced"] = false
        },
        [151948] = {
            ["name"] = "Senbu the Pridefather",
            ["announced"] = false
        },
        [161033] = {
            ["name"] = "Shadowmaw",
            ["announced"] = false
        },
        [156654] = {
            ["name"] = "Shol'thoss the Doomspeaker",
            ["announced"] = false
        },
        [160532] = {
            ["name"] = "Shoth the Darkened",
            ["announced"] = false
        },
        [157476] = {
            ["name"] = "Shugshul the Flesh Gorger",
            ["announced"] = false
        },
        [162140] = {
            ["name"] = "Skikx'traz",
            ["announced"] = false
        },
        [162372] = {
            ["name"] = "Spirit of Cyrus the Black",
            ["announced"] = false
        },
        [151878] = {
            ["name"] = "Sun King Nahkotep",
            ["announced"] = false
        },
        [151897] = {
            ["name"] = "Sun Priestess Nubitt",
            ["announced"] = false
        },
        [151609] = {
            ["name"] = "Sun Prophet Epaphos",
            ["announced"] = false
        },
        [152657] = {
            ["name"] = "Tat the Bonechewer",
            ["announced"] = false
        },
        [158636] = {
            ["name"] = "The Grand Executor",
            ["announced"] = false
        },
        [162170] = {
            ["name"] = "Warcaster Xeshro",
            ["announced"] = false
        },
        [151852] = {
            ["name"] = "Watcher Rehu",
            ["announced"] = false
        },
        [157164] = {
            ["name"] = "Zealot Tekem",
            ["announced"] = false
        },
        [162141] = {
            ["name"] = "Zuythiz",
            ["announced"] = false
        },
        [157167] = {
            ["name"] = "Champion Sen-mat",
            ["announced"] = false
        },
        [152431] = {
            ["name"] = "Kaneb-ti",
            ["announced"] = false
        },
        [152788] = {
            ["name"] = "Uat-ka the Sun's Wrath",
            ["announced"] = false
        },
        [157188] = {
            ["name"] = "The Tomb Widow",
            ["announced"] = false
        },
        [162352] = {
            ["name"] = "Spirit of Dark Ritualist Zakahn",
            ["announced"] = false
        },
        [158531] = {
            ["name"] = "Corrupted Neferset Guard",
            ["announced"] = false
        },
        [157593] = {
            ["name"] = "Amalgamation of Flesh",
            ["announced"] = false
        },
        [158595] = {
            ["name"] = "Thoughtstealer Vos",
            ["announced"] = false
        },
        [157473] = {
            ["name"] = "Yiphrim the Will Ravager",
            ["announced"] = false
        },
        [157469] = {
            ["name"] = "Zoth'rum the Intellect Pillager",
            ["announced"] = false
        },
        [157390] = {
            ["name"] = "R'oyolok the Reality Eater",
            ["announced"] = false
        },
        [162765] = {
            ["name"] = "Friendly Alpaca",
            ["announced"] = false
        },
        -- Vale of the Eternal Blossoms
        [154087] = {
            ["name"] = "Zror'um the Infinite",
            ["announced"] = false
        },
        [154106] = {
            ["name"] = "Quid",
            ["announced"] = false
        },
        [159318] = {
            ["name"] = "Shadow-Walker Yash'gth",
            ["announced"] = false
        },
        [154332] = {
            ["name"] = "Voidtender Malketh",
            ["announced"] = false
        },
        [154394] = {
            ["name"] = "Veskan the Fallen",
            ["announced"] = false
        },
        [154447] = {
            ["name"] = "Brother Meller",
            ["announced"] = false
        },
        [154467] = {
            ["name"] = "Chief Mek-mek",
            ["announced"] = false
        },
        [154490] = {
            ["name"] = "Rijz'x the Devourer",
            ["announced"] = false
        },
        [154495] = {
            ["name"] = "Will of N'Zoth",
            ["announced"] = false
        },
        [154559] = {
            ["name"] = "Deeplord Zrihj",
            ["announced"] = false
        },
        [154600] = {
            ["name"] = "Teng the Awakened",
            ["announced"] = false
        },
        [155958] = {
            ["name"] = "Tashara",
            ["announced"] = false
        },
        [156083] = {
            ["name"] = "Sanguifang",
            ["announced"] = false
        },
        [157153] = {
            ["name"] = "Ha-Li",
            ["announced"] = false
        },
        [157160] = {
            ["name"] = "Houndlord Ren",
            ["announced"] = false
        },
        [157162] = {
            ["name"] = "Rei Lun",
            ["announced"] = false
        },
        [157171] = {
            ["name"] = "Heixi the Stonelord",
            ["announced"] = false
        },
        [157176] = {
            ["name"] = "The Forgotten",
            ["announced"] = false
        },
        [157183] = {
            ["name"] = "Coagulated Anima",
            ["announced"] = false
        },
        [157266] = {
            ["name"] = "Kilxl the Gaping Maw",
            ["announced"] = false
        },
        [157267] = {
            ["name"] = "Escaped Mutation",
            ["announced"] = false
        },
        [157279] = {
            ["name"] = "Stormhowl",
            ["announced"] = false
        },
        [157287] = {
            ["name"] = "Dokani Obliterator",
            ["announced"] = false
        },
        [157290] = {
            ["name"] = "Jade Watcher",
            ["announced"] = false
        },
        [157291] = {
            ["name"] = "Spymaster Hul'ach",
            ["announced"] = false
        },
        [157443] = {
            ["name"] = "Xiln the Mountain",
            ["announced"] = false
        },
        [157466] = {
            ["name"] = "Anh-De the Loyal",
            ["announced"] = false
        },
        [157468] = {
            ["name"] = "Tisiphon",
            ["announced"] = false
        },
        [160810] = {
            ["name"] = "Harbinger Il'koxik",
            ["announced"] = false
        },
        [160825] = {
            ["name"] = "Amber-Shaper Esh'ri",
            ["announced"] = false
        },
        [160826] = {
            ["name"] = "Hive-Guard Naz'ruzek",
            ["announced"] = false
        },
        [160867] = {
            ["name"] = "Kzit'kovok",
            ["announced"] = false
        },
        [160868] = {
            ["name"] = "Harrier Nir'verash",
            ["announced"] = false
        },
        [160872] = {
            ["name"] = "Destroyer Krox'tazar",
            ["announced"] = false
        },
        [160874] = {
            ["name"] = "Drone Keeper Ak'thet",
            ["announced"] = false
        },
        [160876] = {
            ["name"] = "Enraged Amber Elemental",
            ["announced"] = false
        },
        [160878] = {
            ["name"] = "Buh'gzaki the Blasphemous",
            ["announced"] = false
        },
        [160893] = {
            ["name"] = "Captain Vor'lek",
            ["announced"] = false
        },
        [160920] = {
            ["name"] = "Kal'tik the Blight",
            ["announced"] = false
        },
        [160922] = {
            ["name"] = "Needler Zhesalla",
            ["announced"] = false
        },
        [160930] = {
            ["name"] = "Infused Amber Ooze",
            ["announced"] = false
        },
        [160968] = {
            ["name"] = "Jade Colossus",
            ["announced"] = false
        },
        [159087] = {
            ["name"] = "Corrupted Bonestripper",
            ["announced"] = false
        },
        [160906] = {
            ["name"] = "Skiver",
            ["announced"] = false
        },
        -- The Maw (From: https://www.wowhead.com/guides/shadowlands-the-maw-events-rares#rare-locations-in-the-maw)
        [157964] = {
            ["name"] = "Adjutant Dekaris",
            ["announced"] = false
        },
        [157833] = {
            ["name"] = "Borr-Geth",
            ["announced"] = false
        },
        [160770] = {
            ["name"] = "Darithis the Bleak",
            ["announced"] = false
        },
        [170711] = {
            ["name"] = "Dolos",
            ["announced"] = false
        },
        [169827] = {
            ["name"] = "Ekphoras, Herald of Grief",
            ["announced"] = false
        },
        [170301] = {
            ["name"] = "Apholeias, Herald of Loss",
            ["announced"] = false
        },
        [170302] = {
            ["name"] = "Talaporas, Herald of Pain",
            ["announced"] = false
        },
        [170303] = {
            ["name"] = "Exos, Herald of Domination",
            ["announced"] = false
        },
        [158278] = {
            ["name"] = "Nascent Devourer",
            ["announced"] = false
        },
        [172577] = {
            ["name"] = "Orophea",
            ["announced"] = false
        },
        [166398] = {
            ["name"] = "Soulforger Rhovus",
            ["announced"] = false
        },
        [170731] = {
            ["name"] = "Thanassos",
            ["announced"] = false
        },
        [172862] = {
            ["name"] = "Yero the Skittish",
            ["announced"] = false
        },
        [171317] = {
            ["name"] = "Conjured Death",
            ["announced"] = false
        },
        [158025] = {
            ["name"] = "Darklord Taraxis",
            ["announced"] = false
        },
        [170774] = {
            ["name"] = "Eketra",
            ["announced"] = false
        },
        [154330] = {
            ["name"] = "Eternas the Tormentor",
            ["announced"] = false
        },
        [162849] = {
            ["name"] = "Morguliax",
            ["announced"] = false
        },
        [164064] = {
            ["name"] = "Obolos",
            ["announced"] = false
        },
        [170634] = {
            ["name"] = "Shadeweaver Zeris",
            ["announced"] = false
        },
        [175012] = {
            ["name"] = "Ikras the Devourer",
            ["announced"] = false
        },
        -- Kothria (From: https://www.wowhead.com/guides/shadowlands-korthia-desmotaeron-rares-treasures)
        [180246] = {
            ["name"] = "Carriage Crusher",
            ["announced"] = false
        },
        [179755] = {
            ["name"] = "Consumption",
            ["announced"] = false
        },
        [179768] = {
            ["name"] = "Consumption",
            ["announced"] = false
        },
        [177903] = {
            ["name"] = "Dominated Protector",
            ["announced"] = false
        },
        [179684] = {
            ["name"] = "Malbog",
            ["announced"] = false
        },
        [179823] = {
            ["name"] = "Relic Gatherer",
            ["announced"] = false
        },
        [179108] = {
            ["name"] = "Kroke the Tormented",
            ["announced"] = false
        },
        [179760] = {
            ["name"] = "Towering Exterminator",
            ["announced"] = false
        },
        [179472] = {
            ["name"] = "Konthrogz the Obliterator",
            ["announced"] = false
        },
        [180162] = {
            ["name"] = "Ve'rayn",
            ["announced"] = false
        },
        [180160] = {
            ["name"] = "Reliwik the Defiant",
            ["announced"] = false
        },
        [177336] = {
            ["name"] = "Zelnithop",
            ["announced"] = false
        },
        [179931] = {
            ["name"] = "Relic Breaker Krelva",
            ["announced"] = false
        },
        [180032] = {
            ["name"] = "Wild Worldcracker",
            ["announced"] = false
        },
        [180042] = {
            ["name"] = "Fleshwing",
            ["announced"] = false
        },
        [180014] = {
            ["name"] = "Escaped Wilderling",
            ["announced"] = false
        },
        [179985] = {
            ["name"] = "Stygian Stonecrusher",
            ["announced"] = false
        },
        [179802] = {
            ["name"] = "Yarxhov the Pillager",
            ["announced"] = false
        },
        [179859] = {
            ["name"] = "Xyraxz the Unknowable",
            ["announced"] = false
        },
        [179914] = {
            ["name"] = "Observer Yorik",
            ["announced"] = false
        },
        [179911] = {
            ["name"] = "Silent Soulstalker",
            ["announced"] = false
        },
        [179608] = {
            ["name"] = "Screaming Shade",
            ["announced"] = false
        },
        [179913] = {
            ["name"] = "Deadsoul Hatcher",
            ["announced"] = false
        },
        [179460] = {
            ["name"] = "Fallen Charger",
            ["announced"] = false
        },
        [179779] = {
            ["name"] = "Deomen the Vortex",
            ["announced"] = false
        },
        [179805] = {
            ["name"] = "Traitor Balthier",
            ["announced"] = false
        },
        [177444] = {
            ["name"] = "Ylva",
            ["announced"] = false
        },
        [179851] = {
            ["name"] = "Guard Orguluus",
            ["announced"] = false
        },
        [179853] = {
            ["name"] = "Blinding Shadow",
            ["announced"] = false
        },
        [179735] = {
            ["name"] = "Torglluun",
            ["announced"] = false
        },
        -- Zereth Mortis
        [180746] = {
            ["name"] = "Protector of the First Ones",
            ["announced"] = false
        },
        [180917] = {
            ["name"] = "Destabilized Core",
            ["announced"] = false
        },
        [180924] = {
            ["name"] = "Garudeon",
            ["announced"] = false
        },
        [180978] = {
            ["name"] = "Hirukon",
            ["announced"] = false
        },
        [181249] = {
            ["name"] = "Tethos",
            ["announced"] = false
        },
        [181360] = {
            ["name"] = "Vexis",
            ["announced"] = false
        },
        [182114] = {
            ["name"] = "Iska, Outrider of Ruin",
            ["announced"] = false
        },
        [182155] = {
            ["name"] = "High Reaver Damaris",
            ["announced"] = false
        },
        [182158] = {
            ["name"] = "Reanimatrox Marzan",
            ["announced"] = false
        },
        [182318] = {
            ["name"] = "General Zarathura",
            ["announced"] = false
        },
        [183516] = {
            ["name"] = "The Engulfer",
            ["announced"] = false
        },
        [183596] = {
            ["name"] = "Chitali the Eldest",
            ["announced"] = false
        },
        [183646] = {
            ["name"] = "Furidian",
            ["announced"] = false
        },
        [183722] = {
            ["name"] = "Sorranos",
            ["announced"] = false
        },
        [183737] = {
            ["name"] = "Xy'rath the Covetous",
            ["announced"] = false
        },
        [183746] = {
            ["name"] = "Otiosen",
            ["announced"] = false
        },
        [183747] = {
            ["name"] = "Vitiane",
            ["announced"] = false
        },
        [183748] = {
            ["name"] = "Helmix",
            ["announced"] = false
        },
        [183749] = {
            ["name"] = "Helmix",
            ["announced"] = false
        },
        [184804] = {
            ["name"] = "Helmix",
            ["announced"] = false
        },
        [183764] = {
            ["name"] = "Zatojin",
            ["announced"] = false
        },
        [183814] = {
            ["name"] = "Otaris the Provoked",
            ["announced"] = false
        },
        [183925] = {
            ["name"] = "Tahkwitz",
            ["announced"] = false
        },
        [183927] = {
            ["name"] = "Sand Matriarch Ileus",
            ["announced"] = false
        },
        [183953] = {
            ["name"] = "Corrupted Architect",
            ["announced"] = false
        },
        [184409] = {
            ["name"] = "Euv'ouk",
            ["announced"] = false
        },
        [184413] = {
            ["name"] = "Shifting Stargorger",
            ["announced"] = false
        },
        [178963] = {
            ["name"] = "Gorkek",
            ["announced"] = false
        },
        [179006] = {
            ["name"] = "Akkaris",
            ["announced"] = false
        },
        [178563] = {
            ["name"] = "Hadeon the Stonebreaker",
            ["announced"] = false
        },
        [178778] = {
            ["name"] = "Gluttonous Overgrowth",
            ["announced"] = false
        },
        [178229] = {
            ["name"] = "Feasting",
            ["announced"] = false
        },
        [179043] = {
            ["name"] = "Orixal",
            ["announced"] = false
        },
        [178508] = {
            ["name"] = "Mother Phestis",
            ["announced"] = false
        },

        -- 10.0.2 Dragonflight Rares
        -- The Azure Span
        [193632] = {
            ["name"] = "Wilrive",
            ["announced"] = false
        },
        [194270] = {
            ["name"] = "Arcane Devourer",
            ["announced"] = false
        },
        [191356] = {
            ["name"] = "Frostpaw",
            ["announced"] = false
        },
        [194392] = {
            ["name"] = "Brackle",
            ["announced"] = false
        },
        [194210] = {
            ["name"] = "Azure Pathfinder",
            ["announced"] = false
        },
        [193225] = {
            ["name"] = "Notfar the Unbearable",
            ["announced"] = false
        },
        [190244] = {
            ["name"] = "Mahg the Trampler",
            ["announced"] = false
        },
        [193251] = {
            ["name"] = "Gruffy",
            ["announced"] = false
        },
        [193693] = {
            ["name"] = "Rusthide",
            ["announced"] = false
        },
        [193691] = {
            ["name"] = "Fisherman Tinnak",
            ["announced"] = false
        },
        [193708] = {
            ["name"] = "Skald the Impaler",
            ["announced"] = false
        },
        [193735] = {
            ["name"] = "Moth'go Deeploom",
            ["announced"] = false
        },
        [193167] = {
            ["name"] = "Swagraal the Swollen",
            ["announced"] = false
        },
        [193178] = {
            ["name"] = "Blightfur",
            ["announced"] = false
        },
        [197344] = {
            ["name"] = "Snarglebone",
            ["announced"] = false
        },
        [197354] = {
            ["name"] = "Gnarls",
            ["announced"] = false
        },
        [197371] = {
            ["name"] = "Ravenous Tundra Bear",
            ["announced"] = false
        },
        [193157] = {
            ["name"] = "Dragonhunter Gorund",
            ["announced"] = false
        },
        [198004] = {
            ["name"] = "Mange the Outcast",
            ["announced"] = false
        },
        [193201] = {
            ["name"] = "Mucka the Raker",
            ["announced"] = false
        },
        [193698] = {
            ["name"] = "Frigidpelt Den Mother",
            ["announced"] = false
        },
        [193116] = {
            ["name"] = "Beogoka",
            ["announced"] = false
        },
        [193259] = {
            ["name"] = "Blue Terror",
            ["announced"] = false
        },
        [193149] = {
            ["name"] = "Skag the Thrower",
            ["announced"] = false
        },
        [193269] = {
            ["name"] = "Grumbletrunk",
            ["announced"] = false
        },
        [193196] = {
            ["name"] = "Trilvarus Loreweaver",
            ["announced"] = false
        },
        [193706] = {
            ["name"] = "Snufflegust",
            ["announced"] = false
        },
        [193710] = {
            ["name"] = "Seereel, the Spring",
            ["announced"] = false
        },
        [193634] = {
            ["name"] = "Swog'ranka",
            ["announced"] = false
        },
        [197557] = {
            ["name"] = "Bisquius",
            ["announced"] = false
        },
        [193238] = {
            ["name"] = "Spellwrought Snowman",
            ["announced"] = false
        },
        [197353] = {
            ["name"] = "Blisterhide",
            ["announced"] = false
        },
        [197356] = {
            ["name"] = "High Shaman Rotknuckle",
            ["announced"] = false
        },
        [197411] = {
            ["name"] = "Astray Splasher",
            ["announced"] = false
        },

        -- The Ohn'ahran Plains
        [193165] = {
            ["name"] = "Sparkspitter Vrak",
            ["announced"] = false
        },
        [193142] = {
            ["name"] = "Enraged Sapphire",
            ["announced"] = false
        },
        [193209] = {
            ["name"] = "Zenet Avis",
            ["announced"] = false
        },
        [189652] = {
            ["name"] = "Deadwaker Ghendish",
            ["announced"] = false
        },
        [193173] = {
            ["name"] = "Mikrin of the Raging Winds",
            ["announced"] = false
        },
        [193123] = {
            ["name"] = "Steamgill",
            ["announced"] = false
        },
        [193235] = {
            ["name"] = "Oshigol",
            ["announced"] = false
        },
        [192045] = {
            ["name"] = "Windseeker Avash",
            ["announced"] = false
        },
        [193140] = {
            ["name"] = "Zarizz",
            ["announced"] = false
        },
        [187559] = {
            ["name"] = "Shade of Grief",
            ["announced"] = false
        },
        [187781] = {
            ["name"] = "Hamett",
            ["announced"] = false
        },
        [188124] = {
            ["name"] = "Irontree",
            ["announced"] = false
        },
        [191842] = {
            ["name"] = "Sulfurion",
            ["announced"] = false
        },
        [195204] = {
            ["name"] = "The Jolly Giant",
            ["announced"] = false
        },
        [192453] = {
            ["name"] = "Vaniik the Stormtouched",
            ["announced"] = false
        },
        [195186] = {
            ["name"] = "Cinta the Forgotten",
            ["announced"] = false
        },
        [195409] = {
            ["name"] = "Makhra the Ashtouched",
            ["announced"] = false
        },
        [196350] = {
            ["name"] = "Old Stormhide",
            ["announced"] = false
        },
        [193136] = {
            ["name"] = "Scav Notail",
            ["announced"] = false
        },
        [193188] = {
            ["name"] = "Seeker Teryx",
            ["announced"] = false
        },
        [197009] = {
            ["name"] = "Liskheszaera",
            ["announced"] = false
        },
        [196010] = {
            ["name"] = "Researcher Sneakwing",
            ["announced"] = false
        },
        [193227] = {
            ["name"] = "Ronsak the Decimator",
            ["announced"] = false
        },
        [193212] = {
            ["name"] = "Malsegan",
            ["announced"] = false
        },
        [193170] = {
            ["name"] = "Fulgurb",
            ["announced"] = false
        },
        [192020] = {
            ["name"] = "Eaglemaster Niraak",
            ["announced"] = false
        },
        [193215] = {
            ["name"] = "Scaleseeker Mezeri",
            ["announced"] = false
        },
        [187219] = {
            ["name"] = "Nokhud Warmaster",
            ["announced"] = false
        },
        [188095] = {
            ["name"] = "Hunter of Deep",
            ["announced"] = false
        },
        [188451] = {
            ["name"] = "Zerimek",
            ["announced"] = false
        },
        [191950] = {
            ["name"] = "Porta the Overgrown",
            ["announced"] = false
        },
        [192364] = {
            ["name"] = "Windscale the Stormborn",
            ["announced"] = false
        },
        [192557] = {
            ["name"] = "Quackers the Terrible",
            ["announced"] = false
        },
        [195223] = {
            ["name"] = "Rustlily",
            ["announced"] = false
        },
        [196334] = {
            ["name"] = "The Great Enla",
            ["announced"] = false
        },

        -- Thaldraszus
        [193143] = {
            ["name"] = "Razk'vex the Untamed",
            ["announced"] = false
        },
        [193128] = {
            ["name"] = "Blightpaw the Depraved",
            ["announced"] = false
        },
        [193125] = {
            ["name"] = "Goremaul the Gluttonous",
            ["announced"] = false
        },
        [193246] = {
            ["name"] = "Matriarch Remalla",
            ["announced"] = false
        },
        [193258] = {
            ["name"] = "Tempestrian",
            ["announced"] = false
        },
        [193234] = {
            ["name"] = "Eldoren the Reborn",
            ["announced"] = false
        },
        [193220] = {
            ["name"] = "Broodweaver Araznae",
            ["announced"] = false
        },
        [193666] = {
            ["name"] = "Rokmur",
            ["announced"] = false
        },
        [183984] = {
            ["name"] = "The Weeping Vilomah",
            ["announced"] = false
        },
        [191305] = {
            ["name"] = "The Great Shellkhan",
            ["announced"] = false
        },
        [193241] = {
            ["name"] = "Lord Epochbrgl",
            ["announced"] = false
        },
        [193126] = {
            ["name"] = "Innumerable Ruination",
            ["announced"] = false
        },
        [193130] = {
            ["name"] = "Pleasant Alpha",
            ["announced"] = false
        },
        [193688] = {
            ["name"] = "Phenran",
            ["announced"] = false
        },
        [193210] = {
            ["name"] = "Phleep",
            ["announced"] = false
        },
        [193146] = {
            ["name"] = "Treasure-Mad Trambladd",
            ["announced"] = false
        },
        [193240] = {
            ["name"] = "Riverwalker Tamopo",
            ["announced"] = false
        },
        [193176] = {
            ["name"] = "Sandana the Tempest",
            ["announced"] = false
        },
        [193161] = {
            ["name"] = "Woolfang",
            ["announced"] = false
        },
        [193663] = {
            ["name"] = "Craggravated Elemental",
            ["announced"] = false
        },
        [193658] = {
            ["name"] = "Corrupted Proto-Dragon",
            ["announced"] = false
        },
        [193664] = {
            ["name"] = "Ancient Protector",
            ["announced"] = false
        },
        [193229] = {
            ["name"] = "Henlare",
            ["announced"] = false
        },
        [193243] = {
            ["name"] = "Acrosoth",
            ["announced"] = false
        },
		[193273] = {
			["name"] = "Liskron the Dazzling",
			["announced"] = false
		},


        -- The Waking Shores
        [196056] = {
            ["name"] = "Gushgut the Beaksinker",
            ["announced"] = false
        },
        [187945] = {
            ["name"] = "Anhydros the Tidetaker",
            ["announced"] = false
        },
        [199645] = {
            ["name"] = "Helmet Missingway",
            ["announced"] = false
        },
        [193217] = {
            ["name"] = "Drakewing",
            ["announced"] = false
        },
        [193135] = {
            ["name"] = "Azra's Prized Peony",
            ["announced"] = false
        },
        [193118] = {
            ["name"] = "O'nank Shorescour",
            ["announced"] = false
        },
        [193132] = {
            ["name"] = "Amethyzar the Glittering",
            ["announced"] = false
        },
        [193152] = {
            ["name"] = "Massive Magmashell",
            ["announced"] = false
        },
        [193134] = {
            ["name"] = "Enkine the Voracious",
            ["announced"] = false
        },
        [192362] = {
            ["name"] = "Possessive Hornswog",
            ["announced"] = false
        },
        [190985] = {
            ["name"] = "Death's Shadow",
            ["announced"] = false
        },
        [193266] = {
            ["name"] = "Lepidoralia the Resplendent",
            ["announced"] = false
        },
        [187598] = {
            ["name"] = "Rohzor Forgesmash",
            ["announced"] = false
        },
        [190986] = {
            ["name"] = "Battlehorn Pyrhus",
            ["announced"] = false
        },
        [193232] = {
            ["name"] = "Rasnar the War Ender",
            ["announced"] = false
        },
        [193271] = {
            ["name"] = "Shadeslash Trakken",
            ["announced"] = false
        },
        [193256] = {
            ["name"] = "Nulltheria the Void Gazer",
            ["announced"] = false
        },
        [193181] = {
            ["name"] = "Skewersnout",
            ["announced"] = false
        },
        [192738] = {
            ["name"] = "Brundin the Dragonbane",
            ["announced"] = false
        },
        [193148] = {
            ["name"] = "Thunderous Matriarch",
            ["announced"] = false
        },
        [193228] = {
            ["name"] = "Snappy",
            ["announced"] = false
        },
        [193120] = {
            ["name"] = "Smogswog the Firebreather",
            ["announced"] = false
        },
        [186827] = {
            ["name"] = "Magmaton",
            ["announced"] = false
        },
        [193154] = {
            ["name"] = "Forgotten Gryphon",
            ["announced"] = false
        },
        [193198] = {
            ["name"] = "Captain Lancer",
            ["announced"] = false
        },
        [186859] = {
            ["name"] = "Worldcarver A'tir",
            ["announced"] = false
        },
        [189822] = {
            ["name"] = "Shas'ith",
            ["announced"] = false
        },
        [186783] = {
            ["name"] = "Cauldronbearer Blakor",
            ["announced"] = false
        },
        [187886] = {
            ["name"] = "Turboris",
            ["announced"] = false
        },
        [190991] = {
            ["name"] = "Char",
            ["announced"] = false
        },
        [187306] = {
            ["name"] = "Morchok",
            ["announced"] = false
        },
        [193175] = {
            ["name"] = "Slurpo, the Incredible Snail",
            ["announced"] = false
        },
        [192737] = {
            ["name"] = "Qalashi War Mammoth",
            ["announced"] = false
        },
		
        -- Elemental Storm Rares
        [193648] = {
            ["name"] = "Infernum",
            ["announced"] = false
        },
        [193645] = {
            ["name"] = "Crystalus",
            ["announced"] = false
        },
        [193644] = {
            ["name"] = "Bouldron",
            ["announced"] = false
        },
        [193647] = {
            ["name"] = "Karantun",
            ["announced"] = false
        },
        [193686] = {
            ["name"] = "Neela Firebane",
            ["announced"] = false
        },
        [193682] = {
            ["name"] = "Rouen Icewind",
            ["announced"] = false
        },
        [193680] = {
            ["name"] = "Zurgaz Corebreaker",
            ["announced"] = false
        },
        [193684] = {
            ["name"] = "Pipspark Thundersnap",
            ["announced"] = false
        },
        [193652] = {
            ["name"] = "Grizzlerock",
            ["announced"] = false
        },
        [193674] = {
            ["name"] = "Voraazka",
            ["announced"] = false
        },
        [193675] = {
            ["name"] = "Kain Firebrand",
            ["announced"] = false
        },
        [193677] = {
            ["name"] = "Maeleera",
            ["announced"] = false
        },
        [193678] = {
            ["name"] = "Fieraan",
            ["announced"] = false
        },
        [193679] = {
            ["name"] = "Leerain",
            ["announced"] = false
        },
        [193653] = {
            ["name"] = "Gaelzion",
            ["announced"] = false
        },
        [193654] = {
            ["name"] = "Gravlion",
            ["announced"] = false
        },
        [193650] = {
            ["name"] = "Emblazion",
            ["announced"] = false
        },
        [193655] = {
            ["name"] = "Frozion",
            ["announced"] = false
        },

        -- the forbidden reach
		[200579] = {
			["name"] = "Ishyra",
			["announced"] = false,
		},
		[200584] = {
			["name"] = "Vraken the Hunter",
			["announced"] = false,
		},
		[200600] = {
			["name"] = "Reisa the Drowned",
			["announced"] = false,
		},
		[200610] = {
			["name"] = "Duzalgor",
			["announced"] = false,
		},
		[200619] = {
			["name"] = "Tectonus",
			["announced"] = false,
		},
		[200620] = {
			["name"] = "Sir Pinchalot",
			["announced"] = false,
		},
		[200621] = {
			["name"] = "Manathema",
			["announced"] = false,
		},
		[200622] = {
			["name"] = "Snarfang",
			["announced"] = false,
		},
		[200681] = {
			["name"] = "Bonesifter Marwak",
			["announced"] = false,
		},
		[200717] = {
			["name"] = "Galakhad",
			["announced"] = false,
		},
		[200721] = {
			["name"] = "Grugoth the Hullcrusher",
			["announced"] = false,
		},
		[200722] = {
			["name"] = "Gareed",
			["announced"] = false,
		},
		[200725] = {
			["name"] = "Faunos",
			["announced"] = false,
		},
		[200730] = {
			["name"] = "Tidesmith Zarviss",
			["announced"] = false,
		},
		[200737] = {
			["name"] = "Arcantrix",
			["announced"] = false,
		},
		[200738] = {
			["name"] = "Kangalo",
			["announced"] = false,
		},
		[200739] = {
			["name"] = "Fimbol",
			["announced"] = false,
		},
		[200740] = {
			["name"] = "Agni Blazehoof",
			["announced"] = false,
		},
		[200742] = {
			["name"] = "Luttrok",
			["announced"] = false,
		},
		[200743] = {
			["name"] = "Amephyst",
			["announced"] = false,
		},
		[200904] = {
			["name"] = "Veltrax",
			["announced"] = false,
		},
		[200911] = {
			["name"] = "Volcanakk",
			["announced"] = false,
		},
		[200956] = {
			["name"] = "Ookbeard",
			["announced"] = false,
		},
		[200960] = {
			["name"] = "Warden Entrix",
			["announced"] = false,
		},
		[200978] = {
			["name"] = "Pyrachniss",
			["announced"] = false,
		},
		[201013] = {
			["name"] = "Wyrmslayer Angvardi",
			["announced"] = false,
		},
		[201181] = {
			["name"] = "Mad-Eye Carrey",
			["announced"] = false,
		},
		[201182] = {
			["name"] = "First Mate Ovdah",
			["announced"] = false,
		},
		[201184] = {
			["name"] = "Navigator Bi-Yun",
			["announced"] = false,
		},
		[201310] = {
			["name"] = "Nidharr",
			["announced"] = false,
		},
		[203341] = {
			["name"] = "Researcher Baneflare",
			["announced"] = false,
		},

        -- zaralek cavern
        [203515] = {
            ["name"] = "Alcanon",
            ["announced"] = false,
        },
        [203468] = {
            ["name"] = "Aquifon",
            ["announced"] = false,
        },
        [203621] = {
            ["name"] = "Brullo the Strong",
            ["announced"] = false,
        },
        [204093] = {
            ["name"] = "Colossian",
            ["announced"] = false,
        },
        [203646] = {
            ["name"] = "Dinn",
            ["announced"] = false,
        },
        [203664] = {
            ["name"] = "Emberdusk",
            ["announced"] = false,
        },
        [203660] = {
            ["name"] = "Flowfy",
            ["announced"] = false,
        },
        [203592] = {
            ["name"] = "General Zskorro",
            ["announced"] = false,
        },
        [203477] = {
            ["name"] = "Goopal",
            ["announced"] = false,
        },
        [203627] = {
            ["name"] = "Invoq",
            ["announced"] = false,
        },
        [203466] = {
            ["name"] = "Kapraku",
            ["announced"] = false,
        },
        [203625] = {
            ["name"] = "Karokta",
            ["announced"] = false,
        },
        [203618] = {
            ["name"] = "Klakatak",
            ["announced"] = false,
        },
        [203462] = {
            ["name"] = "Kob'rok",
            ["announced"] = false,
        },
        [200111] = {
            ["name"] = "Magtembo",
            ["announced"] = false,
        },
        [203521] = {
            ["name"] = "Professor Gastrinax",
            ["announced"] = false,
        },
        [203643] = {
            ["name"] = "Skornak",
            ["announced"] = false,
        },
        [203480] = {
            ["name"] = "Spinmarrow",
            ["announced"] = false,
        },
        [203662] = {
            ["name"] = "Subterrax",
            ["announced"] = false,
        },
        [203593] = {
        ["name"] = "Underlight Queen",
            ["announced"] = false,
        },
    }
end
