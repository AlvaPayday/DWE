Hooks:PostHook(CharacterTweakData, "_init_marshal_shield",  function (self, presets)

	self.marshal_shield = deep_clone(presets.base)
	self.marshal_shield.tags = {
		"law",
		"shield",
		"special"
	}
	self.marshal_shield.experience = {}
	self.marshal_shield.weapon = deep_clone(presets.weapon.normal)
	self.marshal_shield.detection = presets.detection.normal
	self.marshal_shield.HEALTH_INIT = 180
	self.marshal_shield.headshot_dmg_mul = 2
	self.marshal_shield.allowed_stances = {
		cbt = true
	}
	self.marshal_shield.allowed_poses = {
		crouch = false
	}
	self.marshal_shield.always_face_enemy = true
	self.marshal_shield.move_speed = presets.move_speed.very_fast
	self.marshal_shield.no_run_start = false
	self.marshal_shield.no_run_stop = true
	self.marshal_shield.no_retreat = true
	self.marshal_shield.no_arrest = true
	self.marshal_shield.surrender = nil
	self.marshal_shield.rescue_hostages = false
	self.marshal_shield.deathguard = false
	self.marshal_shield.no_equip_anim = true
	self.marshal_shield.wall_fwd_offset = 100
	self.marshal_shield.damage.explosion_damage_mul = 0.2
	self.marshal_shield.calls_in = nil
	self.marshal_shield.ignore_medic_revive_animation = true
	self.marshal_shield.shooting_death = false
	self.marshal_shield.damage.hurt_severity = presets.hurt_severities.only_light_hurt
	self.marshal_shield.damage.shield_knocked = false
	self.marshal_shield.immune_to_concussion = true
	self.marshal_shield.damage.immune_to_knockback = true
	self.marshal_shield.immune_to_knock_down = true
	self.marshal_shield.use_animation_on_fire_damage = false
	self.marshal_shield.flammable = false
  self.marshal_shield.can_be_tased = false
	self.marshal_shield.weapon.is_shotgun_mag = {
		aim_delay = {
			0,
			0
		},
		focus_delay = 0,
		focus_dis = 200,
		spread = 20,
		miss_dis = 40,
		RELOAD_SPEED = 0.25,
		melee_speed = 1,
		melee_dmg = 50,
		melee_retry_delay = {
			1,
			2
		},
		range = {
			optimal = 400,
			far = 2000,
			close = 200
		},
		FALLOFF = {
			{
				dmg_mul = 6,
				r = 0,
				acc = {
					0.7,
					0.9
				},
				recoil = {
					0.25,
					0.45
				},
				mode = {
					0,
					1,
					2,
					0
				}
			},
			{
				dmg_mul = 5.25,
				r = 700,
				acc = {
					0.7,
					0.8
				},
				recoil = {
					0.35,
					0.55
				},
				mode = {
					1,
					2,
					1,
					0
				}
			},
			{
				dmg_mul = 4.5,
				r = 1000,
				acc = {
					0.4,
					0.7
				},
				recoil = {
					0.35,
					0.55
				},
				mode = {
					1,
					0,
					0,
					0
				}
			},
			{
				dmg_mul = 2,
				r = 2000,
				acc = {
					0.3,
					0.5
				},
				recoil = {
					0.45,
					1
				},
				mode = {
					1,
					0,
					0,
					0
				}
			},
			{
				dmg_mul = 1.5,
				r = 3000,
				acc = {
					0.2,
					0.3
				},
				recoil = {
					0.35,
					1.5
				},
				mode = {
					1,
					0,
					0,
					0
				}
			}
		}
	}
	self.marshal_shield.weapon_voice = "3"
	self.marshal_shield.experience.cable_tie = "tie_swat"
	self.marshal_shield.speech_prefix_p1 = "l"
	self.marshal_shield.speech_prefix_p2 = self._speech_prefix_p2
	self.marshal_shield.speech_prefix_count = 4
	self.marshal_shield.priority_shout = "f31"
	self.marshal_shield.access = "shield"
	self.marshal_shield.chatter = presets.enemy_chatter.shield
	self.marshal_shield.announce_incomming = "incomming_shield"
	self.marshal_shield.steal_loot = nil

	--table.insert(self._enemy_list, "marshal_shield")

	self.marshal_shield_break = deep_clone(self.tank)
	self.marshal_shield_break.tags = {
		"law",
		"special"
	}
	self.marshal_shield_break.HEALTH_INIT = 240
  self.marshal_shield_break.flammable = false
  self.marshal_shield_break.can_be_tased = false
	self.marshal_shield_break.allowed_stances = nil
	self.marshal_shield_break.allowed_poses = nil
	self.marshal_shield_break.no_equip_anim = nil
	self.marshal_shield_break.no_run_start = nil
	self.marshal_shield_break.no_run_stop = nil
	self.marshal_shield_break.always_face_enemy = nil
	self.marshal_shield_break.wall_fwd_offset = nil
	self.marshal_shield_break.priority_shout = nil
	self.marshal_shield_break.access = "swat"
	self.marshal_shield_break.chatter = presets.enemy_chatter.swat
	self.marshal_shield_break.announce_incomming = nil
	self.marshal_shield_break.damage.hurt_severity = presets.hurt_severities.base
	self.marshal_shield_break.damage.explosion_damage_mul = 1
	self.marshal_shield_break.use_animation_on_fire_damage = nil
	self.marshal_shield_break.damage.shield_knocked = nil
	self.marshal_shield_break.ignore_medic_revive_animation = false
	self.marshal_shield_break.modify_health_on_tweak_change = true
	self.marshal_shield_break.tmp_invulnerable_on_tweak_change = 0
  self.marshal_shield_break.move_speed = presets.move_speed.very_fast
	self.marshal_shield_break.weapon.is_shotgun_pump = {
		aim_delay = {
			0,
			0
		},
		focus_delay = 0,
		focus_dis = 200,
		spread = 20,
		miss_dis = 40,
		RELOAD_SPEED = 1,
		melee_speed = 1,
		melee_dmg = 2,
		melee_retry_delay = {
			1,
			2
		},
		range = {
			optimal = 400,
			far = 2000,
			close = 200
		},
		FALLOFF = {
			{
				dmg_mul = 15,
				r = 0,
				acc = {
					0.7,
					0.9
				},
				recoil = {
					0.25,
					0.45
				},
				mode = {
					0,
					1,
					2,
					0
				}
			},
			{
				dmg_mul = 10,
				r = 700,
				acc = {
					0.7,
					0.8
				},
				recoil = {
					0.35,
					0.55
				},
				mode = {
					1,
					2,
					1,
					0
				}
			},
			{
				dmg_mul = 4.5,
				r = 1000,
				acc = {
					0.4,
					0.7
				},
				recoil = {
					0.35,
					0.55
				},
				mode = {
					1,
					0,
					0,
					0
				}
			},
			{
				dmg_mul = 2,
				r = 2000,
				acc = {
					0.3,
					0.5
				},
				recoil = {
					0.45,
					1
				},
				mode = {
					1,
					0,
					0,
					0
				}
			},
			{
				dmg_mul = 1.5,
				r = 3000,
				acc = {
					0.2,
					0.3
				},
				recoil = {
					0.35,
					1.5
				},
				mode = {
					1,
					0,
					0,
					0
				}
			}
		}
	}

	--table.insert(self._enemy_list, "marshal_shield_break")
end)


Hooks:PostHook(CharacterTweakData, "_set_overkill_290", "dwe_ctd_set_overkill_290", function (self)
    
  self.marshal_marksman.weapon.is_rifle.FALLOFF[1].dmg_mul = 5
	self.marshal_marksman.weapon.is_rifle.FALLOFF[2].dmg_mul = 5
	self.marshal_marksman.weapon.is_rifle.FALLOFF[3].dmg_mul = 7.5
	self.marshal_marksman.weapon.is_rifle.FALLOFF[4].dmg_mul = 10
	self.marshal_marksman.weapon.is_rifle.FALLOFF[5].dmg_mul = 7.5
	--self.marshal_marksman.HEALTH_INIT = 320
    
end)

Hooks:PostHook(CharacterTweakData, "_init_tank", function (self, presets)

self.tank.can_be_tased = false
self.tank.flammable = false
self.tank.move_speed = presets.move_speed.fast
self.tank_mini.move_speed = presets.move_speed.slow

end)
