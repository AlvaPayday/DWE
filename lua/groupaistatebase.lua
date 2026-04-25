local function register_snipers_as_special(groupai_state)
  if Network:is_server() and AlvasMod and AlvasMod.settings.en_fbi_sniper then
    groupai_state._special_unit_types.sniper = true
  end
end

if AlvasMod and AlvasMod.settings.en_megaspawn then
  GroupAIStateBase._MAX_SIMULTANEOUS_SPAWNS = 6
end

Hooks:PostHook(GroupAIStateBase, "_init_misc_data", "snipers_init_misc_data", register_snipers_as_special)
Hooks:PostHook(GroupAIStateBase, "on_simulation_started", "snipers_on_simulation_started", register_snipers_as_special)


Hooks:PostHook(GroupAIStateBase, "on_enemy_registered", "elite_count_register", function (self, unit)

  
  if not AlvasMod then return end    
  
  local name = unit:base()._tweak_table
  
  if name == "marshal_marksman" then
    elite_units.marksman =  elite_units.marksman + 1
    return
  end
  
  if name == "sniper" then
    elite_units.fbi_sniper =  elite_units.fbi_sniper + 1
    return
  end
  
  if name == "tank_medic" then
    elite_units.medic_dozer = elite_units.medic_dozer + 1
    return
  end
  
    
end)



Hooks:PostHook(GroupAIStateBase, "on_enemy_unregistered", "juststopspawncamping", function (self, unit)
	if Network:is_client() or not unit:character_damage():dead() then
		return
	end
  
  if not AlvasMod then return end
  
  local name = unit:base()._tweak_table
  
  if name == "marshal_marksman" then
    elite_units.marksman =  elite_units.marksman - 1
  end
  
  if name == "sniper" then
    elite_units.fbi_sniper =  elite_units.fbi_sniper - 1
  end
  
  if name == "tank_medic" then
    elite_units.medic_dozer = elite_units.medic_dozer - 1
  end

	local e_data = self._police[unit:key()]
	if not e_data.group or not e_data.group.has_spawned then
		return
	end

	local spawn_point = unit:unit_data().mission_element
	if not spawn_point then
		return
	end

	local max_dis = 500
	local dis = mvector3.distance(spawn_point:value("position"), e_data.m_pos)
	if dis > max_dis then
		return
	end

	for _, area in pairs(self._area_data) do
		if area.spawn_groups then
			for _, group in pairs(area.spawn_groups) do
				if group.spawn_pts then
					for _, point in pairs(group.spawn_pts) do
						if point.mission_element == spawn_point then
							local posi = Vector3(0,0,0)	
							local peer = ""
							local unit = ""
							local spawntarget_id = math.random(1,4)
							local flashbangchance = math.random(1,100)
							local smokegaschance = math.random(10,100)
							local smokegasplayerchance = math.random(10,100)
							local teargaschance = math.random(5,100)

							if smokegaschance >= 70 and gas_delay < TimerManager:game():time() then
								local posi = spawn_point:value("position")
								local rot = Rotation(math.random() * 360, 0, 0)
								managers.network:session():send_to_peers_synched("sync_smoke_grenade", posi, posi, 15, false)
								managers.groupai:state():sync_smoke_grenade(posi, posi, 15, false)
							elseif smokegaschance <= 69 then
								if teargaschance >=50 then
                  if AlvasMod.settings.en_teargas and gas_delay < TimerManager:game():time() then
									local teargaslol = "units/pd2_dlc_drm/weapons/smoke_grenade_tear_gas/smoke_grenade_tear_gas"
									local posi = spawn_point:value("position")
									local rot = Rotation(math.random() * 360, 0, 0)
									local grenade = World:spawn_unit(Idstring(teargaslol), posi, rot)
									grenade:base():set_properties({
									radius = 350,
									damage = 4,  --anything higher and player gets instadowned when revived. some still do
									duration = 10
									})
									grenade:base():detonate()
                  gas_delay = TimerManager:game():time() + 5
                end
                
								end
							end
							if flashbangchance >= 90 then
								local pos2 = spawn_point:value("position")
								managers.network:session():send_to_peers_synched("sync_smoke_grenade", pos2, pos2, 1, true)
								managers.groupai:state():sync_smoke_grenade(pos2, pos2, 1, true)
							end
							
						end
					end
				end
			end
		end
	end
end)

function GroupAIStateBase:activate_spawn_points()
  local test_pos = AlvasMod:get_random_peer_pos()
  local spawn_pos = nil
  local spawn_distance = nil
  if not test_pos then return end
  if not self._area_data then return end
  
  for nav_seg, area_data in pairs(self._area_data) do
    local area_spawn_points = area_data.spawn_points
    if area_spawn_points then
      for i=1, #area_spawn_points do
        local sp_data = area_spawn_points[i]
        spawn_distance = mvector3.distance(sp_data.pos, test_pos)
        if spawn_distance < 2000 then
          sp_data.mission_element:set_enabled(true)
          sp_data.delay_t = 0
          sp_data.interval = 0.2
        end
      end
    end
    
  end
end
