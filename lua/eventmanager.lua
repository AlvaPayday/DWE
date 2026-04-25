local levels = {
  
  run = "run",
  red2 = "red2", 
  hox_1 = "hox_1",
  hox_2 = "hox_2",
  glace = "glace",
  nightclub = "nightclub",
  election_day_1 = "election_day_1",
  election_day_3 = "election_day_3_skip2",
  election_day_2 = "election_day_2"
  
}

local _pos_offset = function ()
	local ang = math.random() * 360 * math.pi
	local rad = math.random(20, 30)
	return Vector3(math.cos(ang) * rad, math.sin(ang) * rad, 0)
end

local function smoke(posi, duration)
  managers.network:session():send_to_peers_synched("sync_smoke_grenade", posi, posi, duration, true)
  managers.groupai:state():sync_smoke_grenade(posi, posi, duration, false)
end

local function force_spawn_timer_30()
  elite_task_data.assault_force_spawn = true
  DelayedCalls:Add("deactivate_force_spawn_30", 30, function()
    elite_task_data.assault_force_spawn = false  
  end)
end

--assault_tweak(max_spawn, threshold, force_spawn)
local function trigger_smoke(pos)
  AlvasMod:cloaker_cloud(pos)
end

local function threshold_30()
  if AlvasMod.settings.en_elite_ultra then
    assault_tweak(50, 40, false)
  else
    assault_tweak(40,30,false)
  end
end


local function threshold_40()
  if AlvasMod.settings.en_elite_ultra then
    assault_tweak(65, 50, false)
  else
    assault_tweak(55,40,false)
  end
end

local function threshold_50()
  if AlvasMod.settings.en_elite_ultra then
    assault_tweak(65, 55, true)
  else
    assault_tweak(60,50, true)
  end
end

local function threshold_60()
  if AlvasMod.settings.en_elite_ultra then
    assault_tweak(75, 65, true)
  else
    assault_tweak(70,60,true)
  end
end

local function swarm()
  AlvasMod:swarm()
end

local function onslaught()
  if not elite_task_data.assault_force_spawn then
    AlvasMod:broadcast("*** Onslaught Mode Activated !!! ***")
  end
  
  if AlvasMod.settings.en_elite_ultra then
    assault_tweak(95, 80, true)
  else
    assault_tweak(85,70,true)
  end
end

local function onslaught_swarm()

  AlvasMod:broadcast("*** Onslaught Mode Activated !!! ***")

  
  if AlvasMod.settings.en_elite_ultra then
    assault_tweak(95, 80, true)
  else
    assault_tweak(85,70, true)
  end
  AlvasMod:delay_swarm(15)
end

local function stepped_swarm()
  AlvasMod:delay_swarm(5)
  AlvasMod:delay_swarm(20)
  AlvasMod:delay_swarm(40)
end

local function onslaught_stepped_swarm()

  AlvasMod:broadcast("*** Onslaught Mode Activated !!! ***")
  
  if AlvasMod.settings.en_elite_ultra then
    assault_tweak(95, 80, true)
  else
    assault_tweak(85,70, true)
  end
  stepped_swarm()
end

local function activate_spawn_points(pos, distance)
  	local area_data = managers.groupai:state()._area_data
    local nav_manager = managers.navigation
    local all_nav_segs = nav_manager._nav_segments
    local quad_field = World:quad_field()
    local state = "allow_access"
    
    if not area_data then return end
    
    for area_id, area in pairs(area_data) do
      if area.spawn_points then
        for _, sp_data in pairs(area.spawn_points) do
          if mvector3.distance(sp_data.pos, pos) < distance then
            if all_nav_segs[sp_data.nav_seg].disabled then
              all_nav_segs[sp_data.nav_seg].disabled = false
              quad_field:set_nav_segment_enabled(sp_data.nav_seg, state)
              managers.groupai:state():on_nav_segment_state_change(sp_data.nav_seg, state)
            end
            sp_data.mission_element:set_enabled(true)
          else
            --sp_data.mission_element:set_enabled(false)
          end
        end
      end
    end
end

local function death_knell()
  AlvasMod:broadcast("*** Death Knell Mode: Active ***")
  if AlvasMod.settings.en_elite_ultra then
    assault_tweak(90, 85, true)
  else
    assault_tweak(85,75, true)
  end
  elite_limits.marksman = elite_limits.marksman + 3
  elite_limits.fbi_sniper = 6
  tweak_data.group_ai.special_unit_spawn_limits.tank = 6
  tweak_data.group_ai.special_unit_spawn_limits.sniper = 6
  tweak_data.group_ai.besiege.assault.groups.tac_bull_rush = {
    0.5,
    0.5,
    0.5
  }
  tweak_data.group_ai.enemy_spawn_groups.tac_bull_rush = {
			amount = {
				6,
				6
			},
			spawn = {
				{
					amount_min = 4,
					freq = 1,
					amount_max = 6,
          respawn_cooldown = 15,
					rank = 1,
					unit = "FBI_tank",
					tactics = {"charge"}
				},
        {
					amount_min = 3,
					freq = 1,
					amount_max = 5,
          respawn_cooldown = 30,
					rank = 1,
					unit = "CS_cop_C45_R870",
					tactics = {"flank"}
				}
        
      }
  }



      
  elite_task_data.death_knell_mode = true
  stepped_swarm()
  local unit = AlvasMod:any_peer_unit()
  if unit then
    unit:sound():play("cloaker_detect_christmas_mono")
  end
  managers.groupai:state():set_wave_mode("sustain")
end

local function fwb_escape()
  if elite_task_data.level ~= levels.red2 then return end
  DelayedCalls:Add("delay_death_knell", 90, function()
      if Utils:IsInHeist() then
          death_knell()
      end
      
  end)
  local pos = Vector3(3374.6, -595.415, -734.593)
  AlvasMod:spawn_spooc(pos)
  pos = Vector3(2223.6,-206.26,-734.593)
  AlvasMod:spawn_spooc(pos)
  pos = Vector3(3832.37,-346.334,-734.593)
  AlvasMod:spawn_spooc(pos)
  pos = Vector3(4778.62, -943.821, -734.593)
  AlvasMod:spawn_spooc(pos)
end

local function hox_1_garage()
  if elite_task_data.level ~= levels.hox_1 then return end
  if AlvasMod.settings.en_elite_ultra then
    assault_tweak(45, 30, true)
  else
    assault_tweak(35,20, true)
  end
end

local function glace_start_escort()
  if elite_task_data.level ~= levels.glace then return end
  if AlvasMod.settings.en_elite_ultra then
    assault_tweak(60, 40, true)
  else
    assault_tweak(50,30, true)
  end
  AlvasMod:delay_swarm(10)
  AlvasMod:delay_swarm(30)
end

local function run_smoke_1()
  if elite_task_data.level ~= levels.run then return end
  local pos = Vector3(6442.73,8066.17,51.2774)
  AlvasMod:spawn_smoke(pos,30)
end

local function run_smoke_2()
  if elite_task_data.level ~= levels.run then return end
  local pos = Vector3(4718.41,1228.01,51.10)
  AlvasMod:spawn_smoke(pos,30)
end

local function run_stairway()
  if elite_task_data.level ~= levels.run then return end
  if AlvasMod.settings.en_elite_ultra then
    death_knell()
  else
    onslaught_stepped_swarm()
  end
  
  DelayedCalls:Add("run_heavy_shield_wall", 15, function()
     local pos = Vector3(-3915.28,-10701.7,2051.1)
     AlvasMod:spawn_marshal_heavy(pos)
     pos = Vector3(-3993.28,-10524.4,2039.1)
     AlvasMod:spawn_marshal_heavy(pos)
     pos = Vector3(-4130.12,-9917.58,2039.09)
     AlvasMod:spawn_marshal_heavy(pos)
     pos = Vector3(-4245.83,-9316.77,2039.72)
     AlvasMod:spawn_marshal_heavy(pos)
  end)

end

local function run_end_hill()
  if elite_task_data.level ~= levels.run then return end
  death_knell()
end

local function run_underpass()
   if elite_task_data.level ~= levels.run then return end
   threshold_40()
end

local function glace_escape()
  if elite_task_data.level ~= levels.glace then return end
  if AlvasMod.settings.en_elite_ultra then
    death_knell()
    local pos = Vector3(-1500, -39500, 5709.85)
    activate_spawn_points(pos, 2500)
  else
    onslaught_stepped_swarm()
  end
end

local function glace_roof()
   if elite_task_data.level ~= levels.glace then return end
   threshold_50()
end
 
local function glace_spooc_party()
  if elite_task_data.level ~= levels.glace then return end
   local pos = Vector3(-2140.85,-48518.7,5274.98)
   AlvasMod:spawn_spooc(pos)
   AlvasMod:spawn_smoke(pos,30) 
end
  
local function glace_shield_wall()
  if elite_task_data.level ~= levels.glace then return end
  local pos = Vector3(-3005.03,-47612,5226.82)
  AlvasMod:spawn_shield(pos)
  pos = Vector3(-3017.02,-47679.4,5226.82)
  AlvasMod:spawn_shield(pos)
  pos = Vector3(-3096.04,-47665.4,5226.82)
  AlvasMod:spawn_shield(pos)
  pos = Vector3(-2513.02,-47564,5341.75)
  AlvasMod:spawn_smoke(pos,30) 
end

local function nightclub_escape()
  if elite_task_data.level ~= levels.nightclub then return end
  if AlvasMod.settings.en_elite_ultra then
    death_knell()
  else
    onslaught_stepped_swarm()
  end
end

local function fwb_ramp_up()
  
    local pos = Vector3(5025, 375, -625)
    activate_spawn_points(pos, 2500)
    stepped_swarm()
    elite_task_data.special_task = true
    AlvasMod:delay_swarm(80)
end

local function hox_2_escape()
  if elite_task_data.level ~= levels.hox_2 then return end
  if AlvasMod.settings.en_elite_ultra then
    death_knell()
  else
    onslaught_stepped_swarm()
  end
  
end

local function elec_1_start_assault ()
   if elite_task_data.level ~= levels.election_day_1 then return end
   
   local pos = Vector3(1738.4,2605,1.11)
   activate_spawn_points(pos, 1500)
   force_spawn_timer_30()
end

local function elec_3_start_assault ()
  if elite_task_data.level ~= levels.election_day_3 then return end
  local pos = Vector3(-588,-1053,1.11)
  activate_spawn_points(pos, 2000)
  force_spawn_timer_30()
end

local function elec_1_escape ()
  if elite_task_data.level ~= levels.election_day_1 then return end
  
  if AlvasMod.settings.en_elite_ultra then
    death_knell()
  else
    onslaught_stepped_swarm()
  end
  
  local pos = Vector3(3317.88,-4664.93,1.10599)
  AlvasMod:spawn_marshal_heavy(pos)
  pos = Vector3(3433.82,-4428.46,1.10046)
  AlvasMod:spawn_marshal_heavy(pos)
  pos = Vector3(4139.14,-2792.81,1.15144)
  AlvasMod:spawn_marshal_heavy(pos)
  pos = Vector3(4355.79,-4987.42,1.10044)
  AlvasMod:spawn_marshal_heavy(pos)
  
end

local function fwb_enter_vault()
  if elite_task_data.level ~= levels.red2 then return end
  
  local pos1 = Vector3(7710.3,1693,-433.853)   --cash left side
  local pos2 = Vector3(7762.88,817.478,-433.853) --cash right side
  local pos3 = Vector3(7252.18,636.863,-433.853) --corner1
  local pos4 = Vector3(6518.15,608.937,-433.853) --side - midway
  local pos5 = Vector3(5994.04,622.484,-433.853) --corner2
  local pos6 = Vector3(5942.42,1254.24,-433.853) --by vault door
  local pos7 = Vector3(6431.83, 1262.29,-433.853) -- center of vault
  local pos8 = Vector3(7450.57, 1283.29, -433.853) -- doorway to cash
  local pos9 = Vector3(6921.83,1264.22,-433.853) -- shortly before doorway to cash
  
  local roll = math.random(1,3)
  
  if roll == 1 then   --classic bulldozer event
    AlvasMod:spawn_tank_mini (pos1)
    AlvasMod:spawn_spooc(pos2)
    AlvasMod:spawn_tank_mini (pos3)
    smoke(pos3,60)
    AlvasMod:spawn_tank_mini (pos4)
    smoke(pos4,60)
    AlvasMod:spawn_tank_mini (pos5)
    AlvasMod:spawn_tank_mini (pos9)
    AlvasMod:spawn_molotov(pos7)
    smoke(pos6, 360)
  elseif roll == 2 then  -- elite marshal marksman and cloakers
    smoke(pos8,120)
    AlvasMod:spawn_molotov(pos7)
    AlvasMod:spawn_marshal_sniper(pos1)
    AlvasMod:spawn_spooc(pos2)
    smoke(pos3,120)
    AlvasMod:spawn_marshal_sniper(pos3)
    AlvasMod:spawn_spooc(pos3)
    smoke(pos5,60)
    AlvasMod:spawn_marshal_sniper(pos5)
    AlvasMod:spawn_spooc(pos5)
    AlvasMod:spawn_marshal_sniper(pos9)
    AlvasMod:spawn_spooc(pos9)
    
  else  --marshal shields and cloakers
    smoke(pos8,120)
    AlvasMod:spawn_molotov(pos7)
    AlvasMod:spawn_marshal_heavy(pos8)
    AlvasMod:spawn_marshal_heavy(pos1)
    AlvasMod:spawn_marshal_heavy(pos2)
    smoke(pos4,120)
    AlvasMod:spawn_spooc(pos3)
    AlvasMod:spawn_spooc(pos8)
    AlvasMod:spawn_spooc(pos9)
    AlvasMod:spawn_tank_mini (pos5)
    smoke(pos6, 360)
  end

end

local function fwb_swarm_basement()
  AlvasMod:swarm()
end

local function fwb_escape_spawn()
  local pos = Vector3(3374.6, -595.415, -734.593)
  AlvasMod:spawn_spooc(pos)
  pos = Vector3(2223.6,-206.26,-734.593)
  AlvasMod:spawn_spooc(pos)
  pos = Vector3(3832.37,-346.334,-734.593)
  AlvasMod:spawn_spooc(pos)
  pos = Vector3(4778.62, -943.821, -734.593)
  AlvasMod:spawn_spooc(pos)
end

local function elec_2_escape()
   if elite_task_data.level ~= levels.election_day_2 then return end
  
  if AlvasMod.settings.en_elite_ultra then
    death_knell()
  else
    onslaught_stepped_swarm()
  end
end


local func_map = {
  [101341] = fwb_enter_vault,
  [103532] = fwb_swarm_basement,
  [101438] = fwb_escape_spawn,
  [107006] = fwb_ramp_up,
  [105143] = fwb_escape,
  [101985] = hox_1_garage,
  [103492] = hox_2_escape,
  [100598] = run_stairway,
  [100641] = run_smoke_1,  
  [103082] = run_smoke_2,
  [102860] = run_underpass,
  [103284] = run_end_hill,
  [102080] = glace_start_escort,
  [102077] = glace_roof,
  [101835] = glace_escape,
  [106167] = glace_spooc_party,
  [103549] = glace_shield_wall,
  [100435] = glace_shield_wall,
  [103800] = nightclub_escape,
  [101000] = elec_1_start_assault,
  [100082] = elec_3_start_assault,
  [101150] = elec_1_escape,
  [100234] = elec_2_escape
  
  
}




Hooks:PostHook(MissionScriptElement, "on_executed", "dwe_cmse_on_executed", function (self, instigator, alternative, skip_execute_on_executed, sync_id_from)
  
--  if debug_mode then
--    if managers and managers.chat then
--      if string.match(self._editor_name, "trigger") then
--        AlvasMod:msg(tostring(self._id) .. " " .. tostring(self._editor_name))
--      end
--    end
--  end
  
 if AlvasMod and Network:is_server() and AlvasMod.settings.specialMap then
    if func_map[self._id] then 
      func_map[self._id]() 
    end
  end
end)

Hooks:PostHook(MissionManager, "to_server_area_event", "dwe_to_server_area_event", function(self, event_id, id, unit)

  if AlvasMod and Network:is_server() and AlvasMod.settings.specialMap then
    if func_map[self._id] then 
      func_map[self._id]() 
    end
  end
end)

