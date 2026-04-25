

local mvec3_lerp = mvector3.lerp
local mvec3_sub = mvector3.subtract
local mvec3_norm = mvector3.normalize
local mvec_to = Vector3()
local mvec_spread = Vector3()

function NPCRaycastWeaponBase:_fire_raycast(user_unit, from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul, target_unit)
  
	local result = {}
	local hit_unit = nil
	local miss, extra_spread = self:_check_smoke_shot(user_unit, target_unit)

	if miss then
		result.guaranteed_miss = miss

		mvector3.spread(direction, math.rand(unpack(extra_spread)))
	end

	mvector3.set(mvec_to, direction)
	mvector3.multiply(mvec_to, 20000)
	mvector3.add(mvec_to, from_pos)

	local damage = self._damage * (dmg_mul or 1)
	local bullet_slotmask = self._bullet_slotmask
	local col_ray = World:raycast("ray", from_pos, mvec_to, "slot_mask", bullet_slotmask, "ignore_unit", self._setup.ignore_units)
	local player_hit, player_ray_data = nil

	if shoot_player and self._hit_player then
    
		player_hit, player_ray_data = self:damage_player(col_ray, from_pos, direction, result)		
		if Network:is_client() then
      if col_ray ~= nil then
        if AlvasMod and AlvasMod.settings.en_elite_ultra then
          damage = damage * 1.3 --30% damage buff for ultra, no roll for applying damage
          self._unit:base():bullet_class():on_hit_player(col_ray or player_ray_data, self._unit, user_unit, damage)
        else
          if math.random(1,10) > 3 then --30% of hits not being applied. balance for horde damage
            self._unit:base():bullet_class():on_hit_player(col_ray or player_ray_data, self._unit, user_unit, damage)
          end
          
        end
				
      end
		else
			if player_hit and user_unit:base()._tweak_table == "marshal_marksman" and AlvasMod then
        if col_ray ~= nil then
				self._unit:base():bullet_class():on_hit_player(col_ray or player_ray_data, self._unit, user_unit, damage)
				 local posi = managers.player:player_unit():position()
        
         World:effect_manager():spawn({
            effect = Idstring("effects/particles/weapons/sniper_trail"),
            position = from_pos,
            normal = (posi - from_pos):normalized()
          })
        
          user_unit:contour():add("mark_enemy",true)
        
        if AlvasMod.settings.en_marshal_smoke then
          local rotation = Rotation(math.random() * 360, 0, 0)
          if math.random() > 0.5 and smoke_delay < TimerManager:game():time()  then
            managers.network:session():send_to_peers_synched("sync_smoke_grenade", posi, posi, 1, true)
            managers.groupai:state():sync_smoke_grenade(posi, posi, 15, false)
            smoke_delay = TimerManager:game():time() + 5
          end
        end
      
      end
      
        
			elseif player_hit and user_unit:base()._tweak_table == "sniper" and AlvasMod then
				self._unit:base():bullet_class():on_hit_player(col_ray or player_ray_data, self._unit, user_unit, damage)
        
        if col_ray ~= nil then
          local posi = managers.player:player_unit():position()

          World:effect_manager():spawn({
            effect = Idstring("effects/particles/weapons/sniper_trail"),
            position = from_pos,
            normal = (posi - from_pos):normalized()
          })
      
          user_unit:contour():add("mark_enemy",true)
        end
        
			else
        if col_ray ~= nil then
					self._unit:base():bullet_class():on_hit_player(col_ray or player_ray_data, self._unit, user_unit, damage)
        end

			end
		end
	end
	


	
	local char_hit = nil

	if not player_hit and col_ray then
		char_hit = self._unit:base():bullet_class():on_collision(col_ray, self._unit, user_unit, damage)
	end

	if (not col_ray or col_ray.unit ~= target_unit) and target_unit and target_unit:character_damage() and target_unit:character_damage().build_suppression then
		target_unit:character_damage():build_suppression(tweak_data.weapon[self._name_id].suppression)
	end

	if not col_ray or col_ray.distance > 600 or result.guaranteed_miss then
		local num_rays = (tweak_data.weapon[self._name_id] or {}).rays or 1

		for i = 1, num_rays do
			mvector3.set(mvec_spread, direction)

			if i > 1 then
				mvector3.spread(mvec_spread, self:_get_spread(user_unit))
			end

			self:_spawn_trail_effect(mvec_spread, col_ray)
		end
	end

	result.hit_enemy = char_hit

	if self._alert_events then
		result.rays = {
			col_ray
		}
	end

	self:_cleanup_smoke_shot()

	return result
end

    