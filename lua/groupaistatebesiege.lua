local spawntask = nil  --GroupAIStateBesiege:_perform_group_spawning
local tank_medic = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic")
  
local function cooldown (self)

  local spawn_delay = 0
  local spawn_setting = AlvasMod.settings.spawn_delay
  
  if spawn_setting     == 1 then
    spawn_delay = math.random(15,30)
  elseif spawn_setting == 2 then
    spawn_delay = math.random(10,25)
  elseif spawn_setting == 3 then
    spawn_delay = math.random(5,10)
  elseif spawn_setting == 4 then
    spawn_delay = math.random(2,5)
  elseif spawn_setting == 5 then
    spawn_delay = math.random(1,2)
  elseif spawn_setting == 6 then
    spawn_delay = math.random(0,1)
  end
  
  for i=1, #self._spawning_groups do
			for _, sp in ipairs(self._spawning_groups[i].spawn_group.spawn_pts) do
        sp.delay_t = self._t + spawn_delay
        sp.interval = self._t + 10
      end
  end
end

local function _try_spawn_unit(self, u_type_name, spawn_entry)

    local nr_units_spawned = 0
    local produce_data = {
		name = true,
		spawn_ai = {}
    }
  
    local group_ai_tweak = tweak_data.group_ai
    local spawn_points = spawntask.spawn_group.spawn_pts
		local hopeless = true
		local current_unit_type = tweak_data.levels:get_ai_group_type()
    local spawn_task = spawntask
    
		for _, sp_data in ipairs(spawn_points) do
			local category = group_ai_tweak.unit_categories[u_type_name]

			if (sp_data.accessibility == "any" or category.access[sp_data.accessibility]) and (not sp_data.amount or sp_data.amount > 0) and sp_data.mission_element:enabled() then
				hopeless = false

				if sp_data.delay_t < self._t then
					local units = category.unit_types[current_unit_type]
					produce_data.name = units[math.random(#units)]
					produce_data.name = managers.modifiers:modify_value("GroupAIStateBesiege:SpawningUnit", produce_data.name)
					local spawned_unit = sp_data.mission_element:produce(produce_data)
					local u_key = spawned_unit:key()
					local objective = nil
          
					if spawn_task.objective then
						objective = self.clone_objective(spawn_task.objective)
					else
						objective = spawn_task.group.objective.element:get_random_SO(spawned_unit)

						if not objective then
							spawned_unit:set_slot(0)

							return true
						end

						objective.grp_objective = spawn_task.group.objective
					end

					local u_data = self._police[u_key]

					self:set_enemy_assigned(objective.area, u_key)

					if spawn_entry.tactics then
						u_data.tactics = spawn_entry.tactics
						u_data.tactics_map = {}

						for _, tactic_name in ipairs(u_data.tactics) do
							u_data.tactics_map[tactic_name] = true
						end
					end

					spawned_unit:brain():set_spawn_entry(spawn_entry, u_data.tactics_map)

					u_data.rank = spawn_entry.rank

					self:_add_group_member(spawn_task.group, u_key)

					if spawned_unit:brain():is_available_for_assignment(objective) then
						if objective.element then
							objective.element:clbk_objective_administered(spawned_unit)
						end

						spawned_unit:brain():set_objective(objective)
					else
						spawned_unit:brain():set_followup_objective(objective)
					end

					nr_units_spawned = nr_units_spawned + 1

					if spawn_task.ai_task then
						spawn_task.ai_task.force_spawned = spawn_task.ai_task.force_spawned + 1
						spawned_unit:brain()._logic_data.spawned_in_phase = spawn_task.ai_task.phase
					end

					sp_data.delay_t = self._t + sp_data.interval

					if sp_data.amount then
						sp_data.amount = sp_data.amount - 1
					end
          
          if u_type_name == "spooc" or u_type_name == "FBI_spooc" then
            local spooc = tweak_data.character[spawned_unit:base()._tweak_table]
            spooc.priority_shout = nil
            spooc.spawn_sound_event = ""
            spooc.spooc_sound_events = {}
            spooc.spooc_attack_beating_time = {
            0,
            0
            }
            spooc.spooc_attack_timeout = {
            0.5,
            0.5
          }
          
          spawned_unit:movement():set_character_anim_variables()
          spawned_unit:brain():set_update_enabled_state(true)
          end
          
					return true
				end
			end
		end

		if hopeless then
			return true
		end
end



local function megaspawn(self)
  if spawntask == nil then return end
  --if elite_task_data.assault_current_pool >= elite_task_data.assault_threshold then return end
  
  local spawn_task = spawntask
  local unitcount = 0
  local spawn_points = spawn_task.spawn_group.spawn_pts
  local spawn_point = nil
  
  local produce_data = {
		name = nil,  
		spawn_ai = {} 
	}

  for u_type_name, spawn_info in pairs(spawntask.units_remaining) do
      
    if u_type_name == "FBI_heavy_G36" or u_type_name == "FBI_swat_M4" or string.find(u_type_name, "shield") then
      local nr_units = elite_task_data.assault_threshold - elite_task_data.assault_current_pool
      
      for i = 1, #spawn_points do
          if nr_units < 1 then break end
          
          spawn_point = spawn_points[i]
          
          if elite_task_data.assault_current_pool >= elite_task_data.assault_threshold and elite_task_data.assault_force_spawn == false then
              nr_units = 0
              spawn_info.amount = 0
              break
          end
        if unitcount < 6 then
          local category = tweak_data.group_ai.unit_categories[u_type_name]
          local current_unit_type = tweak_data.levels:get_ai_group_type()
          local units = category.unit_types[current_unit_type]
          local spawned_unit
          
          if  string.find(u_type_name, "shield") then
            produce_data.name = Idstring("units/pd2_dlc_usm2/characters/ene_male_marshal_shield_2/ene_male_marshal_shield_2")
            spawned_unit = spawn_point.mission_element:produce(produce_data)
            spawned_unit:inventory():add_unit_by_name(Idstring("units/payday2/weapons/wpn_npc_r870/wpn_npc_r870"), true, true)
            spawned_unit:inventory():equip_selection(2, true)
            local weapon = spawned_unit:inventory():equipped_unit()
            local weapon_base = weapon and weapon:base()
            local ammo_base = weapon_base and weapon_base:ammo_base()

            if ammo_base then
              ammo_base:set_ammo_remaining_in_clip(99)
            end
          else
            produce_data.name = units[math.random(#units)]
            spawned_unit = spawn_point.mission_element:produce(produce_data)
          end
          
          local objective = spawn_task.objective
          --AlvasMod:msg("spawn_task.objective: " .. tostring(spawn_task.objective.type))
          
          if not objective  then
            objective = spawn_task.group.objective.element:get_random_SO(spawned_unit)
            objective.grp_objective = spawn_task.group.objective
          end
          
          self:set_enemy_assigned(objective.area, spawned_unit:key())
          
          local u_data = self._police[spawned_unit:key()]
          
          if spawn_info.spawn_entry.tactics then
						u_data.tactics = spawn_info.spawn_entry.tactics
						u_data.tactics_map = {}

						for _, tactic_name in ipairs(u_data.tactics) do
							u_data.tactics_map[tactic_name] = true
						end
					end
          
          spawned_unit:brain():set_spawn_entry(spawn_info.spawn_entry, u_data.tactics_map)
          
          self:_add_group_member(spawn_task.group, spawned_unit:key())

					if spawned_unit:brain():is_available_for_assignment(objective) then
						if objective.element then
							objective.element:clbk_objective_administered(spawned_unit)
						end

						spawned_unit:brain():set_objective(objective)
					else
						spawned_unit:brain():set_followup_objective(objective)
					end
          
          unitcount = unitcount + 1
          nr_units = nr_units -1
          
          if unitcount > 4 and AlvasMod:is_spawn_camped(spawn_point) then
            unitcount = 6
          end
          
        else  --if unitcount < 
          unitcount = 0
        end   --if unitcount < 
        
      end  --for i = 1, #spawn_points
      
			
    
    end --if u_type_name
    
  end --spawntask.units_remaining
  
end








Hooks:PostHook(GroupAIStateBesiege, "set_wave_mode", "dwe_set_wave_mode", function (self, flag)
  if not AlvasMod then return end
  if not Network:is_server() then return end
  if not AlvasMod.settings.en_alvasmod then return end
  

  
  
  if elite_task_data.phase ~= flag then    
    local task_data = self._task_data.assault
    
--    if elite_task_data.death_knell_mode and flag ~= "fade" and flag == "sustain" then
--      task_data.phase_end_t = task_data.phase_end_t + 360
--    end
    
    
    if flag == "fade" then
      elite_task_data.phase = "fade"
      elite_task_data.phase_start = TimerManager:game():time()
      elite_task_data.phase_end = TimerManager:game():time() + task_data.fade_duration
    elseif flag == "build" then
      elite_task_data.phase = "build"
      elite_task_data.phase_start = TimerManager:game():time()
      elite_task_data.phase_end = TimerManager:game():time() + task_data.build_duration
    elseif flag == "sustain" then
      elite_task_data.phase = "assault"
      elite_task_data.phase_start = TimerManager:game():time()
      if elite_task_data.assault_force_spawn then
        elite_task_data.phase_end = TimerManager:game():time() + (self._tweak_data.assault.sustain_duration_min[1] + 120)
      else
        elite_task_data.phase_end = TimerManager:game():time() + self._tweak_data.assault.sustain_duration_min[1]
      end
      
    end

    
    if flag == "build" or flag == "sustain" then
      self._hunt_mode = true
    else
      self._hunt_mode = false
    end
    
  end
end)

Hooks:PostHook(GroupAIStateBesiege, "_upd_assault_task", "dwe_upd_assault_task", function (self)
  if Network:is_server() and AlvasMod and AlvasMod.settings.en_alvasmod then
  else
    return
  end
  
  local task_data = self._task_data.assault
  elite_task_data.assault_task = self._task_data.assault
  elite_task_data.phase = task_data.phase
  elite_task_data.phase_end = task_data.phase_end_t
  
  if elite_task_data.special_task then
    AlvasMod:special_task()
  end
  
  if task_data.phase == "build" or task_data.phase == "anticipation" or task_data.phase == "sustain" then
    
    if elite_task_data.assault_force_spawn or elite_task_data.spawnCall or managers.job:current_level_id() == "nmh" then
      for i=1, #self._spawning_groups do
        for _, sp in ipairs(self._spawning_groups[i].spawn_group.spawn_pts) do
          sp.delay_t = 0.1
          sp.interval = 0.1
        end
      end
    end
    
    if elite_task_data.swarm_timer < TimerManager:game():time() then
      if math.random(1,10) < 3 or elite_task_data.swarm_timer == 0 or elite_task_data.death_knell_mode then
        elite_task_data.swarm_timer = TimerManager:game():time() + 30
        AlvasMod:swarm()
      else
        AlvasMod:motivate()
      end
    
    end
  
    if elite_task_data.assault_current_pool < elite_task_data.assault_threshold then
        elite_task_data.spawnCall = true
        if AlvasMod.settings.en_megaspawn then
          megaspawn(self)
        end
    elseif elite_task_data.assault_force_spawn and elite_task_data.assault_current_pool < elite_task_data.assault_max_pool then
       if AlvasMod.settings.en_megaspawn then
          megaspawn(self)
        end
    else 
      elite_task_data.spawnCall = false
      if elite_task_data.assault_current_pool >= elite_task_data.assault_max_pool then
         cooldown(self)
      end
    end
    
  end --if task_data.phase 
end)

Hooks:PostHook(GroupAIStateBesiege, "_perform_group_spawning", "dwe_perform_group_spawning", function (self, spawn_task, force, use_last)
    spawntask = spawn_task
    --elite_task_data.objective_area = spawn_task.objective.area
    
end)
  