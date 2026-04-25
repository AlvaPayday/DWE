_G.AlvasMod = _G.AlvasMod or {}
AlvasMod._path = ModPath
AlvasMod._data_path = ModPath .. 'settings.txt'
AlvasMod.settings = {
  en_alvasmod = true,
  en_elite_ultra = false,
  en_marshal_shields = true,
  en_cloakers = true,
  en_ecm_jammer = true,
  en_marshal_smoke = true,
  en_fbi_sniper = true,
  en_teargas = true,
  en_welcome = true,
  en_megaspawn = true,
  lobby_name = false,
  dozer_spawn = 3,
  dozer_difficulty = 3,
  assault_pool = 225,
  spawn_types = 1,
  spawn_delay = 3,
  adm_sniper_count = 2,
  assault_team_size = 24,
  fbi_sniper_limit = 1,
  max_pool_size = 0,
  current_pool_size = 0,
  spawn_group_delay = 0,
  threshold = 0, 
  spawnCall = false,
  specialMap = false,
  force_spawn = false,
  force_delay = 0,
  force_interval = 0
}




local debug_mode = false
local gas_delay = 0
local smoke_delay = 0
local test_unit = nil

_G.elite_task_data = {
  phase = nil,
  phase_start = nil,
  phase_end = nil,
  units_remaining = nil,
  objective_area = nil,
  level = nil,
  assault_max_pool = 0,
  assault_threshold = 0,
  assault_current_pool = 0,
  spawnCall = false,
  throw_delay = 0,
  assault_force_spawn = false,
  assault_task = nil,
  special_task = false,
  swarm_timer = 0,
  death_knell_mode = false
}

_G.elite_limits = {
      medic_dozer = 1,
      fbi_sniper = 0, 
      marksman = 0    
}
    
_G.elite_units = {
      medic_dozer = 0,
      fbi_sniper = 0,
      marksman = 0
}


function AlvasMod:init()
  if not AlvasMod.settings.en_alvasmod then
    AlvasMod = nil
    return
  else
    AlvasMod.settings.specialMap = false
    AlvasMod.settings.spawnCall = false
    AlvasMod.settings.force_spawn = false  
    AlvasMod.assault_force_spawn = false
    elite_task_data.spawnCall = true
    elite_task_data.assault_threshold = 0
    elite_task_data.assault_max_pool = 0
    elite_task_data.assault_current_pool = 0
    debug_mode = false
    elite_limits.medic_dozer = 1
    elite_units.medic_dozer = 0
    elite_units.marksman = 0
    elite_units.fbi_sniper = 0

  end
  
end

function AlvasMod:special_task()
  
  if elite_task_data.level == "peta" then
    --periodically highlight the goats on Goat Simulator
    local player = managers.player:player_unit()
    if not player or not alive(player) then
        return
    end

    for _, data in pairs(managers.mission._scripts) do
        for id, element in pairs(data:elements()) do
            if id == 100672 or id == 100673 then
              if Network:is_server() then
                element:on_executed(player)
              end
            end
            
        end
    end
  end
  
  if elite_task_data.level == "red2" then
    if elite_task_data.swarm_timer < TimerManager:game():time() then
    AlvasMod:swarm()
    elite_task_data.swarm_timer = TimerManager:game():time() + 30
    end
  end
  
  if elite_task_data.level == "election_day_1" then
    if elite_task_data.swarm_timer < TimerManager:game():time() then
    AlvasMod:swarm()
    elite_task_data.swarm_timer = TimerManager:game():time() + 30
    end
  end
  
  if elite_task_data.level == "election_day_3_skip2" then
    if elite_task_data.swarm_timer < TimerManager:game():time() then
    AlvasMod:swarm()
    elite_task_data.swarm_timer = TimerManager:game():time() + 30
    end
    
  end
    
end

function assault_tweak(max_spawn, threshold, force_spawn)
  elite_task_data.assault_max_pool = max_spawn
  elite_task_data.assault_threshold = threshold
  elite_task_data.assault_force_spawn = force_spawn
end


function AlvasMod:analyze(unit)
  local unit_type = unit:base()._tweak_table
  local setting = tweak_data.character[unit:base()._tweak_table]
  local text = "unit_type: " .. tostring(unit_type) .. "\n" ..
         "priority_shout: " .. tostring(setting.priority_shout) .. "\n" ..
         "silent_priority_shout: " .. tostring(setting.silent_priority_shout) .. "\n" ..
         "move_speed: " .. tostring(setting.move_speed) .. "\n" ..
         "can_be_tased: " .. tostring(setting.can_be_tazed) .. "\n" ..
         "flammable: " .. tostring(setting.flammable) .. "\n" ..
         "ecm_vulnerability: " .. tostring(setting.ecm_vulnerability) .. "\n" 
         
         if unit_type == "spooc" then
           text = text .. 
          "spooc_attack_timeout: " .. tostring(settings.spooc_attack_timeout) .. "\n" ..
          "spooc_attack_beating_time: " .. tostring(settings.spooc_attack_beating_time) .. "\n" ..
          "spooc_sound_events: " .. tostring(settings.spooc_sound_events) .. "\n"
         end
         
  AlvasMod:msg(text)
  
end


function processTrigger(event)
  
  if not event then
    return
  end
  
  local level = managers.job:current_level_id()
  
  --reserved
  
end

function AlvasMod:unit_state(unit)
  if unit and unit:movement() then
    return unit:movement():current_state_name()
  end
  
  return nil
end

function AlvasMod:delay_swarm(seconds)
  DelayedCalls:Add("_delay_swarm", seconds, function()
    if Utils:IsInHeist() then
      AlvasMod:swarm()
    end
  end)

end


function AlvasMod:charge(owning_unit, target_unit)
  --reserved for single units
end

function AlvasMod:swarm(pos)
  
--  local target_pos     = nil
  
--  for id, peer in pairs(managers.network:session():all_peers()) do
--        if peer and peer:unit() and peer:unit():position() and alive(peer:unit()) and 
--        peer:unit():movement():current_state_name() == "standard" then
--          target_pos = peer:unit():position()
--          break
--        end      
--  end
  
--  if not target_pos then return end
  
--  local attention_data = {
--		pos = target_pos
--	}

--  for u_key,u_data in pairs(managers.enemy:all_enemies()) do
--      u_data.unit:brain():set_attention(attention_data)
--      u_data.unit:movement():set_attention(attention_data)
--  end
end

function AlvasMod:motivate()
  local u_type = ""
  
  local new_objective = {
    is_default = true,
    stance = "hos",
    attitude = "engage",
    type = "free"
  }
        
  for u_key,u_data in pairs(managers.enemy:all_enemies()) do
    if u_data.unit:brain() and u_data.unit:brain()._logic_data and u_data.unit:brain()._logic_data.objective then
      u_type = u_data.unit:brain()._logic_data.objective.type
      if u_type == "idle" or u_type == "defend_area" then
        u_data.unit:brain():set_objective(new_objective)
      end
    end

  end
  
end

function AlvasMod:swarm()
  --choose a random player as a swarm target

  local target_unit    = nil
  
  for id, peer in pairs(managers.network:session():all_peers()) do
        if peer and peer:unit() and peer:unit():position() and 
        peer:unit():movement():current_state_name() == "standard" then
          target_unit = peer:unit()
          break
        end      
  end

  if not target_unit then return end
  
  local pos = target_unit:position()
  local nav_seg_id = managers.navigation:get_nav_seg_from_pos(pos, true)
  local target_area = managers.groupai:state():get_area_from_nav_seg_id(nav_seg_id)
  
  coarse_path = {
    {
      nav_seg_id,
      target_area.pos
    }
  }

  local new_objective = {
    scan = true,
    destroy_clbk_key = false,
    type = "follow",
    attitude = "engage",
    haste = "run",
    interrupt_dis = 20,
    interrupt_health = 1,
    follow_unit = target_unit,
    nav_seg = target_unit:movement():nav_tracker():nav_segment(),
    fail_clbk = nil 
  }
      

  --local destroy_clbk_key = "objective_" .. new_objective.type .. tostring(target_unit:key())
  local ext_brain = nil
  local my_data = nil
  
  for u_key,u_data in pairs(managers.enemy:all_enemies()) do
    if u_data.unit:base()._tweak_table ~= "spooc" or u_data.unit:base()._tweak_table ~= "marshal_shield" then
      u_data.unit:brain():set_objective(new_objective)
    end
    
  end
	
end

function AlvasMod:activate_spawn_points(pos, distance)
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
              sp_data.mission_element:set_enabled(true)
              managers.groupai:state():on_nav_segment_state_change(sp_data.nav_seg, state)
            end
          else
            --sp_data.mission_element:set_enabled(false)
          end
        end
      end
    end
end

function AlvasMod:spawn_smoke(pos,duration)  
  managers.network:session():send_to_peers_synched("sync_smoke_grenade", pos, pos, duration, false)
  managers.groupai:state():sync_smoke_grenade(pos, pos, duration, false)
end


function AlvasMod:forward_pos(unit, distance)
  --untested
  local rotY = unit:rotation():y() * distance
  return Vector3(unit:position().x, rotY, unit:position().z)
end

function AlvasMod:inverse_rot(unit)
  return unit:rotation():inverse()
end

function AlvasMod:look_rot (owning_unit, target_unit)
  return Rotation:look_at(owning_unit:position(),target_unit:position(), Vector3(0,0,1))
end

function AlvasMod:warp_to(unit, pos, rot)
  --untested, may need velocity as third parameter
  unit:warp_to(rot,pos)
end

local function dump(node, filename)

    local cache, stack, output = {},{},{}
    local depth = 1
    local output_str = "{\n"

    while true do
        local size = 0
        for k,v in pairs(node) do
            size = size + 1
        end

        local cur_index = 1
        for k,v in pairs(node) do
            if (cache[node] == nil) or (cur_index >= cache[node]) then

                if (string.find(output_str,"}",output_str:len())) then
                    output_str = output_str .. ",\n"
                elseif not (string.find(output_str,"\n",output_str:len())) then
                    output_str = output_str .. "\n"
                end

                table.insert(output,output_str)
                output_str = ""

                local key
                if (type(k) == "number" or type(k) == "boolean") then
                    key = "["..tostring(k).."]"
                else
                    key = "['"..tostring(k).."']"
                end

                if (type(v) == "number" or type(v) == "boolean") then
                    output_str = output_str .. string.rep('\t',depth) .. key .. " = "..tostring(v)
                elseif (type(v) == "table") then
                    output_str = output_str .. string.rep('\t',depth) .. key .. " = {\n"
                    table.insert(stack,node)
                    table.insert(stack,v)
                    cache[node] = cur_index+1
                    break
                else
                    output_str = output_str .. string.rep('\t',depth) .. key .. " = '"..tostring(v).."'"
                end

                if (cur_index == size) then
                    output_str = output_str .. "\n" .. string.rep('\t',depth-1) .. "}"
                else
                    output_str = output_str .. ","
                end
            else
                -- close the table
                if (cur_index == size) then
                    output_str = output_str .. "\n" .. string.rep('\t',depth-1) .. "}"
                end
            end

            cur_index = cur_index + 1
        end

        if (size == 0) then
            output_str = output_str .. "\n" .. string.rep('\t',depth-1) .. "}"
        end

        if (#stack > 0) then
            node = stack[#stack]
            stack[#stack] = nil
            depth = cache[node] == nil and depth + 1 or depth - 1
        else
            break
        end
    end

    table.insert(output,output_str)
    output_str = table.concat(output)

    AlvasMod:log_custom(output_str, filename)
    AlvasMod:msg("dump completed")
end


function AlvasMod:table_dump(node, filename)

  local success, result = pcall(dump,node, filename)
  
  if success then
    AlvasMod:msg("table dumped successfully")
  else
    if result ~= nil then
    local reason = tostring(result)
    AlvasMod:msg("table dump failed: " .. reason)
    else
    AlvasMod:msg("table dump failed: no reason given")
    end
  end
end


function AlvasMod:log(outstring)
  if outstring ~= nil then
  local file = io.open(AlvasMod._path .. "log.txt", "a")
  file:write(outstring,"\n")
  file:flush()
  file:close()
  end
end

function AlvasMod:log_custom(outstring, filename)
  
  if outstring ~= nil and filename ~= nil then
  local file = io.open(AlvasMod._path .. filename .. ".txt", "a")
  file:write(outstring,"\n")
  file:flush()
  file:close()
  end
end

  


function AlvasMod:load()
	local file = io.open(self._data_path, 'r')
	if file then
		for k, v in pairs(json.decode(file:read('*all')) or {}) do
			self.settings[k] = v
		end
		file:close()
	end
end

function AlvasMod:save()
	local file = io.open(self._data_path, 'w+')
	if file then
		file:write(json.encode(self.settings))
		file:close()
	end
end


function AlvasMod:display(str)
  
  if managers.hud then
   managers.hud:show_hint( { text = str } )
  end
end

function AlvasMod:spawn_gas(pos,time)
  
  local teargas = "units/pd2_dlc_drm/weapons/smoke_grenade_tear_gas/smoke_grenade_tear_gas"
  local rot = Rotation(math.random() * 360, 0, 0)
  local grenade = World:spawn_unit(Idstring(teargas), pos, rot)
									grenade:base():set_properties({
									radius = 350,
									damage = 4,  --anything higher and player gets instadowned when revived. some still do
									duration = time
									})
									grenade:base():detonate()
  
end

function AlvasMod:cloaker_cloud(pos)
  
  local rot = Rotation(math.UP, math.random() * 360)
  
  World:effect_manager():spawn({
		effect = Idstring("effects/payday2/particles/explosions/smoke_explosion/dark_smoke_big"),
		position = pos,
    rotation = rot
	})

end

function AlvasMod:kickPlayer(peer_id)
  if Network:is_server() then
		managers.network:session():send_to_peers("kick_peer", peer_id, 2)
		managers.network:session():on_peer_kicked(sender_peer, peer_id, 2)
  end
end

function nearestUnit(pos,tweak_name)
  
  local testDistance = 300
  local distance = 0
  local unit = nil
  
  for _, data in pairs(managers.enemy:all_enemies()) do
    	local unit_type = data.unit:base()._tweak_table
      if unit_type and unit_type == tweak_name then
        distance = mvector3.distance(data.unit:movement():m_pos(),pos)
        if distance <= testDistance then
          return data.unit
        end
      else
        if unit_type == nil then
          --AlvasMod:msg("unit_type = nil")
        end
        
      end
      
    
  end
  return nil
  
end

function nearestPeerPosition(pos)
  
  --pass a position and find the nearest peer position
    local currentPeer = nil
    local distance = 500
    
      for id, peer in pairs(managers.network:session():all_peers()) do
        if peer and peer:unit() and peer:unit():position() then
          local testdistance = mvector3.distance(pos,peer:unit():position())
          if testdistance < distance then
            currentPeer = peer
            distance = testdistance
          end
        end      
      end
   
    
    if currentPeer ~= nil then
      return currentPeer:unit():position()
    end 
  
    return nil

end

function AlvasMod:get_random_peer_pos()
  for id, peer in pairs(managers.network:session():all_peers()) do
    if peer and peer:unit() and peer:unit():position() then
      return peer:unit():position()
    end
  end
  return nil
end

function AlvasMod:nearestPeer_wide(pos)
   local currentPeer = nil
    local distance = 30000
    
      for id, peer in pairs(managers.network:session():all_peers()) do
        if peer and peer:unit() and peer:unit():position() then
          local testdistance = mvector3.distance(pos,peer:unit():position())
          if testdistance < distance then
            currentPeer = peer
            distance = testdistance
          end
        end      
      end
   
    
    if currentPeer ~= nil then
      return currentPeer
    end 
  
    return nil
  
end

function AlvasMod:nearestPeer(pos)
  --pass a position and find the nearest peer
    local currentPeer = nil
    local distance = 500
    
      for id, peer in pairs(managers.network:session():all_peers()) do
        if peer and peer:unit() and peer:unit():position() then
          local testdistance = mvector3.distance(pos,peer:unit():position())
          if testdistance < distance then
            currentPeer = peer
            distance = testdistance
          end
        end      
      end
   
    
    if currentPeer ~= nil then
      return currentPeer
    end 
  
    return nil
end

function AlvasMod:any_peer_unit()
  
  for id, peer in pairs(managers.network:session():all_peers()) do
    if peer and peer:unit() and peer:unit():position() then
      return peer:unit()
    end
  end
  
  return nil
end

function AlvasMod:getPeer(peer_id)
  		return managers.network:session():peer(peer_id)
end

function AlvasMod:peerFromUnit(unit)
    if not unit or not unit:key() then return nil end
    
    local peer = managers.network:session():peer_by_unit_key(unit:key())
    return peer or nil
end
   
function AlvasMod:hasLOS(owning_unit,target_unit)
  local from_pos = owning_unit:movement().m_head_pos()
  local to_pos = target_unit:position()
  local slotmask = managers.slot:get_mask("bullet_impact_targets")
  local vis_ray = owning_unit:raycast("ray", from_pos, to_pos, "slot_mask", slotmask, "sphere_cast_radius", 50, "ignore_unit", owning_unit, "report")
  
  if vis_ray then
    return true
  else
    return false
  end
  
  
end

function AlvasMod:broadcast(text)
  if Utils:IsInGameState() and managers.chat then 
  managers.network:session():send_to_peers("send_chat_message", ChatManager.GAME, "[ALVASMOD] " .. text, Color.yellow)
  managers.chat:_receive_message(ChatManager.GAME, "[DW ELITE] ", text, Color.yellow)
  end
end

function AlvasMod:msg(text)
  if managers and managers.chat then
    managers.chat:feed_system_message(ChatManager.GAME,  text)
  end
end

function sync_husk (unit, state)
		unit:movement():sync_movement_state(state, 0)
end

function sync_player(peer, state)
  
  local network, send 
  network = peer:unit():network()
  send = network.send
  
  if state == "arrested" then
    send(network, "sync_player_movement_state", "arrested", 0, peer:id())
  elseif state == "incapacitated" then
    send(network, "sync_player_movement_state", "incapacitated", 0, peer:id())
  elseif state == "dead" then
    send(network, "sync_player_movement_state", "dead", 0, peer:id())
    send(network, "set_health", 0)
    network:send_to_unit( { "spawn_dropin_penalty", true, nil, 0, nil, nil } )
  elseif state == "tased" then
    send(network, "sync_player_movement_state", "tased", 0, peer:id())
  elseif state == "standard" then
    send(network, "sync_player_movement_state", "standard", 0, peer:id())
  end
  
end


function AlvasMod:unitFromId(id)
  
  local unit = managers.worlddefinition:get_unit(id)
  
  if unit then
    return unit
  end
  
  return nil
  
end

function AlvasMod:spawn_shield(pos)

local rot = Rotation()
local team_id = tweak_data.levels:get_default_team_ID("combatant")
local groupstate = managers.groupai:state()
local unit = safe_spawn_unit(Idstring("units/payday2/characters/ene_city_shield/ene_city_shield"), pos, rot)
unit:movement():set_team(groupstate:team_data( team_id ))
groupstate:assign_enemy_to_group_ai(unit, team_id)

local nav_seg = unit:movement():nav_tracker():nav_segment()


local new_objective = {
			type = "defend_area",
			interrupt_health = 1,
			is_default = true,
			stance = "hos",
			in_place = true,
			scan = true,
			interrupt_dis = 40,
			attitude = "avoid",
			nav_seg = nav_seg
		}

local mov_ext = unit:movement()
unit:movement():set_character_anim_variables()
unit:brain():set_objective(new_objective)
unit:brain():set_update_enabled_state(true)


  if unit then 
    return unit
  else
    return nil
  end
  
  
end

function AlvasMod:spawn_molotov(pos)
  ProjectileBase.throw_projectile("molotov", pos, pos, -1)
end

function AlvasMod:spawn_marshal_sniper(pos)
  local rot = Rotation()
  local team_id = tweak_data.levels:get_default_team_ID("combatant")
  local groupstate = managers.groupai:state()
  local unit = safe_spawn_unit(Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2"), pos, rot)
  unit:movement():set_team(groupstate:team_data( team_id ))
  groupstate:assign_enemy_to_group_ai(unit, team_id)
  
    unit_objective = 
        {
              type = "none",
              attitude = "engage",
              scan = true,
              is_default = true
        }
        
  unit:brain():set_objective(unit_objective)
end

function AlvasMod:spawn_tank_mini (pos)
  local rot = Rotation()
  local team_id = tweak_data.levels:get_default_team_ID("combatant")
  local groupstate = managers.groupai:state()
  local unit = safe_spawn_unit(Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun/ene_bulldozer_minigun"), pos, rot)
  unit:movement():set_team(groupstate:team_data( team_id ))
  groupstate:assign_enemy_to_group_ai(unit, team_id)
  
    unit_objective = 
        {
              type = "none",
              attitude = "engage",
              scan = true,
              is_default = true
        }
        
  unit:brain():set_objective(unit_objective)
end


function AlvasMod:spawn_marshal_heavy(pos)
  
local rot = Rotation()
local team_id = tweak_data.levels:get_default_team_ID("combatant")
local groupstate = managers.groupai:state()
local unit = safe_spawn_unit(Idstring("units/pd2_dlc_usm2/characters/ene_male_marshal_shield_2/ene_male_marshal_shield_2"), pos, rot)
unit:movement():set_team(groupstate:team_data( team_id ))
groupstate:assign_enemy_to_group_ai(unit, team_id)

local nav_seg = unit:movement():nav_tracker():nav_segment()

local new_objective = {
			type = "defend_area",
			interrupt_health = 1,
			is_default = true,
			stance = "hos",
			in_place = true,
			interrupt_dis = 40,
			attitude = "avoid",
			nav_seg = nav_seg
		}

local mov_ext = unit:movement()
unit:movement():set_character_anim_variables()

unit:brain():set_objective(new_objective)
unit:brain():set_update_enabled_state(true)
unit:inventory():add_unit_by_name(Idstring("units/payday2/weapons/wpn_npc_r870/wpn_npc_r870"), true, true)
unit:inventory():equip_selection(2, true)

local weapon = unit:inventory():equipped_unit()
local weapon_base = weapon and weapon:base()
local ammo_base = weapon_base and weapon_base:ammo_base()

if ammo_base then
		ammo_base:set_ammo_remaining_in_clip(99)
end
  
if unit then return unit end
  
return nil
          
end

function AlvasMod:spawn_spooc(pos)
  --spawn a cloaker in idle crouch 
  
local rot = Rotation()
local team_id = tweak_data.levels:get_default_team_ID("combatant")
local groupstate = managers.groupai:state()
local unit = safe_spawn_unit(Idstring("units/payday2/characters/ene_spook_1/ene_spook_1"), pos, rot)
unit:movement():set_team(groupstate:team_data( team_id ))
groupstate:assign_enemy_to_group_ai(unit, team_id)

local action_desc = {
			body_part = 4,
      sync = true,
			type = "crouch"
		}
    
local spawn_ai = {
			init_state = "idle",
			scan = true
		}

local mov_ext = unit:movement()
unit:movement():set_character_anim_variables()
mov_ext:action_request(action_desc)
local spooc = tweak_data.character[unit:base()._tweak_table]
            spooc.priority_shout = nil
            spooc.spawn_sound_event = ""
            spooc.spooc_sound_events = {}
            spooc.spooc_attack_beating_time = {
            0,
            0
            }
            spooc.spooc_attack_timeout = {
            0.0,
            0.5
          }
          unit:brain():set_spawn_ai( spawn_ai )
          unit:brain():set_update_enabled_state(true)


  if unit then 
    return unit
  else
    return nil
  end
  
end

function AlvasMod:is_spawn_camped(spawn_point)
  
  local spawn_pos = spawn_point.pos
  local peer = AlvasMod:nearestPeer(spawn_pos)
  
  if not peer then return false end
  
  local distance = mvector3.distance(spawn_pos, peer:unit():position())
  
  if peer then
    if tweak_data.group_ai.ai_spawn_camp_distance < distance then
      return true
    end
  end
  
  return false
end

function AlvasMod:waypoint(pos, text)
  
  local wp_id = "wp_id_" .. tostring(math.random(1,3848323))
  managers.hud:add_waypoint(wp_id, {
			icon = "wp_standard",
			text = text,
			present_timer = 60,
			position = pos
		})
  
end

function AlvasMod:new_trigger_area(pos, best_spawn_points, force_populate, force_threshold)
  --set new area
  local nav_seg_id = managers.navigation:get_nav_seg_from_pos(pos, true)
  local area = managers.groupai:state():get_area_from_nav_seg_id(nav_seg_id)
  --TODO
  --add new preferred spawn points using best_spawn_points
  --managers.groupai:state():add_preferred_spawn_points(self._id, self._group_data.spawn_points)
  
  --dont spam the new area if we are in fade
--  if force_populate then
--    assault_threshold = force_threshold
--    assault_force_spawn = true
--  end
  
end

function AlvasMod:trigger_spawn()
  local area = elite_task_data.objective.area
  local area_spawn_points = area.spawn_points
  
  elite_task_data.assault_force_spawn = true
  for _, new_spawn_point in ipairs(area_spawn_points) do
    new_spawn_point.mission_element:set_enabled(true)
    new_spawn_point.delay_t = -1
  end
end

  
function AlvasMod:inspect_area()
  local player_unit = managers.network:session():local_peer():unit()
  local pos = player_unit:position()
  local nav_seg_id = managers.navigation:get_nav_seg_from_pos(pos, true)
  local area = managers.groupai:state():get_area_from_nav_seg_id(nav_seg_id)
  local area_spawn_points = GroupAIStateBesiege:_find_spawn_points_near_area(area, 4, area.pos, 8000, nil)
  local text = ""
  
  if not area_spawn_points then
    --area_spawn_points = GroupAIStateBesiege._find_spawn_points_near_area(area, 4, area.pos, 6000, nil)
    --TODO
  else
    AlvasMod:msg("spawn points found: " .. tostring(#area_spawn_points))
  end
  
  
  for _, new_spawn_point in ipairs(area_spawn_points) do
    local pos = new_spawn_point:value("position")
    local id = new_spawn_point.mission_element:id()
    local is_enabled = new_spawn_point.mission_element:enabled()
    AlvasMod:msg("pos: " .. tostring(pos) .. " id: " .. tostring(id) .. " enabled: " .. tostring(is_enabled))
  end
  
    
end

function AlvasMod:add_best_spawn_points(area, best_spawn_points)
  local area_spawn_points = area.spawn_points
  --TODO  

end



function AlvasMod:check_last_standing()
  
  if not Utils:IsInHeist() then return end
  if not managers.network:session() then return end
  
  
  local all_peers = managers.network:session():all_peers()
  local total_peers = #all_peers
  local active_count = 0
  
  for id, peer in pairs(managers.network:session():all_peers()) do
    	if not managers.trade:is_peer_in_custody(peer:id()) then
        active_count = active_count + 1
      end
  end

  if total_peers > 1 and active_count == 1 then
    return true
  end
  
  return false
end

function AlvasMod:death_knell()
  
  AlvasMod:broadcast("*** Death Knell Mode: Active ***")
  if AlvasMod.settings.en_elite_ultra then
    assault_tweak(100, 95, true)
  else
    assault_tweak(100,85, true)
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
					amount_min = 5,
					freq = 1,
					amount_max = 6,
          respawn_cooldown = 15,
					rank = 1,
					unit = "FBI_tank",
					tactics = {"charge"}
				}
			}
		}

  GroupAIStateBase:activate_spawn_points()
  elite_task_data.death_knell_mode = true
  --managers.groupai:state():set_wave_mode("sustain")
end




function AlvasMod:throwMolotov(owning_unit,target_pos)
  
  local throw_dis = mvector3.distance(owning_unit:position(),target_pos)
  
  local mov_ext = owning_unit:movement()
  local head_pos = mov_ext:m_head_pos()
  
  local throw_from = head_pos + mov_ext:m_head_rot():y() * 50
  local throw_dir = Vector3()

	mvector3.lerp(throw_dir, throw_from, target_pos, 0.3)
	mvector3.subtract(throw_dir, throw_from)
  local dis_lerp = math.clamp((throw_dis - 1000) / 1000, 0, 1)
	local compensation = math.lerp(0, 300, dis_lerp)
  mvector3.set_z(throw_dir, throw_dir.z + compensation)
	mvector3.normalize(throw_dir)
  
  if mov_ext:play_redirect("throw_grenade") then
		managers.network:session():send_to_peers_synched("play_distance_interact_redirect", owning_unit, "throw_grenade")
    ProjectileBase.throw_projectile("molotov", throw_from, throw_dir, -1)
	end

end
