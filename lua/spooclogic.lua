Hooks:PostHook(SpoocLogicAttack, "_upd_spooc_attack", "dwe_upd_spooc_attack", function (self, data, my_data)
  if not AlvasMod then return end
  if not data.attention_obj then return end
  
  local focus_enemy = data.attention_obj
  
  if my_data.attention_unit ~= focus_enemy.u_key then
				CopLogicBase._set_attention(data, focus_enemy)
				my_data.attention_unit = focus_enemy.u_key
  end
  
  if my_data and my_data.shooting and data.attention_obj.dis < 1300 then
    
    local action = SpoocLogicAttack._chk_request_action_spooc_attack(data, my_data, true)

          if action then
            
            local new_action_data = {
              body_part = 1,
              type = "spooc",
              flying_strike = true
            }
            
            my_data.spooc_attack = {
              start_t = data.t,
              target_u_data = focus_enemy,
              action = action
            }
            data.unit:brain():action_request(new_action_data)
            
            return 0
          end  
  end
  
end)

Hooks:PostHook(CopLogicAttack, "_upd_aim", "dwe_upd_aim", function(self, data, my_data)
    if not Network:is_server() or not AlvasMod then return end

    if data and data.unit and data.unit:base()._tweak_table == "spooc" then
      
      if my_data and my_data.shooting and data.attention_obj.dis < 1300 then
        local action = SpoocLogicAttack._chk_request_action_spooc_attack(data, my_data, true)

          if action then
            local focus_enemy = data.attention_obj
            
            local new_action_data = {
              body_part = 1,
              type = "spooc",
              flying_strike = true
            }
            my_data.spooc_attack = {
              start_t = data.t,
              target_u_data = focus_enemy,
              action = action
            }
            
            if data.unit:anim_data().crouch then
              CopLogicAttack._chk_request_action_stand(data)
            end
          
            data.unit:brain():action_request(new_action_data)
            return 0
          end  
          
         
      end --my_data.shooting
      
    end
   
      
end)

  
Hooks:PreHook(CopLogicAttack, "action_complete_clbk", "dwe_cla_action_complete_clbk", function (self, data, action)
    if not AlvasMod then return end
    
    if data and data.unit and data.unit:base()._tweak_table == "spooc" then
    
      local my_data = data.internal_data
    
      if my_data.shooting and self._target_unit then
        local dis = mvector3.distance(data.unit:position(), self._target_unit:position())
        if dis < 1300 then
        self._target_unit:movement():on_targetted_for_attack(false, data.unit)
          	local new_action_data = {
              body_part = 1,
              type = "spooc",
              flying_strike = true
            }
            self._unit:brain():action_request(new_action_data)
        end
      end
    end
    
end)


Hooks:PostHook(ActionSpooc, "init", "sp_ph_init_set", function (self, action_desc, common_data)
    if not Network:is_server() or not AlvasMod then return end
    if not common_data or not self._common_data then return end
    
    self._taunt_after_assault = ""
    self._common_data.char_tweak.spooc_sound_events = {}
    if self._common_data and self._common_data.char_tweak then
      self._common_data.char_tweak.spooc_attack_beating_time[1] = 0
      self._common_data.char_tweak.spooc_attack_beating_time[2] = 0
    end
    
    if not self._target_unit then
      local peer = AlvasMod:nearestPeer(self._unit:position())
      if peer then
          local target_unit = peer:unit()
          local attention = self._ext_movement:attention()
          self._target_unit = attention and target_unit
        	local attention_data = {
            unit = target_unit
          }
          self._unit:movement():set_attention(attention_data)
      end
      
    end
    
end)

function spicy_check(self)
  local peer = AlvasMod:nearestPeer(self._unit:position())
  if not peer then return false end
  
  local dis = mvector3.distance(self._unit:position(), peer:unit():position())
  if dis and dis < 1200 then
    return true
  end
  return false
end

Hooks:PreHook(ActionSpooc, "chk_can_start_flying_strike", "dwe_chk_can_start_flying_strike", function (self, unit, target_unit)
   if Network:is_server() and AlvasMod and AlvasMod.settings.en_alvasmod then
  else
    return
  end  
  
  if not target_unit then return end
  
  local target_pos = target_unit:movement():m_pos()
	local my_pos = unit:movement():m_pos()
	local target_vec = ActionSpooc._tmp_vec1

	mvector3.set(target_vec, target_pos)
	mvector3.subtract(target_vec, my_pos)

	local target_dis = mvector3.length(target_vec)

	if target_dis > 1100 then
		return
	end

	mvector3.set_z(target_vec, 0)
	mvector3.normalize(target_vec)

	local my_fwd = unit:movement():m_fwd()
	local dot = mvector3.dot(target_vec, my_fwd)

	if dot < 0.5 then
		return
	end

	local ray_from = ActionSpooc._tmp_vec1

	mvector3.set(ray_from, my_pos)
	mvector3.set_z(ray_from, mvector3.z(ray_from) + 160)

	local ray_to = ActionSpooc._tmp_vec2

	mvector3.set(ray_to, target_pos)
	mvector3.set_z(ray_to, mvector3.z(ray_to) + 160)
	mvector3.lerp(ray_to, ray_from, ray_to, 0.5)
	mvector3.set_z(ray_to, mvector3.z(ray_to) + 50)

	local sphere_radius = 10
	local ray = World:raycast("ray", ray_from, ray_to, "sphere_cast_radius", sphere_radius, "bundle", 5, "slot_mask", managers.slot:get_mask("AI_graph_obstacle_check"), "ray_type", "walk")

	if ray then
		return
	end

	mvector3.set(ray_from, target_pos)
	mvector3.set_z(ray_from, mvector3.z(ray_from) + 160)

	local ray = World:raycast("ray", ray_from, ray_to, "sphere_cast_radius", sphere_radius, "bundle", 5, "slot_mask", managers.slot:get_mask("AI_graph_obstacle_check"), "ray_type", "walk")

	if ray then
		return
	end

	return true
end)


Hooks:PreHook(CopLogicAttack, "enter", "_cl_chk_shoot", function (self, data, new_logic_name, enter_params)
    if not Network:is_server() or not AlvasMod then return end
    if not self._common_data then return end
    
    if data and data.unit and data.unit:base()._tweak_table == "spooc" then
      
      local my_data = {
        unit = data.unit
      }
      data.internal_data = my_data
      
      if my_data and my_data.shooting or my_data.firing then
        local peer = AlvasMod:nearestPeer(data.unit:position())
        if self._target_unit and self._target_unit ~= peer:unit() then
          local attention = self._ext_movement:attention()
          if attention then
            self._target_unit = attention and peer:unit()
            self._target_unit:movement():on_targetted_for_attack(false, self._common_data.unit)
          	local new_action_data = {
              body_part = 1,
              type = "spooc",
              flying_strike = true
            }
            self._unit:brain():action_request(new_action_data)
            return 0
          end

        else
          local attention = self._ext_movement:attention()
          if attention then
            self._target_unit = attention and attention.unit
            self._target_unit:movement():on_targetted_for_attack(false, self._common_data.unit)
          	local new_action_data = {
              body_part = 1,
              type = "spooc",
              flying_strike = true
            }
            self._unit:brain():action_request(new_action_data)
          else
            local delay = CopLogicBase._upd_attention_obj_detection(data, nil, nil)
            local new_attention, new_prio_slot, new_reaction = CopLogicIdle._get_priority_attention(data, data.detected_attention_objects)

            CopLogicBase._set_attention_obj(data, new_attention, new_reaction)
            if attention then
            self._target_unit = attention and attention.unit
            self._target_unit:movement():on_targetted_for_attack(false, self._common_data.unit)
          	local new_action_data = {
              body_part = 1,
              type = "spooc",
              flying_strike = true
            }
            self._unit:brain():action_request(new_action_data)
            return 0
            end
          end
        end
        
      end
      
    end
    
    
end)
