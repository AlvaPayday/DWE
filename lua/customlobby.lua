

local element = nil

local specialheists = {
  "red2",
  "run",
  "hox_1",
  "hox_2",
  "glace",
  "peta",
  "peta2",
  "election_day_1",
  "election_day_3_skip2",
  "election_day_2"
  
}

local special_tasks = {
  "peta",
  "election_day_1",
  "election_day_3_skip2"
}

local heistlevels = {
  "red2",
  "run",
  "pal",
  "dah",
  "glace",
  "nmh",
  "flat",
  "man",
  "dinner",
  "gallery",
  "branchbank",
  "roberts",
  "rvd1",
  "arena",
  "arm_cro",
  "arm_hcm",
  "arm_fac",
  "arm_par",
  "arm_for",
  "arm_und",
  "hox_1",
  "hox_2",
  "big",
  "jolly",
  "wwh",
  "pbr",
  "welcome_to_the_jungle_1",
  "welcome_to_the_jungle_2",
  "pbr2",
  "chca",
  "mad",
  "mex",
  "brb",
  "corp",
  "escape_cafe_day",
  "escape_park_day",
  "escape_street",
  "escape_overpass",
  "escape_garage",
  "deep",
  "trai",
  "firestarter_1",
  "firestarter_2",
  "firestarter_3",
  "watchdogs_1",
  "watchdogs_1_night",
  "watchdogs_2", 
  "watchdogs_2_night",
  "peta",
  "peta2",
  "nightclub",
  "election_day_1",
  "election_day_3_skip2",
  "election_day_2"
  
  
}

local heistnames = {
  "First World Bank", 
  "Heat Street",
  "Counterfeit",
  "Diamond Heist",
  "Green Bridge",
  "No Mercy",
  "Panic Room",
  "Undercover",
  "Slaughterhouse",
  "Art Gallery",
  "Bank Heist",
  "Go Bank",
  "Reservoir Dogs",
  "Alesso Heist",
  "Transport: Crossroads",
  "Transport: Downtown",
  "Transport: Harbor",
  "Transport: Park",
  "Transport: Train Heist",
  "Transport: Underpass",
  "Hoxton Breakout: Day 1",
  "Hoxton Breakout: Day 2",
  "The Big Bank",
  "Aftershock",
  "Alaskan Deal",
  "Beneath The Mountain",
  "Big Oil: Day 1",
  "Big Oil: Day 2",
  "Birth Of Sky",
  "Black Cat",
  "Boiling Point",
  "Border Crossing",
  "Brooklyn Bank",
  "Hostile Takeover",
  "Escape: Cafe",
  "Escape: Park",
  "Escape: Street",
  "Escape: Overpass",
  "Escape: Garage",
  "Crude Awakening",
  "Lost In Transit",
  "Firestarter: Day 1",
  "Firestarter: Day 2",
  "Firestarter: Day 3",
  "Watchdogs: Day 1",
  "Watchdogs: Day 1 (night)",
  "Watchdogs: Day 2", 
  "Watchdogs: Day 2 (night)",
  "Goat Simulator: Day 1",
  "Goat Simulator: Day 2",
  "Nightclub",
  "Election Day: Day 1",
  "Election Day: Day 3",
  "Election Day: Day 2"
  
}



--  "spawn_delay_1"     : "15-30",  (seconds delay)
--	"spawn_delay_2"     : "10-25",
--	"spawn_delay_3"     : "5-10",
--	"spawn_delay_4"	    : "2-5",
--	"spawn_delay_5"	    : "1-2",
--	"spawn_delay_6"	    : "0-1",

--[[
  The settings for each map are below. You can adjust them as necessary. Most of the settings
  will likely be either too easy, just right or too hard. Only a select handful of maps have
  been playtested for the preset values. Make each your own by adjusting the preset values.
  
  If a loud map you like is not listed below, that means it will use defaultSettings() listed
  below the presets. It's a general setting that may be too easy for some maps. If you want to
  make your own presets, you can see the internal heist names on the fandom wiki...
  https://payday.fandom.com/wiki/Category:PAYDAY_2_heists
  
  To adjust the number of enemies for a particular map, all you have to do is change the assault_pool
  value in the presets below. 2 values are controlled by the assault pool value:
  
    max_spawn = maximum number of units allowed on the map
    threshold = the minimum amount of enemies (it will mass spawn to hit that value)
  
  The calculation: 
  
    max_spawn = assault_pool x 0.35
    threshold = assault_pool x 0.175
    --------------------------------
  ]]


function loadSettings(i)
  local level_id = heistlevels[i]
  local level_name = heistnames[i]
  --[[
        CLASSICS
  
    ]]
  if level_id == "red2" then  --First World Bank
    AlvasMod.settings.assault_pool = 170
    AlvasMod.settings.assault_team_size = 16
    AlvasMod.settings.en_cloakers = true
    AlvasMod.settings.en_teargas = true
    AlvasMod.settings.en_megaspawn = true
    AlvasMod.settings.en_fbi_sniper = true
    AlvasMod.settings.fbi_sniper_limit = 2
    AlvasMod.settings.adm_sniper_count = 2
    AlvasMod.settings.dozer_spawn = 5
    AlvasMod.settings.spawn_delay = 4
    
  elseif level_id == "run" then  --Heat Street
    AlvasMod.settings.assault_pool = 180
    AlvasMod.settings.assault_team_size = 16
    AlvasMod.settings.en_cloakers = true
    AlvasMod.settings.en_teargas = false
    AlvasMod.settings.en_megaspawn = true
    AlvasMod.settings.en_fbi_sniper = true
    AlvasMod.settings.fbi_sniper_limit = 1
    AlvasMod.settings.adm_sniper_count = 2
    AlvasMod.settings.dozer_spawn = 3
    AlvasMod.settings.spawn_delay = 6
    
  elseif level_id == "pal" then  --Counterfeit
    AlvasMod.settings.assault_pool = 140
    AlvasMod.settings.assault_team_size = 16
    AlvasMod.settings.en_cloakers = true
    AlvasMod.settings.en_teargas = true
    AlvasMod.settings.en_megaspawn = true
    AlvasMod.settings.en_fbi_sniper = true
    AlvasMod.settings.fbi_sniper_limit = 1
    AlvasMod.settings.adm_sniper_count = 1
    AlvasMod.settings.dozer_spawn = 3
    AlvasMod.settings.spawn_delay = 3
    
   elseif level_id == "dah" then --Diamond Heist
    AlvasMod.settings.assault_pool = 200
    AlvasMod.settings.assault_team_size = 16
    AlvasMod.settings.en_cloakers = true
    AlvasMod.settings.en_teargas = false
    AlvasMod.settings.en_megaspawn = false
    AlvasMod.settings.en_fbi_sniper = true
    AlvasMod.settings.fbi_sniper_limit = 1
    AlvasMod.settings.adm_sniper_count = 2
    AlvasMod.settings.dozer_spawn = 3
    AlvasMod.settings.spawn_delay = 5 
    
    elseif level_id == "glace" then  --Green Bridge
    AlvasMod.settings.assault_pool = 150
    AlvasMod.settings.assault_team_size = 16
    AlvasMod.settings.en_cloakers = true
    AlvasMod.settings.en_teargas = false
    AlvasMod.settings.en_megaspawn = true
    AlvasMod.settings.en_fbi_sniper = false
    AlvasMod.settings.fbi_sniper_limit = 1
    AlvasMod.settings.adm_sniper_count = 1
    AlvasMod.settings.dozer_spawn = 3
    AlvasMod.settings.spawn_delay = 4
    
    elseif level_id == "nmh" then  --No Mercy
    AlvasMod.settings.assault_pool = 240
    AlvasMod.settings.assault_team_size = 16
    AlvasMod.settings.en_cloakers = true
    AlvasMod.settings.en_teargas = false
    AlvasMod.settings.en_megaspawn = true
    AlvasMod.settings.en_fbi_sniper = false
    AlvasMod.settings.adm_sniper_count = 1
    AlvasMod.settings.dozer_spawn = 1
    AlvasMod.settings.spawn_delay = 6 
    
    elseif level_id == "flat" then  --Panic Room
    AlvasMod.settings.assault_pool = 160
    AlvasMod.settings.assault_team_size = 16
    AlvasMod.settings.en_cloakers = true
    AlvasMod.settings.en_teargas = true
    AlvasMod.settings.en_megaspawn = true
    AlvasMod.settings.en_fbi_sniper = false
    AlvasMod.settings.fbi_sniper_limit = 1
    AlvasMod.settings.adm_sniper_count = 2
    AlvasMod.settings.dozer_spawn = 3
    AlvasMod.settings.spawn_delay = 2 
    
    elseif level_id == "man" then  --Undercover
    AlvasMod.settings.assault_pool = 120
    AlvasMod.settings.assault_team_size = 16
    AlvasMod.settings.en_cloakers = true
    AlvasMod.settings.en_teargas = true
    AlvasMod.settings.en_megaspawn = true
    AlvasMod.settings.en_fbi_sniper = false
    AlvasMod.settings.fbi_sniper_limit = 1
    AlvasMod.settings.adm_sniper_count = 1
    AlvasMod.settings.dozer_spawn = 2
    AlvasMod.settings.spawn_delay = 3 
    
    elseif level_id == "dinner" then  --Slaughterhouse
    AlvasMod.settings.assault_pool = 150
    AlvasMod.settings.assault_team_size = 16
    AlvasMod.settings.en_cloakers = true
    AlvasMod.settings.en_teargas = false
    AlvasMod.settings.en_megaspawn = true
    AlvasMod.settings.en_fbi_sniper = false
    AlvasMod.settings.fbi_sniper_limit = 1
    AlvasMod.settings.adm_sniper_count = 1
    AlvasMod.settings.dozer_spawn = 2
    AlvasMod.settings.spawn_delay = 3 
    
    --[[
    
          BAIN
          
      ]]
    elseif level_id == "gallery" then  --Art Gallery
    AlvasMod.settings.assault_pool = 160
    AlvasMod.settings.assault_team_size = 16
    AlvasMod.settings.en_cloakers = true
    AlvasMod.settings.en_teargas = true
    AlvasMod.settings.en_megaspawn = true
    AlvasMod.settings.en_fbi_sniper = true
    AlvasMod.settings.fbi_sniper_limit = 1
    AlvasMod.settings.adm_sniper_count = 2
    AlvasMod.settings.dozer_spawn = 3
    AlvasMod.settings.spawn_delay = 3 
    
    elseif level_id == "branchbank" then  -- Bank Heist: All (Harvest & Trustee)
    AlvasMod.settings.assault_pool = 220
    AlvasMod.settings.assault_team_size = 16
    AlvasMod.settings.en_cloakers = true
    AlvasMod.settings.en_teargas = false
    AlvasMod.settings.en_megaspawn = true
    AlvasMod.settings.en_fbi_sniper = true
    AlvasMod.settings.fbi_sniper_limit = 3
    AlvasMod.settings.adm_sniper_count = 3
    AlvasMod.settings.dozer_spawn = 3
    AlvasMod.settings.spawn_delay = 3 
    
    elseif level_id == "roberts" then  -- Go Bank
    AlvasMod.settings.assault_pool = 180
    AlvasMod.settings.assault_team_size = 16
    AlvasMod.settings.en_cloakers = true
    AlvasMod.settings.en_teargas = false
    AlvasMod.settings.en_megaspawn = true
    AlvasMod.settings.en_fbi_sniper = true
    AlvasMod.settings.fbi_sniper_limit = 1
    AlvasMod.settings.adm_sniper_count = 2
    AlvasMod.settings.dozer_spawn = 3
    AlvasMod.settings.spawn_delay = 3 
    
    elseif level_id == "rvd1" then  -- Reservoir Dogs
    AlvasMod.settings.assault_pool = 150
    AlvasMod.settings.assault_team_size = 16
    AlvasMod.settings.en_cloakers = true
    AlvasMod.settings.en_teargas = false
    AlvasMod.settings.en_megaspawn = true
    AlvasMod.settings.en_fbi_sniper = false
    AlvasMod.settings.fbi_sniper_limit = 1
    AlvasMod.settings.adm_sniper_count = 2
    AlvasMod.settings.dozer_spawn = 3
    AlvasMod.settings.spawn_delay = 3 
    
    elseif level_id == "arena" then  -- Alesso Heist
    AlvasMod.settings.assault_pool = 130
    AlvasMod.settings.assault_team_size = 16
    AlvasMod.settings.en_cloakers = true
    AlvasMod.settings.en_teargas = false
    AlvasMod.settings.en_megaspawn = true
    AlvasMod.settings.en_fbi_sniper = false
    AlvasMod.settings.fbi_sniper_limit = 1
    AlvasMod.settings.adm_sniper_count = 2
    AlvasMod.settings.dozer_spawn = 3
    AlvasMod.settings.spawn_delay = 3
    
    elseif level_id == "arm_cro" then  -- Transport: Crossroads
    AlvasMod.settings.assault_pool = 120
    AlvasMod.settings.assault_team_size = 16
    AlvasMod.settings.en_cloakers = true
    AlvasMod.settings.en_teargas = false
    AlvasMod.settings.en_megaspawn = true
    AlvasMod.settings.en_fbi_sniper = true
    AlvasMod.settings.fbi_sniper_limit = 1
    AlvasMod.settings.adm_sniper_count = 1
    AlvasMod.settings.dozer_spawn = 1
    AlvasMod.settings.spawn_delay = 4
    
    elseif level_id == "arm_hcm" then  -- Transport: Downtown
    AlvasMod.settings.assault_pool = 150
    AlvasMod.settings.assault_team_size = 16
    AlvasMod.settings.en_cloakers = true
    AlvasMod.settings.en_teargas = false
    AlvasMod.settings.en_megaspawn = true
    AlvasMod.settings.en_fbi_sniper = true
    AlvasMod.settings.fbi_sniper_limit = 1
    AlvasMod.settings.adm_sniper_count = 1
    AlvasMod.settings.dozer_spawn = 3
    AlvasMod.settings.spawn_delay = 4
    
    elseif level_id == "arm_fac" then  -- Transport: Harbor
    AlvasMod.settings.assault_pool = 120
    AlvasMod.settings.assault_team_size = 16
    AlvasMod.settings.en_cloakers = true
    AlvasMod.settings.en_teargas = false
    AlvasMod.settings.en_megaspawn = true
    AlvasMod.settings.en_fbi_sniper = true
    AlvasMod.settings.fbi_sniper_limit = 1
    AlvasMod.settings.adm_sniper_count = 1
    AlvasMod.settings.dozer_spawn = 2
    AlvasMod.settings.spawn_delay = 4
    
    elseif level_id == "arm_par" then  -- Transport: Park
    AlvasMod.settings.assault_pool = 120
    AlvasMod.settings.assault_team_size = 16
    AlvasMod.settings.en_cloakers = true
    AlvasMod.settings.en_teargas = false
    AlvasMod.settings.en_megaspawn = true
    AlvasMod.settings.en_fbi_sniper = false
    AlvasMod.settings.fbi_sniper_limit = 1
    AlvasMod.settings.adm_sniper_count = 2
    AlvasMod.settings.dozer_spawn = 1
    AlvasMod.settings.spawn_delay = 3
    
    elseif level_id == "arm_for" then  -- Transport: Train Heist
    AlvasMod.settings.assault_pool = 140
    AlvasMod.settings.assault_team_size = 16
    AlvasMod.settings.en_cloakers = true
    AlvasMod.settings.en_teargas = false
    AlvasMod.settings.en_megaspawn = true
    AlvasMod.settings.en_fbi_sniper = false
    AlvasMod.settings.fbi_sniper_limit = 1
    AlvasMod.settings.adm_sniper_count = 1
    AlvasMod.settings.dozer_spawn = 1
    AlvasMod.settings.spawn_delay = 3
    
    elseif level_id == "arm_und" then  -- Transport: Underpass
    AlvasMod.settings.assault_pool = 120
    AlvasMod.settings.assault_team_size = 16
    AlvasMod.settings.en_cloakers = true
    AlvasMod.settings.en_teargas = false
    AlvasMod.settings.en_megaspawn = true
    AlvasMod.settings.en_fbi_sniper = true
    AlvasMod.settings.fbi_sniper_limit = 1
    AlvasMod.settings.adm_sniper_count = 2
    AlvasMod.settings.dozer_spawn = 2
    AlvasMod.settings.spawn_delay = 3
    
    elseif level_id == "hox_1" then  -- Hoxton Breakout: Part 1
    AlvasMod.settings.assault_pool = 180
    AlvasMod.settings.assault_team_size = 16
    AlvasMod.settings.en_cloakers = true
    AlvasMod.settings.en_teargas = false
    AlvasMod.settings.en_megaspawn = true
    AlvasMod.settings.en_fbi_sniper = true
    AlvasMod.settings.fbi_sniper_limit = 4
    AlvasMod.settings.adm_sniper_count = 2
    AlvasMod.settings.dozer_spawn = 3
    AlvasMod.settings.spawn_delay = 4
    
    elseif level_id == "hox_2" then  -- Hoxton Breakout: Part 2
    AlvasMod.settings.assault_pool = 150
    AlvasMod.settings.assault_team_size = 24
    AlvasMod.settings.en_cloakers = true
    AlvasMod.settings.en_teargas = true
    AlvasMod.settings.en_megaspawn = true
    AlvasMod.settings.en_fbi_sniper = true
    AlvasMod.settings.fbi_sniper_limit = 4
    AlvasMod.settings.adm_sniper_count = 3
    AlvasMod.settings.dozer_spawn = 3
    AlvasMod.settings.spawn_delay = 4
    
    elseif level_id == "big" then  -- The Big Bank
    AlvasMod.settings.assault_pool = 140
    AlvasMod.settings.assault_team_size = 16
    AlvasMod.settings.en_cloakers = true
    AlvasMod.settings.en_teargas = false
    AlvasMod.settings.en_megaspawn = true
    AlvasMod.settings.en_fbi_sniper = true
    AlvasMod.settings.fbi_sniper_limit = 1
    AlvasMod.settings.adm_sniper_count = 3
    AlvasMod.settings.dozer_spawn = 1
    AlvasMod.settings.spawn_delay = 5
    
    elseif level_id == "jolly" then  -- Aftershock
    AlvasMod.settings.assault_pool = 140
    AlvasMod.settings.assault_team_size = 24
    AlvasMod.settings.en_cloakers = true
    AlvasMod.settings.en_teargas = false
    AlvasMod.settings.en_megaspawn = true
    AlvasMod.settings.en_fbi_sniper = false
    AlvasMod.settings.fbi_sniper_limit = 1
    AlvasMod.settings.adm_sniper_count = 1
    AlvasMod.settings.dozer_spawn = 2
    AlvasMod.settings.spawn_delay = 4
    
    elseif level_id == "wwh" then  -- Alaskan Deal
    AlvasMod.settings.assault_pool = 120
    AlvasMod.settings.assault_team_size = 16
    AlvasMod.settings.en_cloakers = true
    AlvasMod.settings.en_teargas = false
    AlvasMod.settings.en_megaspawn = true
    AlvasMod.settings.en_fbi_sniper = false
    AlvasMod.settings.fbi_sniper_limit = 1
    AlvasMod.settings.adm_sniper_count = 2
    AlvasMod.settings.dozer_spawn = 3
    AlvasMod.settings.spawn_delay = 4
    
    elseif level_id == "pbr" then  -- Beneath The Mountain
    AlvasMod.settings.assault_pool = 120
    AlvasMod.settings.assault_team_size = 16
    AlvasMod.settings.en_cloakers = true
    AlvasMod.settings.en_teargas = false
    AlvasMod.settings.en_megaspawn = true
    AlvasMod.settings.en_fbi_sniper = false
    AlvasMod.settings.fbi_sniper_limit = 1
    AlvasMod.settings.adm_sniper_count = 2
    AlvasMod.settings.dozer_spawn = 3
    AlvasMod.settings.spawn_delay = 4
    
    elseif level_id == "welcome_to_the_jungle_1" then  -- Big Oil: Day 1
    AlvasMod.settings.assault_pool = 120
    AlvasMod.settings.assault_team_size = 16
    AlvasMod.settings.en_cloakers = true
    AlvasMod.settings.en_teargas = true
    AlvasMod.settings.en_megaspawn = true
    AlvasMod.settings.en_fbi_sniper = true
    AlvasMod.settings.fbi_sniper_limit = 1
    AlvasMod.settings.adm_sniper_count = 2
    AlvasMod.settings.dozer_spawn = 3
    AlvasMod.settings.spawn_delay = 3
    
    elseif level_id == "welcome_to_the_jungle_2" then  -- Big Oil: Day 2
    AlvasMod.settings.assault_pool = 140
    AlvasMod.settings.assault_team_size = 16
    AlvasMod.settings.en_cloakers = true
    AlvasMod.settings.en_teargas = true
    AlvasMod.settings.en_megaspawn = true
    AlvasMod.settings.en_fbi_sniper = true
    AlvasMod.settings.fbi_sniper_limit = 2
    AlvasMod.settings.adm_sniper_count = 2
    AlvasMod.settings.dozer_spawn = 3
    AlvasMod.settings.spawn_delay = 5
    
    elseif level_id == "pbr2" then  -- Birth Of Sky
    AlvasMod.settings.assault_pool = 100
    AlvasMod.settings.assault_team_size = 16
    AlvasMod.settings.en_cloakers = true
    AlvasMod.settings.en_teargas = true
    AlvasMod.settings.en_megaspawn = true
    AlvasMod.settings.en_fbi_sniper = true
    AlvasMod.settings.fbi_sniper_limit = 2
    AlvasMod.settings.adm_sniper_count = 2
    AlvasMod.settings.dozer_spawn = 3
    AlvasMod.settings.spawn_delay = 5
    
    elseif level_id == "chca" then  -- Black Cat
    AlvasMod.settings.assault_pool = 100
    AlvasMod.settings.assault_team_size = 16
    AlvasMod.settings.en_cloakers = true
    AlvasMod.settings.en_teargas = true
    AlvasMod.settings.en_megaspawn = true
    AlvasMod.settings.en_fbi_sniper = true
    AlvasMod.settings.fbi_sniper_limit = 1
    AlvasMod.settings.adm_sniper_count = 2
    AlvasMod.settings.dozer_spawn = 3
    AlvasMod.settings.spawn_delay = 5
    
    elseif level_id == "mad" then  -- Boiling Point
    AlvasMod.settings.assault_pool = 100
    AlvasMod.settings.assault_team_size = 16
    AlvasMod.settings.en_cloakers = true
    AlvasMod.settings.en_teargas = true
    AlvasMod.settings.en_megaspawn = true
    AlvasMod.settings.en_fbi_sniper = true
    AlvasMod.settings.fbi_sniper_limit = 1
    AlvasMod.settings.adm_sniper_count = 2
    AlvasMod.settings.dozer_spawn = 3
    AlvasMod.settings.spawn_delay = 5
    
    elseif level_id == "mex" then  -- Border Crossing
    AlvasMod.settings.assault_pool = 120
    AlvasMod.settings.assault_team_size = 16
    AlvasMod.settings.en_cloakers = true
    AlvasMod.settings.en_teargas = true
    AlvasMod.settings.en_megaspawn = true
    AlvasMod.settings.en_fbi_sniper = true
    AlvasMod.settings.fbi_sniper_limit = 1
    AlvasMod.settings.adm_sniper_count = 2
    AlvasMod.settings.dozer_spawn = 3
    AlvasMod.settings.spawn_delay = 5
    
    elseif level_id == "brb" then  -- Brookyln Bank
    AlvasMod.settings.assault_pool = 160
    AlvasMod.settings.assault_team_size = 16
    AlvasMod.settings.en_cloakers = true
    AlvasMod.settings.en_teargas = true
    AlvasMod.settings.en_megaspawn = true
    AlvasMod.settings.en_fbi_sniper = true
    AlvasMod.settings.fbi_sniper_limit = 2
    AlvasMod.settings.adm_sniper_count = 2
    AlvasMod.settings.dozer_spawn = 4
    AlvasMod.settings.spawn_delay = 5
    
    elseif level_id == "corp" then  -- Hostile Takeover
    AlvasMod.settings.assault_pool = 280
    AlvasMod.settings.assault_team_size = 24
    AlvasMod.settings.en_cloakers = true
    AlvasMod.settings.en_teargas = true
    AlvasMod.settings.en_megaspawn = true
    AlvasMod.settings.en_fbi_sniper = true
    AlvasMod.settings.fbi_sniper_limit = 3
    AlvasMod.settings.adm_sniper_count = 2
    AlvasMod.settings.dozer_spawn = 5
    AlvasMod.settings.spawn_delay = 5
    
    elseif level_id == "escape_cafe_day" then  -- Escape: Cafe
    AlvasMod.settings.assault_pool = 180
    AlvasMod.settings.assault_team_size = 16
    AlvasMod.settings.en_cloakers = true
    AlvasMod.settings.en_teargas = true
    AlvasMod.settings.en_megaspawn = true
    AlvasMod.settings.en_fbi_sniper = true
    AlvasMod.settings.fbi_sniper_limit = 3
    AlvasMod.settings.adm_sniper_count = 2
    AlvasMod.settings.dozer_spawn = 3
    AlvasMod.settings.spawn_delay = 4
    
    elseif level_id == "escape_park_day" then  -- Escape: Park
    AlvasMod.settings.assault_pool = 180
    AlvasMod.settings.assault_team_size = 16
    AlvasMod.settings.en_cloakers = true
    AlvasMod.settings.en_teargas = true
    AlvasMod.settings.en_megaspawn = true
    AlvasMod.settings.en_fbi_sniper = true
    AlvasMod.settings.fbi_sniper_limit = 3
    AlvasMod.settings.adm_sniper_count = 2
    AlvasMod.settings.dozer_spawn = 3
    AlvasMod.settings.spawn_delay = 4
    
    elseif level_id == "escape_street" then  -- Escape: Street
    AlvasMod.settings.assault_pool = 180
    AlvasMod.settings.assault_team_size = 16
    AlvasMod.settings.en_cloakers = true
    AlvasMod.settings.en_teargas = true
    AlvasMod.settings.en_megaspawn = true
    AlvasMod.settings.en_fbi_sniper = true
    AlvasMod.settings.fbi_sniper_limit = 3
    AlvasMod.settings.adm_sniper_count = 2
    AlvasMod.settings.dozer_spawn = 3
    AlvasMod.settings.spawn_delay = 4
    
    elseif level_id == "escape_overpass" then  -- Escape: Overpass
    AlvasMod.settings.assault_pool = 200
    AlvasMod.settings.assault_team_size = 16
    AlvasMod.settings.en_cloakers = true
    AlvasMod.settings.en_teargas = false
    AlvasMod.settings.en_megaspawn = true
    AlvasMod.settings.en_fbi_sniper = true
    AlvasMod.settings.fbi_sniper_limit = 3
    AlvasMod.settings.adm_sniper_count = 2
    AlvasMod.settings.dozer_spawn = 3
    AlvasMod.settings.spawn_delay = 4
    
    elseif level_id == "escape_garage" then  -- Escape: Garage
    AlvasMod.settings.assault_pool = 150
    AlvasMod.settings.assault_team_size = 16
    AlvasMod.settings.en_cloakers = true
    AlvasMod.settings.en_teargas = false
    AlvasMod.settings.en_megaspawn = true
    AlvasMod.settings.en_fbi_sniper = true
    AlvasMod.settings.fbi_sniper_limit = 1
    AlvasMod.settings.adm_sniper_count = 2
    AlvasMod.settings.dozer_spawn = 3
    AlvasMod.settings.spawn_delay = 4
    
    elseif level_id == "deep" then  -- Crude Awakening
    AlvasMod.settings.assault_pool = 220
    AlvasMod.settings.assault_team_size = 16
    AlvasMod.settings.en_cloakers = true
    AlvasMod.settings.en_teargas = true
    AlvasMod.settings.en_megaspawn = true
    AlvasMod.settings.en_fbi_sniper = true
    AlvasMod.settings.fbi_sniper_limit = 1
    AlvasMod.settings.adm_sniper_count = 2
    AlvasMod.settings.dozer_spawn = 3
    AlvasMod.settings.spawn_delay = 5
    
    elseif level_id == "ranc" then  -- Midland Ranch
    AlvasMod.settings.assault_pool = 220
    AlvasMod.settings.assault_team_size = 16
    AlvasMod.settings.en_cloakers = true
    AlvasMod.settings.en_teargas = false
    AlvasMod.settings.en_megaspawn = true
    AlvasMod.settings.en_fbi_sniper = false
    AlvasMod.settings.fbi_sniper_limit = 0
    AlvasMod.settings.adm_sniper_count = 2
    AlvasMod.settings.dozer_spawn = 3
    AlvasMod.settings.spawn_delay = 5
    
    elseif level_id == "trai" then  -- Lost In Transit
    AlvasMod.settings.assault_pool = 220
    AlvasMod.settings.assault_team_size = 16
    AlvasMod.settings.en_cloakers = true
    AlvasMod.settings.en_teargas = false
    AlvasMod.settings.en_megaspawn = true
    AlvasMod.settings.en_fbi_sniper = false
    AlvasMod.settings.fbi_sniper_limit = 1
    AlvasMod.settings.adm_sniper_count = 2
    AlvasMod.settings.dozer_spawn = 3
    AlvasMod.settings.spawn_delay = 5
    
    elseif level_id == "firestarter_1" then  -- Firestarter: Day 1
    AlvasMod.settings.assault_pool = 170
    AlvasMod.settings.assault_team_size = 16
    AlvasMod.settings.en_cloakers = true
    AlvasMod.settings.en_teargas = false
    AlvasMod.settings.en_megaspawn = true
    AlvasMod.settings.en_fbi_sniper = false
    AlvasMod.settings.fbi_sniper_limit = 0
    AlvasMod.settings.adm_sniper_count = 2
    AlvasMod.settings.dozer_spawn = 3
    AlvasMod.settings.spawn_delay = 4
    
    elseif level_id == "firestarter_2" then  -- Firestarter: Day 2
    AlvasMod.settings.assault_pool = 200
    AlvasMod.settings.assault_team_size = 16
    AlvasMod.settings.en_cloakers = true
    AlvasMod.settings.en_teargas = false
    AlvasMod.settings.en_megaspawn = true
    AlvasMod.settings.en_fbi_sniper = false
    AlvasMod.settings.fbi_sniper_limit = 0
    AlvasMod.settings.adm_sniper_count = 2
    AlvasMod.settings.dozer_spawn = 3
    AlvasMod.settings.spawn_delay = 4
    
    elseif level_id == "firestarter_3" then  -- Firestarter: Day 3
    AlvasMod.settings.assault_pool = 200
    AlvasMod.settings.assault_team_size = 16
    AlvasMod.settings.en_cloakers = true
    AlvasMod.settings.en_teargas = false
    AlvasMod.settings.en_megaspawn = true
    AlvasMod.settings.en_fbi_sniper = true
    AlvasMod.settings.fbi_sniper_limit = 1
    AlvasMod.settings.adm_sniper_count = 2
    AlvasMod.settings.dozer_spawn = 3
    AlvasMod.settings.spawn_delay = 5
    
    elseif level_id == "watchdogs_1" then  -- Watchdogs: Day 1
    AlvasMod.settings.assault_pool = 200
    AlvasMod.settings.assault_team_size = 16
    AlvasMod.settings.en_cloakers = true
    AlvasMod.settings.en_teargas = false
    AlvasMod.settings.en_megaspawn = true
    AlvasMod.settings.en_fbi_sniper = true
    AlvasMod.settings.fbi_sniper_limit = 1
    AlvasMod.settings.adm_sniper_count = 2
    AlvasMod.settings.dozer_spawn = 3
    AlvasMod.settings.spawn_delay = 5
    
    elseif level_id == "watchdogs_1_night" then  -- Watchdogs: Day 1
    AlvasMod.settings.assault_pool = 180
    AlvasMod.settings.assault_team_size = 16
    AlvasMod.settings.en_cloakers = true
    AlvasMod.settings.en_teargas = false
    AlvasMod.settings.en_megaspawn = true
    AlvasMod.settings.en_fbi_sniper = false
    AlvasMod.settings.fbi_sniper_limit = 0
    AlvasMod.settings.adm_sniper_count = 2
    AlvasMod.settings.dozer_spawn = 3
    AlvasMod.settings.spawn_delay = 4
    
    elseif level_id == "watchdogs_2" then  -- Watchdogs: Day 2
    AlvasMod.settings.assault_pool = 220
    AlvasMod.settings.assault_team_size = 16
    AlvasMod.settings.en_cloakers = true
    AlvasMod.settings.en_teargas = false
    AlvasMod.settings.en_megaspawn = true
    AlvasMod.settings.en_fbi_sniper = true
    AlvasMod.settings.fbi_sniper_limit = 1
    AlvasMod.settings.adm_sniper_count = 2
    AlvasMod.settings.dozer_spawn = 3
    AlvasMod.settings.spawn_delay = 5
    
    elseif level_id == "watchdogs_2_night" then  -- Watchdogs: Day 2
    AlvasMod.settings.assault_pool = 200
    AlvasMod.settings.assault_team_size = 16
    AlvasMod.settings.en_cloakers = true
    AlvasMod.settings.en_teargas = false
    AlvasMod.settings.en_megaspawn = true
    AlvasMod.settings.en_fbi_sniper = false
    AlvasMod.settings.fbi_sniper_limit = 0
    AlvasMod.settings.adm_sniper_count = 1
    AlvasMod.settings.dozer_spawn = 3
    AlvasMod.settings.spawn_delay = 4
    
    elseif level_id == "peta" then  -- Goat Simulator: Day 1
    AlvasMod.settings.assault_pool = 180
    AlvasMod.settings.assault_team_size = 16
    AlvasMod.settings.en_cloakers = true
    AlvasMod.settings.en_teargas = false
    AlvasMod.settings.en_megaspawn = true
    AlvasMod.settings.en_fbi_sniper = false
    AlvasMod.settings.fbi_sniper_limit = 0
    AlvasMod.settings.adm_sniper_count = 1
    AlvasMod.settings.dozer_spawn = 2
    AlvasMod.settings.spawn_delay = 4
    elseif level_id == "peta2" then  -- Goat Simulator: Day 2
    AlvasMod.settings.assault_pool = 160
    AlvasMod.settings.assault_team_size = 16
    AlvasMod.settings.en_cloakers = true
    AlvasMod.settings.en_teargas = false
    AlvasMod.settings.en_megaspawn = true
    AlvasMod.settings.en_fbi_sniper = false
    AlvasMod.settings.fbi_sniper_limit = 0
    AlvasMod.settings.adm_sniper_count = 1
    AlvasMod.settings.dozer_spawn = 3
    AlvasMod.settings.spawn_delay = 4
    elseif level_id == "nightclub" then  -- Nightclub
    AlvasMod.settings.assault_pool = 220
    AlvasMod.settings.assault_team_size = 16
    AlvasMod.settings.en_cloakers = true
    AlvasMod.settings.en_teargas = false
    AlvasMod.settings.en_megaspawn = true
    AlvasMod.settings.en_fbi_sniper = false
    AlvasMod.settings.fbi_sniper_limit = 0
    AlvasMod.settings.adm_sniper_count = 2
    AlvasMod.settings.dozer_spawn = 4
    AlvasMod.settings.spawn_delay = 5
    
    elseif level_id == "election_day_1" then  -- Election Day: Day 1
    AlvasMod.settings.assault_pool = 180
    AlvasMod.settings.assault_team_size = 16
    AlvasMod.settings.en_cloakers = true
    AlvasMod.settings.en_teargas = false
    AlvasMod.settings.en_megaspawn = true
    AlvasMod.settings.en_fbi_sniper = false
    AlvasMod.settings.fbi_sniper_limit = 0
    AlvasMod.settings.adm_sniper_count = 1
    AlvasMod.settings.dozer_spawn = 4
    AlvasMod.settings.spawn_delay = 5
    
    elseif level_id == "election_day_3_skip2" then  -- Election Day: Day 3
    AlvasMod.settings.assault_pool = 200
    AlvasMod.settings.assault_team_size = 16
    AlvasMod.settings.en_cloakers = true
    AlvasMod.settings.en_teargas = false
    AlvasMod.settings.en_megaspawn = true
    AlvasMod.settings.en_fbi_sniper = false
    AlvasMod.settings.fbi_sniper_limit = 0
    AlvasMod.settings.adm_sniper_count = 2
    AlvasMod.settings.dozer_spawn = 4
    AlvasMod.settings.spawn_delay = 5
    
    elseif level_id == "election_day_2" then  -- Election Day: Day 2
    AlvasMod.settings.assault_pool = 130
    AlvasMod.settings.assault_team_size = 16
    AlvasMod.settings.en_cloakers = true
    AlvasMod.settings.en_teargas = false
    AlvasMod.settings.en_megaspawn = true
    AlvasMod.settings.en_fbi_sniper = false
    AlvasMod.settings.fbi_sniper_limit = 1
    AlvasMod.settings.adm_sniper_count = 2
    AlvasMod.settings.dozer_spawn = 4
    AlvasMod.settings.spawn_delay = 5
  end
  
  AlvasMod:save()
  
  DelayedCalls:Add("show_message_delayed2", 4, function()
        if managers.chat and level_name then
          AlvasMod:broadcast("Presets loaded for " .. level_name)
        end
  end)
  
end

function defaultSettings()
    AlvasMod.settings.assault_pool = 150
    AlvasMod.settings.assault_team_size = 16
    AlvasMod.settings.en_cloakers = true
    AlvasMod.settings.en_teargas = false
    AlvasMod.settings.en_megaspawn = true
    AlvasMod.settings.en_fbi_sniper = true
    AlvasMod.settings.fbi_sniper_limit = 1
    AlvasMod.settings.adm_sniper_count = 2
    AlvasMod.settings.dozer_spawn = 3
    AlvasMod.settings.spawn_delay = 4
    AlvasMod:save()
end

local function disable_elements(element_list)
  
  for _, script in pairs(managers.mission:scripts()) do
			for id, element in pairs(script:elements()) do
        for i = 1, #element_list do
          if element:id() == element_list[i] then
            element:set_enabled(false)
          end
        end
      end
  end
        
end

local function setupScripts ()
  
  local level = managers.job:current_level_id()
  
  if level == "peta" then -- Goat Simulator
    local element_list = {
     100015,136823,137123,137423,136973,100366
    }
    disable_elements(element_list)
    --reserved
  end
  
  if level == "peta2" then
    local element_list = {
      100366,138723,100015,138873,138423,138573,100378,138552,
      100406,100407,100401,100402,100403,100398,100400,100399
    }
    disable_elements(element_list)
  end
  
  if level == "red2" then
   for _, script in pairs(managers.mission:scripts()) do
			for id, element in pairs(script:elements()) do
          if element:id() == 103231 then
            element:set_enabled(true)
          end
          if element:id() == 100529 then
            element:set_enabled(true)
          end
          
          --reserved
      end
   end
  end
  
  if level == "election_day_2" then
    
    local element_list = {
      
      100015,100366
    }
    
    disable_elements(element_list)
    
  end
  
  
end




Hooks:PostHook(BaseNetworkSession, "on_load_complete", "lobby_start", function(self)
if not Network:is_server() then return end

if AlvasMod then
  AlvasMod:init()
end

if not AlvasMod then return end



if AlvasMod.settings.lobby_name then
  local custom_name = ""
  local path = AlvasMod._path .. "lobbyname.txt"
  local file = io.open(path, "r")

  if file then
    for line in file:lines() do
      custom_name = custom_name .. line
    end
  end
  
  file.close()

  if custom_name then
    if managers.network.matchmake._lobby_attributes and managers.network.matchmake.lobby_handler then
       managers.network.matchmake._lobby_attributes.owner_name = custom_name
       managers.network.matchmake.lobby_handler:set_lobby_data(managers.network.matchmake._lobby_attributes)
    end
    
    local text = "Custom lobby name set to " .. utf8.char(57364) .. " " .. custom_name .. " " .. utf8.char(57364)
    DelayedCalls:Add("show_message_delayed", 2, function()
        if Utils:IsInGameState() and managers.network:session() and managers.chat then
          managers.chat:feed_system_message(ChatManager.GAME,  text )
        end
    end)
      
    DelayedCalls:Add("refresh_server", 10, function()
        if Utils:IsInGameState() and managers.network:session() then
          managers.network.matchmake:set_server_joinable(true) 
          managers.network:session():broadcast_server_up()
        end
    end)
  end
end

local level = managers.job:current_level_id()
local has_settings = false

  elite_task_data.level = level
  
  if AlvasMod.settings.en_presets then
    for i = 1, #heistlevels do   --load presets per map 
      if level == heistlevels[i] then
        loadSettings(i)
        has_settings = true
        break
      end  
    end
    
    if not has_settings then 
      defaultSettings()
    end
  end
  
    for i = 1, #specialheists do
      
      if level == specialheists[i] then
        AlvasMod.settings.specialMap = true
        AlvasMod:save()
        break
      end
      
    end
    
    for i = 1, #special_tasks do
      if elite_task_data.level == special_tasks[i] then
        elite_task_data.special_task = true
        break
      end
    end
    
  elite_task_data.assault_max_pool = math.floor(AlvasMod.settings.assault_pool * 0.35)
  elite_task_data.assault_threshold = math.floor(AlvasMod.settings.assault_pool * 0.175) 
  elite_task_data.assault_current_pool = 0
  elite_task_data.assault_force_spawn = false
  elite_task_data.spawnCall = true
  
  if AlvasMod.settings.specialMap == true then
    setupScripts()
  end
  gas_delay = TimerManager:game():time() + 5
  smoke_delay = TimerManager:game():time() + 5
  
  elite_units.medic_dozer = 0
  elite_units.marksman = 0
  elite_units.fbi_sniper = 0
  elite_limits.marksman = AlvasMod.settings.adm_sniper_count
  elite_limits.fbi_sniper = AlvasMod.settings.fbi_sniper_limit
  elite_task_data.phase = ""
  elite_task_data.phase_start = 0
  elite_task_data.phase_min = 0

  if AlvasMod.settings.en_elite_ultra then
    elite_limits.marksman = elite_limits.marksman + 1
    elite_limits.fbi_sniper = elite_limits.fbi_sniper + 2
    elite_task_data.assault_max_pool = elite_task_data.assault_max_pool * 1.30
    elite_task_data.assault_threshold = elite_task_data.assault_threshold * 1.3
  end
  
end)

Hooks:PostHook(BaseNetworkSession, "on_statistics_recieved", "team_stats", function(self, peer_id, peer_kills, peer_specials_kills, peer_head_shots, accuracy, downs)
  if not Network:is_server() or not AlvasMod then return end
  
	local peer = self:peer(peer_id)
  local hspercent = math.floor((peer_head_shots / peer_kills) * 100)
	managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", peer:name().." "..utf8.char(57364)..":"..peer_kills.."|S"..utf8.char(57364)..":"..peer_specials_kills.."|HS:"..peer_head_shots.."|HS%:" .. hspercent .. "|Acc:"..accuracy.."%|D:"..downs)

end)



Hooks:OverrideFunction(BaseNetworkSession, "send_to_peers_synched", function(self,...)
  if not Network:is_server() or not AlvasMod then return end
  
  if select(1,...) == nil then return end
  
  local event = select(1,...)
  
  if event == "action_spooc_stop" then 
    local pos = select(3,...)
    local unit = nearestUnit(pos, "spooc")
    local m_ext = unit:movement()
    local anim_data = unit:anim_data()
    local peer = AlvasMod:nearestPeer(pos)

    AlvasMod:cloaker_cloud(pos) 

    if peer then
      local state = AlvasMod:unit_state(peer:unit())
      if state and state == "incapacitated" or state == "bleedout" then
        local text = "*** " .. peer:name() .. " downed by a cloaker ***"
        AlvasMod:broadcast(text)
      elseif state == "standard" then
        local dist = mvector3.distance(peer:unit():position(), pos)
        if dist > 250 then return end

        if peer:is_host() then
          
          m_ext:set_position(peer:unit():position())
          m_ext:play_redirect("spooc_strike")
          unit:network():send("action_spooc_strike", peer:unit():position(), 1)
          DelayedCalls:Add("last_dance_1", 1.2, function()
            if alive(unit) and not anim_data.tased and not unit:character_damage():dead() then   
              unit:network():send("action_spooc_strike", peer:unit():position(), 1)
              managers.player:set_player_state("arrested", unit)
              managers.groupai:state():force_attention_data(unit)
            end
          end)
          
        else

          if unit and unit:movement() and alive(unit) then

            local sound_string = "clk_punch_3rd_person_3p"
            
            m_ext:set_position(peer:unit():position())
            m_ext:play_redirect("spooc_strike")
            unit:network():send("action_spooc_strike", peer:unit():position(), 1)
            unit:sound():say(sound_string, true, true)
            DelayedCalls:Add("last_dance_2", 1.2, function()              
               if alive(unit) and not anim_data.tased and not unit:character_damage():dead() then
                local success, result = pcall(sync_player,peer,"arrested")
                if success then
                  local text = "*** " .. peer:name() .. " was cuffed by a cloaker ***"
                  AlvasMod:broadcast(text)
                  managers.groupai:state():force_attention_data(unit)
                end
            
                
              end
            end)
            
          end
          
          
          
        end
           
      end
      
    end

  end
  

  for peer_id, peer in pairs(self._peers) do
    peer:send_queued_sync(...)
  end
  
end)   
  

