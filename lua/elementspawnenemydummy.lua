core:import("CoreMissionScriptElement")
ElementSpawnEnemyDummy = ElementSpawnEnemyDummy or class(CoreMissionScriptElement.MissionScriptElement)

local spawn_unit = function (groupstate, unit_name, pos, rot)
      local unit_new = safe_spawn_unit(unit_name, pos, rot)
    	local team_id = tweak_data.levels:get_default_team_ID("combatant")
      unit_new:movement():set_team(groupstate:team_data( team_id ))
      groupstate:assign_enemy_to_group_ai(unit_new, team_id)
      return unit_new
end

Hooks:PostHook(ElementSpawnEnemyDummy, "produce", "rmupdate_produce", function(self)
	if not Network:is_server() or not AlvasMod then return end

  
  local unit = self._units[#self._units]
  
	if not unit or not alive(unit) or not managers.groupai then
		return
	end
  
  local unit_name = unit:base()._tweak_table
  
  if unit_name == "cop" then 
    if managers.job:current_level_id() == "glace" then
      local new_unit = spawn_unit(managers.groupai:state(), unit:name(), unit:position() , Rotation())
      table.insert(self._units, new_unit)
    end
  end
  
  if unit_name == "security" then
    --reserved
  end

  
  if unit_name == "marshal_marksman" then
    if elite_units.marksman > elite_limits.marksman then
        elite_units.marksman = elite_units.marksman - 1
        unit:set_slot(0)
        return
    end 
    
    local marshal_marksman = tweak_data.character[unit:base()._tweak_table]
    marshal_marksman.weapon.is_rifle.focus_delay = 0
    marshal_marksman.weapon.is_rifle.aim_delay = {0.1, 0.3}
    marshal_marksman.no_move_and_shoot = false
    marshal_marksman.move_and_shoot_cooldown = 0.2
    marshal_marksman.can_be_tased = false
    marshal_marksman.flammable = false
  end
  
  if unit_name == "tank_medic" then

    if elite_units.medic_dozer > 1 then
        elite_units.medic_dozer = elite_units.medic_dozer - 1
        unit:set_slot(0)
        return
    end
  end
  
  if unit_name == "sniper" then
    if elite_units.fbi_sniper >  elite_limits.fbi_sniper then
        elite_units.fbi_sniper = elite_units.fbi_sniper - 1
        unit:set_slot(0)
        return
    end
  end
  
  if unit_name == "spooc" then  -- silent cloaker, no mark, no delay
    local spooc = tweak_data.character[unit:base()._tweak_table]
    spooc.move_speed = {
			stand = {
				walk = {
					ntl = {
						strafe = 220,
						fwd = 250,
						bwd = 110
					},
					hos = {
						strafe = 225,
						fwd = 285,
						bwd = 215
					},
					cbt = {
						strafe = 325,
						fwd = 385,
						bwd = 215
					}
				},
				run = {
					hos = {
						strafe = 600,
						fwd = 800,
						bwd = 550
					},
					cbt = {
						strafe = 580,
						fwd = 750,
						bwd = 520
					}
				}
			},
			crouch = {
				walk = {
					hos = {
						strafe = 210,
						fwd = 245,
						bwd = 190
					},
					cbt = {
						strafe = 190,
						fwd = 255,
						bwd = 190
					}
				},
				run = {
					hos = {
						strafe = 300,
						fwd = 420,
						bwd = 250
					},
					cbt = {
						strafe = 300,
						fwd = 412,
						bwd = 280
					}
				}
			}
		}
    spooc.priority_shout = "f37"
    spooc.can_be_tased = false
    spooc.no_run_start = false
    spooc.HEALTH_INIT = 100
    spooc.headshot_dmg_mul = 2
    spooc.no_retreat = true
    spooc.no_arrest = true
    spooc.suppression = nil
    spooc.silent_priority_shout = "f37"
    spooc.priority_shout_max_dis = 100
    spooc.spooc_attack_timeout = {
      0,
      0.5
    }
    spooc.spooc_attack_beating_time = {
      0,
      0
    }
    spooc.spooc_attack_use_smoke_chance = 0
    spooc.weapon_voice = "3"
    spooc.experience.cable_tie = "tie_swat"
    spooc.speech_prefix_p1 = "uno_clk"
    spooc.speech_prefix_count = nil
    spooc.use_radio = nil
    spooc.access = "spooc"
    spooc.do_not_drop_ammo = true
    spooc.use_animation_on_fire_damage = false
    spooc.flammable = false
    spooc.can_be_healed = true
    spooc.steal_loot = nil
    spooc.spawn_sound_event = ""
    spooc.die_sound_event = ""
    spooc.spooc_sound_events = {
      detect_stop = "",
      detect = ""
    }
    
  end
   if unit_name == "tank_mini" then
     local tank_mini = tweak_data.character[unit:base()._tweak_table]
     tank_mini.can_be_tased = false
     tank_mini.flammable = false
     tank_mini.move_speed = {
			stand = {
				walk = {
					ntl = {
						strafe = 120,
						fwd = 144,
						bwd = 113
					},
					hos = {
						strafe = 120,
						fwd = 144,
						bwd = 113
					},
					cbt = {
						strafe = 120,
						fwd = 144,
						bwd = 113
					}
				},
				run = {
					hos = {
						strafe = 150,
						fwd = 360,
						bwd = 135
					},
					cbt = {
						strafe = 150,
						fwd = 360,
						bwd = 155
					}
				}
			},
			crouch = {
				walk = {
					hos = {
						strafe = 120,
						fwd = 144,
						bwd = 113
					},
					cbt = {
						strafe = 120,
						fwd = 144,
						bwd = 113
					}
				},
				run = {
					hos = {
						strafe = 140,
						fwd = 360,
						bwd = 150
					},
					cbt = {
						strafe = 140,
						fwd = 360,
						bwd = 155
					}
				}
			}
		}
   end
   
   if unit_name == "marshal_shield" then  
    local marshal_shield = tweak_data.character[unit:base()._tweak_table]
    marshal_shield.HEALTH_INIT = 180
    marshal_shield.flammable = false
    marshal_shield.can_be_tased = false  
    
    local weapon = unit:inventory():equipped_unit()
    local weapon_base = weapon and weapon:base()
    local ammo_base = weapon_base and weapon_base:ammo_base()

    if ammo_base then
      ammo_base:set_ammo_remaining_in_clip(99)
    end
   end
  
   if unit_name == "marshal_shield_break" then
     local marshal_shield_break = tweak_data.character[unit:base()._tweak_table]
     marshal_shield_break.HEALTH_INIT = 240
     marshal_shield_break.flammable = false
     marshal_shield_break.can_be_tased = false
     marshal_shield_break.move_speed = {
			stand = {
				walk = {
					ntl = {
						strafe = 120,
						fwd = 150,
						bwd = 110
					},
					hos = {
						strafe = 225,
						fwd = 285,
						bwd = 215
					},
					cbt = {
						strafe = 225,
						fwd = 285,
						bwd = 215
					}
				},
				run = {
					hos = {
						strafe = 340,
						fwd = 670,
						bwd = 325
					},
					cbt = {
						strafe = 325,
						fwd = 475,
						bwd = 300
					}
				}
			},
			crouch = {
				walk = {
					hos = {
						strafe = 210,
						fwd = 245,
						bwd = 190
					},
					cbt = {
						strafe = 190,
						fwd = 255,
						bwd = 190
					}
				},
				run = {
					hos = {
						strafe = 282,
						fwd = 350,
						bwd = 268
					},
					cbt = {
						strafe = 282,
						fwd = 312,
						bwd = 268
					}
				}
			}
		}
    local weapon = unit:inventory():equipped_unit()
    local weapon_base = weapon and weapon:base()
    local ammo_base = weapon_base and weapon_base:ammo_base()

    if ammo_base then
      ammo_base:set_ammo_remaining_in_clip(99)
    end
   end
    
--	local groupstate = managers.groupai:state()
  
--	if not groupstate:is_AI_enabled() or not groupstate:enemy_weapons_hot() or groupstate:whisper_mode() then
--		return
--	end
--	if not unit:character_damage():can_kill() or unit:character_damage():dead() then
--		return
--	end
--	if groupstate:is_enemy_converted_to_criminal(unit) then
--		return
--	end
--	if not managers.enemy:is_enemy(unit) then
--		return
--	end
--	if managers.enemy:is_civilian(unit) then
--		return
--	end
  
--	local _unit_objective = unit:brain() and unit:brain():objective() or nil
--  local pos, rot = self:get_orientation()
--  local playerss = groupstate:all_player_criminals()
--  local cc = playerss[table.random_key(playerss)]


--  if managers.job:current_level_id() == "red2" and unit:name() == Idstring("units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1") then  --First World Bank

--      if groupstate and cc and pos and rot then
        
--        local new_unit = spawn_unit(groupstate, 
--        Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun/ene_bulldozer_minigun"), pos, rot)
      
--      _unit_objective = 
--        {
--              type = "none",
--              attitude = "engage",
--              scan = true,
--              is_default = true
--        }
--        new_unit:brain():set_objective(_unit_objective)
--        table.insert(self._units, new_unit)
        
--        local posi = unit:position()
--        managers.network:session():send_to_peers_synched("sync_smoke_grenade", posi, posi, 360, true)
--        managers.groupai:state():sync_smoke_grenade(posi, posi, 360, false)
        
--        DelayedCalls:Add("ddspawn2", 1, function()
--          if math.random(1,10) > 5 then
--            local new_unit = spawn_unit(groupstate, 
--            Idstring("units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"), pos, rot)
--            new_unit:brain():set_objective(_unit_objective)
--            table.insert(self._units, new_unit)
--          else
--            local new_unit = spawn_unit(groupstate, 
--            Idstring("units/payday2/characters/ene_spook_1/ene_spook_1"), pos, rot)
--            new_unit:brain():set_objective(_unit_objective)
--            table.insert(self._units, new_unit)
--          end
          
--        end)
--      end
      
    
--  end
  
end)



