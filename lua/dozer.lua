local mvec3_set = mvector3.set
local mvec3_set_z = mvector3.set_z
local mvec3_sub = mvector3.subtract
local mvec3_norm = mvector3.normalize
local mvec3_dir = mvector3.direction
local mvec3_set_l = mvector3.set_length
local mvec3_add = mvector3.add
local mvec3_dot = mvector3.dot
local mvec3_cross = mvector3.cross
local mvec3_rot = mvector3.rotate_with
local mvec3_rand_orth = mvector3.random_orthogonal
local mvec3_lerp = mvector3.lerp
local mrot_axis_angle = mrotation.set_axis_angle
local temp_vec1 = Vector3()
local temp_vec2 = Vector3()
local temp_vec3 = Vector3()
local temp_rot1 = Rotation()
local bezier_curve = {
	0,
	0,
	1,
	1
}


Hooks:PostHook(CopActionShoot, "anim_clbk_melee_strike", "dwe_chk_dzr_melee", function (self)
  if not AlvasMod then return end
  
  if not self._attention then
		return
	end
  
  if self._unit:base()._tweak_table == "tank" or self._unit:base()._tweak_table == "tank_medic" or self._unit:base()._tweak_table == "tank_mini" then

        local peer = managers.network:session():peer_by_unit(self._attention.unit)
        local rot = AlvasMod:inverse_rot(peer:unit())
        local dir = mvector3.normalize(rot)
        local target_body = peer:unit():body(0)
        target_body:push_at(target_body:mass(), dir * 1000, peer:unit():position() )
        
        if not peer then
          return
        end
        
        if peer and AlvasMod then
          if peer:is_host() then
            managers.player:set_player_state("incapacitated", self._unit)
            AlvasMod:broadcast(peer:name() .. " knocked out by a bulldozer")
          else
            local success, result = pcall(sync_player,peer,"incapacitated")
            if success then
            AlvasMod:broadcast(peer:name() .. " knocked out by a bulldozer")
            else
              --AlvasMod:msg("KO failed : " .. tostring(result))
            end
          end
          return
        end 

    end
    
end)

Hooks:PostHook(TankCopDamage, "seq_clbk_vizor_shatter", "dzr_rage", function (self)
    if not AlvasMod then return end
    
    if not self._unit:character_damage():dead() then
      if self._attention and self._attention.unit and alive(self._attention.unit) then
        --check distance to nearest player. trigger melee automatically if close

        local test_distance = mvector3.distance(self._unit:position(),self._attention.unit:position())
        if test_distance <= 130 then
          self:_chk_start_melee(false)
        else
          --AlvasMod:charge(self.unit, self._attention.unit)
        end
        
      end
      
    end
end)

Hooks:PostHook(TankCopLogicAttack, "update", "dwe_tcla_update", function (data)
--if not AlvasMod or not Network:is_server() then return end
    
    if not data then return end
    
    local enemy_type = data.unit:base()._tweak_table
    
    if enemy_type == "tank" or enemy_type == "tank_mini" then
   -- if AlvasMod and AlvasMod.settings.en_elite_ultra and elite_task_data.death_knell_mode and Network:is_server() and data.unit and data.attention_obj then
      if not data.attention_obj then return end
      local focus_enemy = data.attention_obj
      local distance = mvector3.distance(data.unit:position(), focus_enemy.m_pos)
      
      if distance < 600 and distance > 100 then
        local slotmask = managers.slot:get_mask("statics")
        local mov_ext = data.unit:movement()
        local head_pos = mov_ext:m_head_pos()
        local ray = World:raycast("ray", head_pos, focus_enemy.m_head_pos, "slot_mask", slotmask)
        if ray then 
          local hi_ray = World:raycast("ray", head_pos, focus_enemy.m_head_pos + (math.UP * 40), "slot_mask", slotmask)
          if hi_ray and hi_ray.distance > ray.distance then
            local new_position = Vector3(focus_enemy.m_pos.x, focus_enemy.m_pos.y, focus_enemy.m_head_pos + (math.UP * 40))
            AlvasMod:throwMolotov(data.unit,new_position)
          end
          
        end
        
      end
    end
end)

local new_objective = {
  type = "free",
  scan = true,
  action = {
			variant = "idle",
			body_part = 1,
			type = "act",
			blocks = {
				action = -1,
				walk = -1
      }
  }
}

Hooks:PreHook(CopLogicAttack, "update", "dwe_cla_update", function (data)
    if not data then return end
    if not data.objective then return end
    
    if data.objective.type == "follow" then
     if not data.objective.follow_unit or not alive(data.objective.follow_unit) and Network:is_server() then
       data.unit:brain():cancel_all_pathing_searches()
       CopLogicBase.cancel_queued_tasks(data.internal_data)
       CopLogicBase.cancel_delayed_clbks(data.internal_data)
       data.unit:brain():set_objective(new_objective)
       return
     end
    end
    
end)
