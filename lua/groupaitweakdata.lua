local DIFF_ID_1_EASY = 1
local DIFF_ID_2_NORMAL = 2
local DIFF_ID_3_HARD = 3
local DIFF_ID_4_VERYHARD = 4
local DIFF_ID_5_OVERKILL = 5
local DIFF_ID_6_MAYHEM = 6
local DIFF_ID_7_DEATHWISH = 7
local DIFF_ID_8_DEATHSENT = 8

Hooks:PostHook(GroupAITweakData, "_init_enemy_spawn_groups", "dwe_init_enemy_spawn_groups", function(self, difficulty_index)

if not AlvasMod then 
  return
end

if not AlvasMod.settings.en_alvasmod then
  return
end

self._tactics = {
    
	    CS_cop = {
			"provide_coverfire",
			"provide_support",
			"ranged_fire"
		},
		CS_cop_stealth = {
			"flank",
			"provide_coverfire",
			"provide_support"
		},
		CS_swat_rifle = {
			"charge",
			"provide_coverfire",
			"provide_support",
			"ranged_fire",
			"deathguard"
		},
		CS_swat_shotgun = {
			"charge",
			"provide_coverfire",
			"provide_support",
			"shield_cover"
		},
		CS_swat_heavy = {
			"charge",
			"provide_coverfire",
			"provide_support"
		},
		CS_shield = {
			"charge",
			"provide_coverfire",
			"provide_support",
			"shield",
			"deathguard"
		},
		CS_swat_rifle_flank = {
			"flank",
			"charge",
			"provide_coverfire",
			"provide_support"
		},
		CS_swat_shotgun_flank = {
			"flank",
			"charge",
			"provide_coverfire",
			"provide_support"
		},
		CS_swat_heavy_flank = {
			"flank",
			"charge",
			"provide_coverfire",
			"provide_support",
			"shield_cover"
		},
		CS_shield_flank = {
			"flank",
			"charge",
			"provide_coverfire",
			"provide_support",
			"shield"
		},
		CS_tazer = {
			"flank",
			"charge",
			"shield_cover",
			"murder"
		},
		CS_sniper = {
			"ranged_fire",
			"provide_coverfire",
			"provide_support",
      "flank"
		},
		FBI_suit = {
			"flank",
			"ranged_fire"
		},
		FBI_suit_stealth = {
			"provide_coverfire",
			"provide_support",
			"flank"
		},
		FBI_swat_rifle = {
			"provide_coverfire",
			"charge",
			"provide_support",
			"ranged_fire"
		},
		FBI_swat_shotgun = {
			"charge",
			"provide_coverfire",
			"provide_support"
		},
		FBI_heavy = {
			"charge",
			"provide_coverfire",
			"provide_support",
			"shield_cover",
			"deathguard"
		},
		FBI_shield = {
			"charge",
			"provide_coverfire",
			"provide_support",
			"shield",
			"deathguard"
		},
		FBI_swat_rifle_flank = {
			"flank",
			"charge",
			"provide_coverfire",
			"provide_support"
		},
		FBI_swat_shotgun_flank = {
			"flank",
			"charge",
			"provide_coverfire",
			"provide_support"
		},
		FBI_heavy_flank = {
			"flank",
			"charge",
			"provide_coverfire",
			"provide_support",
			"shield_cover"
		},
		FBI_shield_flank = {
			"flank",
			"charge",
			"provide_coverfire",
			"provide_support",
			"shield"
		},
		FBI_tank = {
			"charge",
			"deathguard",
			"shield_cover"
		},

		swat_shotgun_rush = {
			"charge",
			"provide_coverfire",
			"provide_support",
			"deathguard"
		},
		swat_shotgun_flank = {
			"charge",
			"provide_coverfire",
			"provide_support",
			"flank",
			"deathguard"

		},
		swat_rifle = {
			"ranged_fire",
			"provide_coverfire",
			"provide_support"
		},
		swat_rifle_flank = {
			"ranged_fire",
			"provide_coverfire",
			"provide_support",
			"flank"

		},
		shield_wall_ranged = {
			"shield",
			"ranged_fire",
			"provide_support "
		},
		shield_support_ranged = {
			"shield_cover",
			"ranged_fire",
			"provide_coverfire"
		},
		shield_wall_charge = {
			"shield",
			"charge",
			"provide_support "
		},
		shield_support_charge = {
			"shield_cover",
			"charge",
			"provide_coverfire"
		},
		shield_wall = {
			"shield",
			"ranged_fire",
			"provide_support",
			"murder",
			"deathguard"
		},
		tazer_flanking = {
			"flanking",
			"charge",
			"provide_coverfire",
			"murder"
		},
		tazer_charge = {
			"charge",
			"provide_coverfire",
			"murder"
		},
		tank_rush = {
			"charge",
			"provide_coverfire",
			"murder"
		},
		spooc = {
			"charge"
		}
	}
  
  self.enemy_spawn_groups = {}
  
  self.enemy_spawn_groups.tac_swat_shotgun_rush = {
			amount = {
				4,
				5
			},
			spawn = {
				{
					amount_min = 2,
					freq = 2,
					amount_max = 6,
					rank = 2,
					unit = "FBI_swat_R870",
					tactics = self._tactics.swat_shotgun_rush
				},
				{
					amount_min = 2,
					freq = 2,
					amount_max = 8,
					rank = 3,
					unit = "FBI_heavy_R870",
					tactics = self._tactics.swat_shotgun_rush
				},
				{
					amount_min = 1,
					freq = 0.35,
					amount_max = 2,
					rank = 2,
					unit = "medic_R870",
					tactics = self._tactics.swat_shotgun_rush
				}
			}
		}
    
    self.enemy_spawn_groups.tac_swat_shotgun_flank = {
			amount = {
				4,
				5
			},
			spawn = {
				{
					amount_min = 2,
					freq = 2,
					amount_max = 6,
					rank = 2,
					unit = "FBI_swat_R870",
					tactics = self._tactics.swat_shotgun_flank
				},
				{
					amount_min = 2,
					freq = 2,
					amount_max = 8,
					rank = 3,
					unit = "FBI_heavy_R870",
					tactics = self._tactics.swat_shotgun_flank
				},
				{
					amount_min = 0,
					freq = 0.35,
					amount_max = 1,
					rank = 2,
					unit = "medic_R870",
					tactics = self._tactics.swat_shotgun_flank
				}
			}
		}
  self.enemy_spawn_groups.tac_shield_wall_ranged = {
			amount = {
				2,
				4
			},
			spawn = {
				{
          respawn_cooldown = 1,
					amount_min = 3,
					freq = 1,
					amount_max = 8,
					rank = 1,
					unit = "FBI_swat_M4",
					tactics = self._tactics.shield_support_ranged
				},
				{
					amount_min = 3,
					freq = 1,
					amount_max = 6,
					rank = 1,
					unit = "FBI_shield",
					tactics = self._tactics.shield_wall_ranged
				},
				{
					amount_min = 2,
					freq = 1,
					amount_max = 4,
					rank = 1,
					unit = "medic_M4",
					tactics = self._tactics.shield_support_charge
				}
			}
		}

    self._tactics.tazer_flanking = {
      "flank",
      "charge",
      "provide_coverfire",
      "murder"
    }
    
    self.enemy_spawn_groups.tac_tazer_flanking = {
			amount = {
				1,
				1
			},
			spawn = {
				{
					amount_min = 1,
					freq = 1,
					amount_max = 3,
					rank = 1,
					unit = "CS_tazer",
					tactics = self._tactics.tazer_flanking
				}
			}
		}
    
    self.enemy_spawn_groups.tac_tazer_charge = {
			amount = {
				2,
				2
			},
			spawn = {
				{
					amount_min = 1,
					freq = 1,
					amount_max = 3,
					rank = 1,
					unit = "CS_tazer",
					tactics = self._tactics.tazer_charge
				},
				{
          respawn_cooldown = 1,
					amount_min = 2,
					freq = 1,
					amount_max = 8,
					rank = 1,
					unit = "FBI_swat_M4",
					tactics = self._tactics.swat_rifle_flank
				},
				{
          respawn_cooldown = 1,
					amount_min = 2,
					freq = 3,
					amount_max = 12,
					rank = 1,
					unit = "FBI_heavy_G36",
					tactics = self._tactics.swat_rifle_flank
				},
        
        {
					amount_min = 3,
					freq = 1,
					amount_max = 6,
					rank = 1,
					unit = "FBI_shield",
					tactics = self._tactics.shield_wall_ranged
				}
        
			}
		}

    self.enemy_spawn_groups.tac_swat_rifle = {
			amount = {
				4,
				5
			},
			spawn = {
				{
					amount_min = 3,
					freq = 2,
					amount_max = 12,
					rank = 2,
					unit = "FBI_swat_M4",
					tactics = self._tactics.swat_rifle
				},
				{
					amount_min = 3,
					freq = 2,
					amount_max = 8,
					rank = 3,
					unit = "FBI_heavy_G36",
					tactics = self._tactics.swat_rifle
				},
				{
					amount_min = 1,
					freq = 0.35,
					amount_max = 2,
					rank = 2,
					unit = "medic_M4",
					tactics = self._tactics.swat_rifle
				},
        
        {
					amount_min = 1,
					freq = 1,
					amount_max = 3,
					rank = 1,
					unit = "FBI_shield",
					tactics = self._tactics.shield_wall_ranged
				}
			}
		}
    
 self.enemy_spawn_groups.tac_swat_rifle_flank = {
			amount = {
				4,
				5
			},
			spawn = {
				{
					amount_min = 2,
					freq = 2,
					amount_max = 3,
					rank = 2,
					unit = "FBI_swat_M4",
					tactics = self._tactics.swat_rifle_flank
				},
				{
					amount_min = 2,
					freq = 2,
					amount_max = 5,
					rank = 3,
					unit = "FBI_heavy_G36",
					tactics = self._tactics.swat_rifle_flank
				},
				{
					amount_min = 0,
					freq = 0.35,
					amount_max = 1,
					rank = 2,
					unit = "medic_M4",
					tactics = self._tactics.swat_rifle_flank
				}
			}
		}
  

    local dozerspawn = AlvasMod.settings.dozer_spawn
    
    self.enemy_spawn_groups.tac_bull_rush = {
			amount = {
				dozerspawn,
				dozerspawn
			},
			spawn = {
				{
					amount_min = dozerspawn,
					freq = 1,
					amount_max = dozerspawn,
          respawn_cooldown = 15,
					rank = 1,
					unit = "FBI_tank",
					tactics = self._tactics.tank_rush
				},
        
        {
					amount_min = 2,
					freq = 1,
					amount_max = 4,
          respawn_cooldown = 30,
					rank = 1,
					unit = "CS_cop_C45_R870",
					tactics = {"flank"}
				}
        
        
			}
		}
    
   
    
    if AlvasMod.settings.en_cloakers == true then
      --currently set to scripted-only
    self.enemy_spawn_groups.single_spooc = {
		amount = {
			1,
			1
		},
		spawn = {
			{
				freq = 1,
				amount_min = 1,
				rank = 1,
				unit = "spooc",
				tactics = self._tactics.spooc
			}
		}
	}
    else
      --currently set to scripted-only
    self.enemy_spawn_groups.single_spooc = {
		amount = {
			0,
			0
		},
		spawn = {
			{
				freq = 0,
				amount_min = 0,
				amount_max = 0,
				rank = 1,
				unit = "spooc",
				tactics = self._tactics.spooc
			}
		}
	}
    end
    
self.enemy_spawn_groups.FBI_spoocs = self.enemy_spawn_groups.single_spooc
  
  
  
  
  
local snipervalue = 0

if AlvasMod.settings.en_fbi_sniper == true then
  snipervalue = AlvasMod.settings.fbi_sniper_limit
  self._tactics.groundsniper = {
      "charge",
			"provide_coverfire",
			"provide_support",
			"flank",
			"deathguard"
	}
	self.enemy_spawn_groups.tac_sniper = {
		amount = {
			1,
			1
		},
		spawn = {
			{
        respawn_cooldown = 5,
				amount_min = snipervalue,
				freq = 1,
				amount_max = snipervalue,
				rank = 1,
				unit = "FBI_groundsniper",
				tactics = self._tactics.groundsniper
			}
		}
	}
end



end)

local disabled_factions = {
	america = false,
	russia = false,
	zombie = false,
	murkywater = false,
	federales = false
}

Hooks:PostHook(GroupAITweakData, "_init_enemy_spawn_groups_level", "dwe__marshal_level", function(self, tweak_data, difficulty_index, ...)
  if not AlvasMod then return end
	local lvl_tweak_data = tweak_data.levels[Global.game_settings and Global.game_settings.level_id or Global.level_data and Global.level_data.level_id]
  

	if lvl_tweak_data and not lvl_tweak_data.ai_marshal_spawns_disabled then
    local teamcount = AlvasMod.settings.adm_sniper_count
    
		self.enemy_spawn_groups.marshal_squad = {
			spawn_cooldown = 20,
			max_nr_simultaneous_groups = 1,
			initial_spawn_delay = 30,
			amount = {
				teamcount,
				teamcount
			},
			spawn = {
				{
					respawn_cooldown = 90,
					amount_min = 0,
          amount_max = 0,
					rank = 2,
					freq = 0,
					unit = "marshal_shield",
					tactics = self._tactics.marshal_shield
				},
				{
					respawn_cooldown = 20,
					amount_min = teamcount,
					rank = 2,
					freq = 1,
					unit = "marshal_marksman",
					tactics = self._tactics.marshal_marksman
				}
			},
			spawn_point_chk_ref = table.list_to_set({
				"tac_shield_wall",
				"tac_shield_wall_ranged",
				"tac_shield_wall_charge"
			})
		}
	end

end)


-- Max Spawn Limits, Boosted Special Spawns, Expanded Dozer Types

Hooks:PostHook(GroupAITweakData, "_init_unit_categories", "dwe_init_unit_categories", function(self, difficulty_index)
  if not AlvasMod then return end
  
	local dozerspawn = AlvasMod.settings.dozer_spawn
  local sniperlimit = AlvasMod.settings.fbi_sniper_limit
  local spooc_spawn = 2
  
  local access_type_all = {
		acrobatic = true,
		walk = true
	}
  
  if AlvasMod and AlvasMod.settings.en_elite_ultra then
    dozerspawn = 5
    spooc_spawn = 3
    if AlvasMod.settings.spawn_delay < 4 then
      AlvasMod.settings.spawn_delay = 5
    end
  end
  
  self.special_unit_spawn_limits = {
		shield = 10,
		medic = 5,
		taser = 1,
		tank = dozerspawn,
		spooc = spooc_spawn,
    sniper = sniperlimit
	}
  
  self.unit_categories.marshal_marksman = {
		access = access_type_all,
		unit_types = {
			america = {
				Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2")
			},
			russia = {
				Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2")
			},
			zombie = {
				Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2")
			},
			murkywater = {
				Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2")
			},
			federales = {
				Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2")
			}
		}
	}
        
  self.unit_categories.FBI_groundsniper = {
			special_type = "sniper",
			unit_types = {
				america = {
          Idstring("units/payday2/characters/ene_sniper_1/ene_sniper_1"),
					Idstring("units/payday2/characters/ene_sniper_2/ene_sniper_2")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_sniper_svd_snp/ene_akan_cs_swat_sniper_svd_snp")
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_sniper_hvh_2/ene_sniper_hvh_2")
				},
				murkywater = {
					Idstring("units/pd2_dlc_bph/characters/ene_murkywater_sniper/ene_murkywater_sniper")
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_sniper/ene_swat_policia_sniper")
				}
			},
			access = access_type_all
  }
  
  self.unit_categories.spooc = {
			special_type = "spooc",
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_spook_1/ene_spook_1")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_spooc_asval_smg/ene_akan_fbi_spooc_asval_smg")
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_spook_hvh_1/ene_spook_hvh_1")
				},
				murkywater = {
					Idstring("units/pd2_dlc_bph/characters/ene_murkywater_cloaker/ene_murkywater_cloaker")
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_cloaker_policia_federale/ene_swat_cloaker_policia_federale")
				}
			},
			access = access_type_all
		}
  
    self.unit_categories.CS_cop_C45_R870 = {
		access = access_type_all,
		unit_types = {
			america = {
				Idstring("units/payday2/characters/ene_cop_3/ene_cop_3"),
				Idstring("units/payday2/characters/ene_cop_4/ene_cop_4")
			},
			russia = {
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_r870/ene_akan_cs_cop_r870")
			},
			zombie = {
				Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_1/ene_cop_hvh_1"),
				Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_3/ene_cop_hvh_3"),
				Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_4/ene_cop_hvh_4")
			},
			murkywater = {
				Idstring("units/payday2/characters/ene_cop_1/ene_cop_1"),
				Idstring("units/payday2/characters/ene_cop_3/ene_cop_3"),
				Idstring("units/payday2/characters/ene_cop_4/ene_cop_4")
			},
			federales = {
				Idstring("units/payday2/characters/ene_cop_1/ene_cop_1"),
				Idstring("units/payday2/characters/ene_cop_3/ene_cop_3"),
				Idstring("units/payday2/characters/ene_cop_4/ene_cop_4")
			}
		}
	}
  
  
  self.unit_categories.FBI_tank.unit_types = {
		america = {
			Idstring("units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"),
			Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic"),
      Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun/ene_bulldozer_minigun"),
      Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic")
		},
		russia = {
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_r870/ene_akan_fbi_tank_r870"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_saiga/ene_akan_fbi_tank_saiga"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_rpk_lmg/ene_akan_fbi_tank_rpk_lmg"),
			Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic"),
			Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun/ene_bulldozer_minigun")
		},
		zombie = {
			Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_1/ene_bulldozer_hvh_1"),
			Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_1/ene_bulldozer_hvh_1"),
			Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_1/ene_bulldozer_hvh_1"),
			Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic"),
			Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun/ene_bulldozer_minigun")
		},
		murkywater = {
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_1/ene_murkywater_bulldozer_1"),
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_2/ene_murkywater_bulldozer_2"),
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_3/ene_murkywater_bulldozer_3"),
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_4/ene_murkywater_bulldozer_4"),
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_medic/ene_murkywater_bulldozer_medic")
		},
		federales = {
			Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_r870/ene_swat_dozer_policia_federale_r870"),
			Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_saiga/ene_swat_dozer_policia_federale_saiga"),
			Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_m249/ene_swat_dozer_policia_federale_m249"),
			Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_minigun/ene_swat_dozer_policia_federale_minigun"),
			Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_medic_policia_federale/ene_swat_dozer_medic_policia_federale")
		}
	}
  
  if AlvasMod.settings.en_elite_ultra then
--    table.insert(self.unit_categories.FBI_tank.unit_types.america, Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer"))
--        table.insert(self.unit_categories.FBI_tank.unit_types.america, Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"))
--            table.insert(self.unit_categories.FBI_tank.unit_types.america, Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3"))
    
  end
  
  

    
  self.unit_categories.FBI_swat_M4.unit_types.america = {
			Idstring("units/payday2/characters/ene_swat_1/ene_swat_1"),
			Idstring("units/payday2/characters/ene_swat_1/ene_swat_1"),
			Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
			Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
			Idstring("units/payday2/characters/ene_city_swat_1/ene_city_swat_1"),
			Idstring("units/payday2/characters/ene_city_swat_3/ene_city_swat_3"),
      Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3")

		}
		self.unit_categories.FBI_swat_R870.unit_types.america = {
			Idstring("units/payday2/characters/ene_swat_2/ene_swat_2"),
			Idstring("units/payday2/characters/ene_swat_2/ene_swat_2"),
			Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
			Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
			Idstring("units/payday2/characters/ene_city_swat_2/ene_city_swat_2"),
			Idstring("units/payday2/characters/ene_city_swat_r870/ene_city_swat_r870")
		}
		self.unit_categories.FBI_heavy_G36.unit_types.america = {
			Idstring("units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"),
			Idstring("units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"),
			Idstring("units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36")

		}
		self.unit_categories.FBI_heavy_R870.unit_types.america = {
			Idstring("units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"),
			Idstring("units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
			Idstring("units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870")
		}
		self.unit_categories.FBI_shield.unit_types.america = {
			Idstring("units/payday2/characters/ene_shield_1/ene_shield_1"),
			Idstring("units/payday2/characters/ene_shield_2/ene_shield_2"),
			Idstring("units/payday2/characters/ene_city_shield/ene_city_shield")
		}
  
  if AlvasMod.settings.en_elite_ultra then
--    table.insert(self.unit_categories.FBI_swat_M4.unit_types.america, Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"))
--    table.insert(self.unit_categories.FBI_heavy_G36.unit_types.america, Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"))
--    table.insert(self.unit_categories.CS_heavy_M4.unit_types.america, Idstring("units/pd2_dlc_drm/characters/ene_zeal_swat_heavy_sniper/ene_zeal_swat_heavy_sniper"))
--		table.insert(self.unit_categories.CS_heavy_R870.unit_types.america, Idstring("units/pd2_dlc_drm/characters/ene_zeal_swat_heavy_sniper/ene_zeal_swat_heavy_sniper"))
--		table.insert(self.unit_categories.FBI_heavy_G36.unit_types.america, Idstring("units/pd2_dlc_drm/characters/ene_zeal_swat_heavy_sniper/ene_zeal_swat_heavy_sniper"))
--		table.insert(self.unit_categories.FBI_heavy_R870.unit_types.america, Idstring("units/pd2_dlc_drm/characters/ene_zeal_swat_heavy_sniper/ene_zeal_swat_heavy_sniper"))
  end
  
  
  for faction in pairs(self.unit_categories.marshal_marksman.unit_types) do
		if not disabled_factions[faction] then
			self.unit_categories.marshal_marksman.unit_types[faction] = {
        Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_1/ene_male_marshal_marksman_1"),
				Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2")
			}
		end
	end

--	for faction in pairs(self.unit_categories.marshal_shield.unit_types) do
--		if not disabled_factions[faction] then
--			self.unit_categories.marshal_shield.unit_types[faction] = {
--				Idstring("units/pd2_dlc_usm2/characters/ene_male_marshal_shield_2/ene_male_marshal_shield_2")
--			}
--		end
--	end
  
end)

Hooks:PostHook(GroupAITweakData, "init", "dwe_grouptweak_init", function(self, tweak_data)
    if not AlvasMod then return end
    self.ai_tick_rate = 0.0083333333333
end)



Hooks:PostHook(GroupAITweakData, "_init_task_data", "dwe_init_task_data", function(self, difficulty_index, difficulty)
   if not AlvasMod then return end
   
   local cloakerFrequency = 0
   
    if AlvasMod.settings.en_cloaker then
      cloakerFrequency = 0.15
    end
    
      
    if AlvasMod.settings.assault_team_size == 1 then
      	self.besiege.assault.force = {
          16,	--14
          16,	--16
          16	--18
        }
    elseif AlvasMod.settings.assault_team_size == 2 then
            	self.besiege.assault.force = {
          24,	--14
          24,	--16
          24	--18
        }
    else
            	self.besiege.assault.force = {
          32,	--14
          32,	--16
          32	--18
        }
    end
  
  local poolvalue = AlvasMod.settings.assault_pool
  
  self.besiege.assault.force_pool = {
			poolvalue,--150
			poolvalue,--175
			poolvalue	--225
  }
  
  self.besiege.regroup.duration = {
		2,
		2,
		2
	}
  
  self.besiege.assault.delay = {
			2,
			2,
			2
  }
  
  self.besiege.reenforce.interval = {
		1,
		1,
		1
	}
  
  self.besiege.assault.hostage_hesitation_delay = {
			5,
			5,
			5
  }
  
self.besiege.assault.groups = {
      
			tac_swat_shotgun_rush = {
				0.18,
				0.18,
				0.18
			},
			tac_swat_shotgun_flank = {
				0.18,
				0.18,
				0.18
			},
			tac_swat_rifle = {
				0.18,
				0.18,
				0.18
			},
			tac_swat_rifle_flank = {
				0.18,
				0.18,
				0.18
			},
			tac_shield_wall_ranged = {
				0.03,
				0.03,
				0.03
			},
			tac_shield_wall_charge = {
				0.20,
				0.20,
				0.20
			},
			tac_shield_wall = {
				0.20,
				0.20,
				0.20
			},
			tac_tazer_flanking = {
				0.15,
				0.15,
				0.15
			},
			tac_tazer_charge = {
				0.15,
				0.15,
				0.15
			},
			tac_bull_rush = {
				0.10,
				0.10,
				0.10
			},
      
      single_spooc = {
				0.25,
				0.25,
				0.25
			}
      
		}
    
    self.besiege.assault.groups.tac_sniper = {
			0.25,
			0.25,
			0.25
    }
    
    self.besiege.assault.groups.marshal_squad = {
      0.25,
      0.25,
      0.25
    }
    
      
    if AlvasMod.settings.en_cloakers == true then
      self.besiege.assault.groups.FBI_spoocs = {
				0.15,
				0.15,
				0.15
			}
    else
            self.besiege.assault.groups.FBI_spoocs = {
				0,
				0,
				0
			}
    end
    
    
end)


function GroupAITweakData:_i_e_s_g(difficulty_index)
	self.enemy_spawn_groups = {}

	if difficulty_index <= DIFF_ID_2_NORMAL then
		self.enemy_spawn_groups.tac_swat_rifle_flank = {
			amount = {
				3,
				3
			},
			spawn = {
				{
					amount_min = 2,
					freq = 1,
					amount_max = 2,
					rank = 2,
					unit = "CS_swat_MP5",
					tactics = self._tactics.swat_rifle_flank
				},
				{
					amount_min = 1,
					freq = 1,
					amount_max = 1,
					rank = 3,
					unit = "CS_heavy_M4",
					tactics = self._tactics.swat_rifle_flank
				}
			}
		}
	elseif difficulty_index == DIFF_ID_3_HARD then
		self.enemy_spawn_groups.tac_swat_rifle_flank = {
			amount = {
				4,
				4
			},
			spawn = {
				{
					amount_min = 2,
					freq = 1,
					amount_max = 2,
					rank = 2,
					unit = "CS_swat_MP5",
					tactics = self._tactics.swat_rifle_flank
				},
				{
					amount_min = 2,
					freq = 1,
					amount_max = 2,
					rank = 3,
					unit = "CS_heavy_M4",
					tactics = self._tactics.swat_rifle_flank
				}
			}
		}
	elseif difficulty_index == DIFF_ID_4_VERYHARD then
		self.enemy_spawn_groups.tac_swat_rifle_flank = {
			amount = {
				4,
				4
			},
			spawn = {
				{
					amount_min = 3,
					freq = 1,
					amount_max = 3,
					rank = 2,
					unit = "FBI_swat_M4",
					tactics = self._tactics.swat_rifle_flank
				},
				{
					amount_min = 1,
					freq = 1,
					amount_max = 1,
					rank = 3,
					unit = "FBI_heavy_G36",
					tactics = self._tactics.swat_rifle_flank
				}
			}
		}
	elseif difficulty_index == DIFF_ID_5_OVERKILL then
		self.enemy_spawn_groups.tac_swat_rifle_flank = {
			amount = {
				4,
				5
			},
			spawn = {
				{
					amount_min = 2,
					freq = 2,
					amount_max = 2,
					rank = 2,
					unit = "FBI_swat_M4",
					tactics = self._tactics.swat_rifle_flank
				},
				{
					amount_min = 2,
					freq = 2,
					amount_max = 2,
					rank = 3,
					unit = "FBI_heavy_G36",
					tactics = self._tactics.swat_rifle_flank
				},
				{
					amount_min = 0,
					freq = 0.2,
					amount_max = 1,
					rank = 2,
					unit = "medic_M4",
					tactics = self._tactics.swat_rifle_flank
				}
			}
		}
	elseif difficulty_index == DIFF_ID_6_MAYHEM then
		self.enemy_spawn_groups.tac_swat_rifle_flank = {
			amount = {
				4,
				5
			},
			spawn = {
				{
					amount_min = 3,
					freq = 3,
					amount_max = 3,
					rank = 2,
					unit = "FBI_swat_M4",
					tactics = self._tactics.swat_rifle_flank
				},
				{
					amount_min = 1,
					freq = 1,
					amount_max = 1,
					rank = 3,
					unit = "FBI_heavy_G36",
					tactics = self._tactics.swat_rifle_flank
				},
				{
					amount_min = 0,
					freq = 0.35,
					amount_max = 1,
					rank = 2,
					unit = "medic_M4",
					tactics = self._tactics.swat_rifle_flank
				}
			}
		}
	elseif difficulty_index == DIFF_ID_7_DEATHWISH then
		self.enemy_spawn_groups.tac_swat_rifle_flank = {
			amount = {
				4,
				5
			},
			spawn = {
				{
					amount_min = 2,
					freq = 2,
					amount_max = 2,
					rank = 2,
					unit = "FBI_swat_M4",
					tactics = self._tactics.swat_rifle_flank
				},
				{
					amount_min = 2,
					freq = 2,
					amount_max = 2,
					rank = 3,
					unit = "FBI_heavy_G36",
					tactics = self._tactics.swat_rifle_flank
				},
				{
					amount_min = 0,
					freq = 0.35,
					amount_max = 1,
					rank = 2,
					unit = "medic_M4",
					tactics = self._tactics.swat_rifle_flank
				}
			}
		}
	else
		self.enemy_spawn_groups.tac_swat_rifle_flank = {
			amount = {
				4,
				5
			},
			spawn = {
				{
					amount_min = 1,
					freq = 1,
					amount_max = 1,
					rank = 2,
					unit = "FBI_swat_M4",
					tactics = self._tactics.swat_rifle_flank
				},
				{
					amount_min = 3,
					freq = 3,
					amount_max = 3,
					rank = 3,
					unit = "FBI_heavy_G36",
					tactics = self._tactics.swat_rifle_flank
				},
				{
					amount_min = 0,
					freq = 0.35,
					amount_max = 1,
					rank = 2,
					unit = "medic_M4",
					tactics = self._tactics.swat_rifle_flank
				}
			}
		}
	end

	if difficulty_index <= DIFF_ID_2_NORMAL then
		self.enemy_spawn_groups.tac_shield_wall_ranged = {
			amount = {
				4,
				4
			},
			spawn = {
				{
					amount_min = 2,
					freq = 1,
					amount_max = 2,
					rank = 2,
					unit = "CS_swat_MP5",
					tactics = self._tactics.shield_support_ranged
				},
				{
					amount_min = 2,
					freq = 1,
					amount_max = 2,
					rank = 3,
					unit = "CS_shield",
					tactics = self._tactics.shield_wall_ranged
				}
			}
		}
	elseif difficulty_index == DIFF_ID_3_HARD then
		self.enemy_spawn_groups.tac_shield_wall_ranged = {
			amount = {
				4,
				4
			},
			spawn = {
				{
					amount_min = 2,
					freq = 1,
					amount_max = 2,
					rank = 2,
					unit = "CS_heavy_M4",
					tactics = self._tactics.shield_support_ranged
				},
				{
					amount_min = 2,
					freq = 1,
					amount_max = 2,
					rank = 3,
					unit = "CS_shield",
					tactics = self._tactics.shield_wall_ranged
				}
			}
		}
	elseif difficulty_index == DIFF_ID_4_VERYHARD then
		self.enemy_spawn_groups.tac_shield_wall_ranged = {
			amount = {
				4,
				4
			},
			spawn = {
				{
					amount_min = 2,
					freq = 1,
					amount_max = 2,
					rank = 2,
					unit = "FBI_swat_M4",
					tactics = self._tactics.shield_support_ranged
				},
				{
					amount_min = 2,
					freq = 1,
					amount_max = 2,
					rank = 3,
					unit = "FBI_shield",
					tactics = self._tactics.shield_wall_ranged
				}
			}
		}
	elseif difficulty_index == DIFF_ID_5_OVERKILL then
		self.enemy_spawn_groups.tac_shield_wall_ranged = {
			amount = {
				4,
				5
			},
			spawn = {
				{
					amount_min = 2,
					freq = 2,
					amount_max = 2,
					rank = 2,
					unit = "FBI_heavy_G36",
					tactics = self._tactics.shield_support_ranged
				},
				{
					amount_min = 2,
					freq = 2,
					amount_max = 2,
					rank = 3,
					unit = "FBI_shield",
					tactics = self._tactics.shield_wall_ranged
				},
				{
					amount_min = 0,
					freq = 0.2,
					amount_max = 1,
					rank = 2,
					unit = "medic_M4",
					tactics = self._tactics.shield_support_charge
				}
			}
		}
	elseif difficulty_index == DIFF_ID_6_MAYHEM then
		self.enemy_spawn_groups.tac_shield_wall_ranged = {
			amount = {
				4,
				5
			},
			spawn = {
				{
					amount_min = 2,
					freq = 2,
					amount_max = 2,
					rank = 2,
					unit = "FBI_swat_M4",
					tactics = self._tactics.shield_support_ranged
				},
				{
					amount_min = 2,
					freq = 2,
					amount_max = 2,
					rank = 3,
					unit = "FBI_shield",
					tactics = self._tactics.shield_wall_ranged
				},
				{
					amount_min = 0,
					freq = 0.35,
					amount_max = 1,
					rank = 2,
					unit = "medic_M4",
					tactics = self._tactics.shield_support_charge
				}
			}
		}
	elseif difficulty_index == DIFF_ID_7_DEATHWISH then
		self.enemy_spawn_groups.tac_shield_wall_ranged = {
			amount = {
				4,
				5
			},
			spawn = {
				{
					amount_min = 2,
					freq = 2,
					amount_max = 2,
					rank = 2,
					unit = "FBI_heavy_G36",
					tactics = self._tactics.shield_support_ranged
				},
				{
					amount_min = 2,
					freq = 2,
					amount_max = 2,
					rank = 3,
					unit = "FBI_shield",
					tactics = self._tactics.shield_wall_ranged
				},
				{
					amount_min = 0,
					freq = 0.35,
					amount_max = 1,
					rank = 2,
					unit = "medic_M4",
					tactics = self._tactics.shield_support_charge
				}
			}
		}
	else
		self.enemy_spawn_groups.tac_shield_wall_ranged = {
			amount = {
				4,
				5
			},
			spawn = {
				{
					amount_min = 2,
					freq = 2,
					amount_max = 2,
					rank = 2,
					unit = "FBI_heavy_G36",
					tactics = self._tactics.shield_support_ranged
				},
				{
					amount_min = 2,
					freq = 2,
					amount_max = 2,
					rank = 3,
					unit = "FBI_shield",
					tactics = self._tactics.shield_wall_ranged
				},
				{
					amount_min = 0,
					freq = 0.5,
					amount_max = 1,
					rank = 2,
					unit = "medic_M4",
					tactics = self._tactics.shield_support_charge
				}
			}
		}
	end

	if difficulty_index <= DIFF_ID_2_NORMAL then
		self.enemy_spawn_groups.tac_shield_wall_charge = {
			amount = {
				4,
				4
			},
			spawn = {
				{
					amount_min = 2,
					freq = 1,
					amount_max = 2,
					rank = 2,
					unit = "CS_swat_R870",
					tactics = self._tactics.shield_support_charge
				},
				{
					amount_min = 2,
					freq = 1,
					amount_max = 2,
					rank = 3,
					unit = "CS_shield",
					tactics = self._tactics.shield_wall_charge
				}
			}
		}
	elseif difficulty_index == DIFF_ID_3_HARD then
		self.enemy_spawn_groups.tac_shield_wall_charge = {
			amount = {
				4,
				4
			},
			spawn = {
				{
					amount_min = 2,
					freq = 1,
					amount_max = 2,
					rank = 2,
					unit = "CS_heavy_R870",
					tactics = self._tactics.shield_support_charge
				},
				{
					amount_min = 2,
					freq = 1,
					amount_max = 2,
					rank = 3,
					unit = "CS_shield",
					tactics = self._tactics.shield_wall_charge
				}
			}
		}
	elseif difficulty_index == DIFF_ID_4_VERYHARD then
		self.enemy_spawn_groups.tac_shield_wall_charge = {
			amount = {
				4,
				4
			},
			spawn = {
				{
					amount_min = 2,
					freq = 1,
					amount_max = 2,
					rank = 2,
					unit = "FBI_swat_R870",
					tactics = self._tactics.shield_support_charge
				},
				{
					amount_min = 2,
					freq = 1,
					amount_max = 2,
					rank = 3,
					unit = "FBI_shield",
					tactics = self._tactics.shield_wall_charge
				}
			}
		}
	elseif difficulty_index == DIFF_ID_5_OVERKILL then
		self.enemy_spawn_groups.tac_shield_wall_charge = {
			amount = {
				4,
				5
			},
			spawn = {
				{
					amount_min = 2,
					freq = 2,
					amount_max = 2,
					rank = 2,
					unit = "FBI_heavy_R870",
					tactics = self._tactics.shield_support_charge
				},
				{
					amount_min = 2,
					freq = 2,
					amount_max = 2,
					rank = 3,
					unit = "FBI_shield",
					tactics = self._tactics.shield_wall_charge
				},
				{
					amount_min = 0,
					freq = 0.2,
					amount_max = 1,
					rank = 2,
					unit = "medic_R870",
					tactics = self._tactics.shield_support_charge
				}
			}
		}
	elseif difficulty_index == DIFF_ID_6_MAYHEM then
		self.enemy_spawn_groups.tac_shield_wall_charge = {
			amount = {
				4,
				5
			},
			spawn = {
				{
					amount_min = 2,
					freq = 2,
					amount_max = 2,
					rank = 2,
					unit = "FBI_swat_R870",
					tactics = self._tactics.shield_support_charge
				},
				{
					amount_min = 2,
					freq = 2,
					amount_max = 2,
					rank = 3,
					unit = "FBI_shield",
					tactics = self._tactics.shield_wall_charge
				},
				{
					amount_min = 0,
					freq = 0.35,
					amount_max = 1,
					rank = 2,
					unit = "medic_R870",
					tactics = self._tactics.shield_support_charge
				}
			}
		}
	elseif difficulty_index == DIFF_ID_7_DEATHWISH then
		self.enemy_spawn_groups.tac_shield_wall_charge = {
			amount = {
				4,
				5
			},
			spawn = {
				{
					amount_min = 2,
					freq = 2,
					amount_max = 2,
					rank = 2,
					unit = "FBI_heavy_R870",
					tactics = self._tactics.shield_support_charge
				},
				{
					amount_min = 2,
					freq = 2,
					amount_max = 2,
					rank = 3,
					unit = "FBI_shield",
					tactics = self._tactics.shield_wall_charge
				},
				{
					amount_min = 0,
					freq = 0.35,
					amount_max = 1,
					rank = 2,
					unit = "medic_R870",
					tactics = self._tactics.shield_support_charge
				}
			}
		}
	else
		self.enemy_spawn_groups.tac_shield_wall_charge = {
			amount = {
				4,
				5
			},
			spawn = {
				{
					amount_min = 2,
					freq = 2,
					amount_max = 2,
					rank = 2,
					unit = "FBI_heavy_R870",
					tactics = self._tactics.shield_support_charge
				},
				{
					amount_min = 2,
					freq = 2,
					amount_max = 2,
					rank = 3,
					unit = "FBI_shield",
					tactics = self._tactics.shield_wall_charge
				},
				{
					amount_min = 0,
					freq = 0.5,
					amount_max = 1,
					rank = 2,
					unit = "medic_R870",
					tactics = self._tactics.shield_support_charge
				}
			}
		}
	end

	if difficulty_index <= DIFF_ID_4_VERYHARD then
		self.enemy_spawn_groups.tac_shield_wall = {
			amount = {
				4,
				4
			},
			spawn = {
				{
					amount_min = 4,
					freq = 1,
					amount_max = 4,
					rank = 3,
					unit = "FBI_shield",
					tactics = self._tactics.shield_wall
				}
			}
		}
	elseif difficulty_index == DIFF_ID_5_OVERKILL then
		self.enemy_spawn_groups.tac_shield_wall = {
			amount = {
				4,
				5
			},
			spawn = {
				{
					amount_min = 4,
					freq = 4,
					amount_max = 4,
					rank = 3,
					unit = "FBI_shield",
					tactics = self._tactics.shield_wall
				},
				{
					amount_min = 0,
					freq = 0.2,
					amount_max = 1,
					rank = 3,
					unit = "medic_M4",
					tactics = self._tactics.shield_wall
				}
			}
		}
	elseif difficulty_index == DIFF_ID_6_MAYHEM then
		self.enemy_spawn_groups.tac_shield_wall = {
			amount = {
				4,
				5
			},
			spawn = {
				{
					amount_min = 4,
					freq = 4,
					amount_max = 4,
					rank = 3,
					unit = "FBI_shield",
					tactics = self._tactics.shield_wall
				},
				{
					amount_min = 0,
					freq = 0.35,
					amount_max = 1,
					rank = 3,
					unit = "medic_M4",
					tactics = self._tactics.shield_wall
				}
			}
		}
	elseif difficulty_index == DIFF_ID_7_DEATHWISH then
		self.enemy_spawn_groups.tac_shield_wall = {
			amount = {
				4,
				5
			},
			spawn = {
				{
					amount_min = 4,
					freq = 4,
					amount_max = 4,
					rank = 3,
					unit = "FBI_shield",
					tactics = self._tactics.shield_wall
				},
				{
					amount_min = 0,
					freq = 0.35,
					amount_max = 1,
					rank = 3,
					unit = "medic_M4",
					tactics = self._tactics.shield_wall
				}
			}
		}
	else
		self.enemy_spawn_groups.tac_shield_wall = {
			amount = {
				4,
				5
			},
			spawn = {
				{
					amount_min = 4,
					freq = 4,
					amount_max = 4,
					rank = 3,
					unit = "FBI_shield",
					tactics = self._tactics.shield_wall
				},
				{
					amount_min = 0,
					freq = 0.5,
					amount_max = 1,
					rank = 3,
					unit = "medic_M4",
					tactics = self._tactics.shield_wall
				}
			}
		}
	end

	if difficulty_index <= DIFF_ID_6_MAYHEM then
		self.enemy_spawn_groups.tac_tazer_flanking = {
			amount = {
				1,
				1
			},
			spawn = {
				{
					amount_min = 1,
					freq = 1,
					amount_max = 1,
					rank = 3,
					unit = "CS_tazer",
					tactics = self._tactics.tazer_flanking
				}
			}
		}
	else
		self.enemy_spawn_groups.tac_tazer_flanking = {
			amount = {
				6,
				6
			},
			spawn = {
				{
					amount_min = 2,
					freq = 1,
					amount_max = 2,
					rank = 3,
					unit = "CS_tazer",
					tactics = self._tactics.tazer_flanking
				},
				{
					amount_min = 1,
					freq = 1,
					amount_max = 1,
					rank = 2,
					unit = "FBI_swat_M4",
					tactics = self._tactics.swat_rifle_flank
				},
				{
					amount_min = 3,
					freq = 3,
					amount_max = 3,
					rank = 3,
					unit = "FBI_heavy_G36",
					tactics = self._tactics.swat_rifle_flank
				}
			}
		}
	end

	if difficulty_index <= DIFF_ID_6_MAYHEM then
		self.enemy_spawn_groups.tac_tazer_charge = {
			amount = {
				1,
				1
			},
			spawn = {
				{
					amount_min = 1,
					freq = 1,
					amount_max = 1,
					rank = 3,
					unit = "CS_tazer",
					tactics = self._tactics.tazer_charge
				}
			}
		}
	else
		self.enemy_spawn_groups.tac_tazer_charge = {
			amount = {
				6,
				6
			},
			spawn = {
				{
					amount_min = 2,
					freq = 1,
					amount_max = 2,
					rank = 3,
					unit = "CS_tazer",
					tactics = self._tactics.tazer_charge
				},
				{
					amount_min = 1,
					freq = 1,
					amount_max = 1,
					rank = 2,
					unit = "FBI_swat_M4",
					tactics = self._tactics.swat_rifle_flank
				},
				{
					amount_min = 3,
					freq = 3,
					amount_max = 3,
					rank = 3,
					unit = "FBI_heavy_G36",
					tactics = self._tactics.swat_rifle_flank
				}
			}
		}
	end

	if difficulty_index <= DIFF_ID_6_MAYHEM then
		self.enemy_spawn_groups.tac_bull_rush = {
			amount = {
				1,
				1
			},
			spawn = {
				{
					amount_min = 1,
					freq = 1,
					amount_max = 1,
					rank = 3,
					unit = "FBI_tank",
					tactics = self._tactics.tank_rush
				}
			}
		}
	else
		self.enemy_spawn_groups.tac_bull_rush = {
			amount = {
				6,
				6
			},
			spawn = {
				{
					amount_min = 2,
					rank = 3,
					amount_max = 2,
					freq = 1,
					unit = "FBI_tank",
					tactics = self._tactics.tank_rush
				},
				{
					amount_min = 1,
					freq = 1,
					amount_max = 1,
					rank = 2,
					unit = "FBI_swat_M4",
					tactics = self._tactics.swat_rifle_flank
				},
				{
					amount_min = 3,
					freq = 3,
					amount_max = 3,
					rank = 3,
					unit = "FBI_heavy_G36",
					tactics = self._tactics.swat_rifle_flank
				}
			}
		}
	end

	self.enemy_spawn_groups.Phalanx = {
		amount = {
			self.phalanx.minions.amount + 1,
			self.phalanx.minions.amount + 1
		},
		spawn = {

			{
				freq = 1,
				amount_min = 1,
				rank = 1,
				unit = "Phalanx_minion",
				tactics = self._tactics.Phalanx_minion
			}
		}
	}
	self.enemy_spawn_groups.single_spooc = {
		amount = {
			1,
			1
		},
		spawn = {
			{
				freq = 1,
				amount_min = 1,
				rank = 1,
				unit = "spooc",
				tactics = self._tactics.spooc
			}
		}
	}
	self.enemy_spawn_groups.FBI_spoocs = self.enemy_spawn_groups.single_spooc
	self.enemy_spawn_groups.snowman_boss = {
		amount = {
			1,
			1
		},
		spawn = {
			{
				freq = 1,
				amount_min = 1,
				rank = 1,
				unit = "snowman_boss",
				tactics = self._tactics.tank_rush
			}
		},
		spawn_point_chk_ref = table.list_to_set({
			"tac_bull_rush"
		})
	}
	self.enemy_spawn_groups.piggydozer = {
		amount = {
			1,
			1
		},
		spawn = {
			{
				freq = 1,
				amount_min = 1,
				rank = 1,
				unit = "piggydozer",
				tactics = self._tactics.tank_rush
			}
		},
		spawn_point_chk_ref = table.list_to_set({
			"tac_bull_rush"
		})
	}
end

function GroupAITweakData:_i_e_s_g_l(tweak_data, difficulty_index)
	local lvl_tweak_data = tweak_data.levels[Global.game_settings and Global.game_settings.level_id or Global.level_data and Global.level_data.level_id]

	if lvl_tweak_data and lvl_tweak_data.ai_unit_group_overrides then
		local unit_types = nil

		for unit_type, faction_type_data in pairs(lvl_tweak_data.ai_unit_group_overrides) do
			unit_types = self.unit_categories[unit_type] and self.unit_categories[unit_type].unit_types

			if unit_types then
				for faction_type, override in pairs(faction_type_data) do
					if unit_types[faction_type] then
						unit_types[faction_type] = override
					end
				end
			end
		end
	end

	if lvl_tweak_data and not lvl_tweak_data.ai_marshal_spawns_disabled and DIFF_ID_5_OVERKILL <= difficulty_index then
		local marshal_squad = {
			amount = {
				2,
				2
			},
			spawn = {
				{
					respawn_cooldown = 30,
					amount_min = 1,
					rank = 2,
					freq = 1,
					unit = "marshal_shield",
					tactics = self._tactics.marshal_shield
				},
				{
					respawn_cooldown = 30,
					amount_min = 1,
					rank = 1,
					freq = 1,
					unit = "marshal_marksman",
					tactics = self._tactics.marshal_marksman
				}
			},
			spawn_point_chk_ref = table.list_to_set({
				"tac_shield_wall",
				"tac_shield_wall_ranged",
				"tac_shield_wall_charge"
			})
		}
		self.enemy_spawn_groups.marshal_squad = marshal_squad

		if difficulty_index <= DIFF_ID_5_OVERKILL then
			print("[MARSHAL_BALANCE] Overkill")

			marshal_squad.spawn_cooldown = 90
			marshal_squad.max_nr_simultaneous_groups = 1
			marshal_squad.initial_spawn_delay = 540
		elseif difficulty_index == DIFF_ID_6_MAYHEM then
			print("[MARSHAL_BALANCE] Mayhem")

			marshal_squad.spawn_cooldown = 75
			marshal_squad.max_nr_simultaneous_groups = 1
			marshal_squad.initial_spawn_delay = 480
		elseif DIFF_ID_7_DEATHWISH <= difficulty_index then
			print("[MARSHAL_BALANCE] Deathwish+")

			marshal_squad.spawn_cooldown = 60
			marshal_squad.max_nr_simultaneous_groups = 2
			marshal_squad.initial_spawn_delay = 480
		end

		if lvl_tweak_data.ai_marshal_spawns_fast then
			local min_spawn_delay = 60
			marshal_squad.initial_spawn_delay = math.max(min_spawn_delay, marshal_squad.initial_spawn_delay * 0.25)
		end
	end
end

function GroupAITweakData:_i_u_c(difficulty_index)
	local access_type_walk_only = {
		walk = true
	}
	local access_type_all = {
		acrobatic = true,
		walk = true
	}

	if difficulty_index <= DIFF_ID_2_NORMAL then
		self.special_unit_spawn_limits = {
			shield = 2,
			medic = 3,
			taser = 1,
			tank = 1,
			spooc = 0
		}
	elseif difficulty_index == DIFF_ID_3_HARD then
		self.special_unit_spawn_limits = {
			shield = 4,
			medic = 3,
			taser = 2,
			tank = 2,
			spooc = 0
		}
	elseif difficulty_index == DIFF_ID_4_VERYHARD then
		self.special_unit_spawn_limits = {
			shield = 4,
			medic = 3,
			taser = 2,
			tank = 2,
			spooc = 2
		}
	elseif difficulty_index == DIFF_ID_5_OVERKILL then
		self.special_unit_spawn_limits = {
			shield = 4,
			medic = 3,
			taser = 2,
			tank = 2,
			spooc = 2
		}
	elseif difficulty_index == DIFF_ID_6_MAYHEM then
		self.special_unit_spawn_limits = {
			shield = 4,
			medic = 3,
			taser = 3,
			tank = 2,
			spooc = 2
		}
	elseif difficulty_index == DIFF_ID_7_DEATHWISH then
		self.special_unit_spawn_limits = {
			shield = 4,
			medic = 3,
			taser = 3,
			tank = 2,
			spooc = 2
		}
	elseif difficulty_index == DIFF_ID_8_DEATHSENT then
		self.special_unit_spawn_limits = {
			shield = 4,
			medic = 3,
			taser = 3,
			tank = 3,
			spooc = 2
		}
	else
		self.special_unit_spawn_limits = {
			shield = 8,
			medic = 3,
			taser = 4,
			tank = 2,
			spooc = 2
		}
	end

	self.unit_categories = {
		spooc = {
			special_type = "spooc",
			access = access_type_all,
			unit_types = {
				america = {},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_spooc_asval_smg/ene_akan_fbi_spooc_asval_smg")
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_spook_hvh_1/ene_spook_hvh_1")
				},
				murkywater = {
					Idstring("units/pd2_dlc_bph/characters/ene_murkywater_cloaker/ene_murkywater_cloaker")
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_cloaker_policia_federale/ene_swat_cloaker_policia_federale")
				}
			}
		}
	}

	if difficulty_index == DIFF_ID_8_DEATHSENT then
		table.insert(self.unit_categories.spooc.unit_types.america, Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker"))
	else
		table.insert(self.unit_categories.spooc.unit_types.america, Idstring("units/payday2/characters/ene_spook_1/ene_spook_1"))
	end

	self.unit_categories.CS_cop_C45_R870 = {
		access = access_type_walk_only,
		unit_types = {
			america = {
				Idstring("units/payday2/characters/ene_cop_1/ene_cop_1"),
				Idstring("units/payday2/characters/ene_cop_3/ene_cop_3"),
				Idstring("units/payday2/characters/ene_cop_4/ene_cop_4")
			},
			russia = {
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_r870/ene_akan_cs_cop_r870")
			},
			zombie = {
				Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_1/ene_cop_hvh_1"),
				Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_3/ene_cop_hvh_3"),
				Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_4/ene_cop_hvh_4")
			},
			murkywater = {
				Idstring("units/payday2/characters/ene_cop_1/ene_cop_1"),
				Idstring("units/payday2/characters/ene_cop_3/ene_cop_3"),
				Idstring("units/payday2/characters/ene_cop_4/ene_cop_4")
			},
			federales = {
				Idstring("units/payday2/characters/ene_cop_1/ene_cop_1"),
				Idstring("units/payday2/characters/ene_cop_3/ene_cop_3"),
				Idstring("units/payday2/characters/ene_cop_4/ene_cop_4")
			}
		}
	}
	self.unit_categories.CS_cop_stealth_MP5 = {
		unit_types = {
			america = {
				Idstring("units/payday2/characters/ene_cop_2/ene_cop_2")
			},
			russia = {
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_akmsu_smg/ene_akan_cs_cop_akmsu_smg")
			},
			zombie = {
				Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_2/ene_cop_hvh_2")
			},
			murkywater = {
				Idstring("units/payday2/characters/ene_cop_2/ene_cop_2")
			},
			federales = {
				Idstring("units/payday2/characters/ene_cop_2/ene_cop_2")
			}
		},
		access = access_type_walk_only
	}

	if difficulty_index == DIFF_ID_8_DEATHSENT then
		self.unit_categories.CS_swat_MP5 = {
			access = access_type_all,
			unit_types = {
				america = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass")
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1")
				},
				murkywater = {
					Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light")
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale/ene_swat_policia_federale")
				}
			}
		}
	else
		self.unit_categories.CS_swat_MP5 = {
			access = access_type_all,
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_swat_1/ene_swat_1")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass")
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1")
				},
				murkywater = {
					Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light")
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale/ene_swat_policia_federale")
				}
			}
		}
	end

	if difficulty_index == DIFF_ID_8_DEATHSENT then
		self.unit_categories.CS_swat_R870 = {
			access = access_type_all,
			unit_types = {
				america = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_r870/ene_akan_cs_swat_r870")
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_2/ene_swat_hvh_2")
				},
				murkywater = {
					Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light")
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale/ene_swat_policia_federale")
				}
			}
		}
	else
		self.unit_categories.CS_swat_R870 = {
			access = access_type_all,
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_swat_2/ene_swat_2")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_r870/ene_akan_cs_swat_r870")
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_2/ene_swat_hvh_2")
				},
				murkywater = {
					Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_r870/ene_murkywater_light_r870")
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_r870/ene_swat_policia_federale_r870")
				}
			}
		}
	end

	if difficulty_index == DIFF_ID_8_DEATHSENT then
		self.unit_categories.CS_heavy_M4 = {
			access = access_type_all,
			unit_types = {
				america = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_ak47_ass/ene_akan_cs_heavy_ak47_ass")
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_1/ene_swat_heavy_hvh_1")
				},
				murkywater = {
					Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy/ene_murkywater_heavy")
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale/ene_swat_heavy_policia_federale")
				}
			}
		}
	else
		self.unit_categories.CS_heavy_M4 = {
			access = access_type_all,
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_ak47_ass/ene_akan_cs_heavy_ak47_ass")
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_1/ene_swat_heavy_hvh_1")
				},
				murkywater = {
					Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy/ene_murkywater_heavy")
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale/ene_swat_heavy_policia_federale")
				}
			}
		}
	end

	if difficulty_index == DIFF_ID_8_DEATHSENT then
		self.unit_categories.CS_heavy_M4_w = {
			access = access_type_walk_only,
			unit_types = {
				america = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_ak47_ass/ene_akan_cs_heavy_ak47_ass")
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_1/ene_swat_heavy_hvh_1")
				},
				murkywater = {
					Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy/ene_murkywater_heavy")
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale/ene_swat_heavy_policia_federale")
				}
			}
		}
	else
		self.unit_categories.CS_heavy_M4_w = {
			access = access_type_walk_only,
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_ak47_ass/ene_akan_cs_heavy_ak47_ass")
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_1/ene_swat_heavy_hvh_1")
				},
				murkywater = {
					Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy/ene_murkywater_heavy")
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale/ene_swat_heavy_policia_federale")
				}
			}
		}
	end

	if difficulty_index == DIFF_ID_8_DEATHSENT then
		self.unit_categories.CS_heavy_R870 = {
			access = access_type_all,
			unit_types = {
				america = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_r870/ene_akan_cs_heavy_r870")
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_r870/ene_swat_heavy_hvh_r870")
				},
				murkywater = {
					Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy/ene_murkywater_heavy")
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_r870/ene_swat_heavy_policia_federale_r870")
				}
			}
		}
	else
		self.unit_categories.CS_heavy_R870 = {
			access = access_type_all,
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_r870/ene_akan_cs_heavy_r870")
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_r870/ene_swat_heavy_hvh_r870")
				},
				murkywater = {
					Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_shotgun/ene_murkywater_heavy_shotgun")
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_r870/ene_swat_heavy_policia_federale_r870")
				}
			}
		}
	end

	self.unit_categories.CS_tazer = {
		special_type = "taser",
		access = access_type_all,
		unit_types = {
			america = {},
			russia = {
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass")
			},
			zombie = {
				Idstring("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1")
			},
			murkywater = {
				Idstring("units/pd2_dlc_bph/characters/ene_murkywater_tazer/ene_murkywater_tazer")
			},
			federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale")
			}
		}
	}

	if difficulty_index == DIFF_ID_8_DEATHSENT then
		table.insert(self.unit_categories.CS_tazer.unit_types.america, Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_tazer/ene_zeal_tazer"))
	else
		table.insert(self.unit_categories.CS_tazer.unit_types.america, Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"))
	end

	self.unit_categories.CS_shield = {
		special_type = "shield",
		access = access_type_walk_only,
		unit_types = {
			america = {
				Idstring("units/payday2/characters/ene_shield_2/ene_shield_2")
			},
			russia = {
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_shield_c45/ene_akan_cs_shield_c45")
			},
			zombie = {
				Idstring("units/pd2_dlc_hvh/characters/ene_shield_hvh_2/ene_shield_hvh_2")
			},
			murkywater = {
				Idstring("units/pd2_dlc_bph/characters/ene_murkywater_shield/ene_murkywater_shield")
			},
			federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_c45/ene_swat_shield_policia_federale_c45")
			}
		}
	}
	self.unit_categories.FBI_suit_C45_M4 = {
		access = access_type_all,
		unit_types = {
			america = {
				Idstring("units/payday2/characters/ene_fbi_1/ene_fbi_1"),
				Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2")
			},
			russia = {
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_ak47_ass/ene_akan_cs_cop_ak47_ass"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_ak47_ass/ene_akan_cs_cop_ak47_ass")
			},
			zombie = {
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_1/ene_fbi_hvh_1"),
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2")
			},
			murkywater = {
				Idstring("units/payday2/characters/ene_fbi_1/ene_fbi_1"),
				Idstring("units/payday2/characters/ene_fbi_1/ene_fbi_2")
			},
			federales = {
				Idstring("units/payday2/characters/ene_fbi_1/ene_fbi_1"),
				Idstring("units/payday2/characters/ene_fbi_1/ene_fbi_2")
			}
		}
	}
	self.unit_categories.FBI_suit_M4_MP5 = {
		access = access_type_all,
		unit_types = {
			america = {
				Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
				Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3")
			},
			russia = {
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_asval_smg/ene_akan_cs_cop_asval_smg"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_asval_smg/ene_akan_cs_cop_asval_smg")
			},
			zombie = {
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3")
			},
			murkywater = {
				Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
				Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_3")
			},
			federales = {
				Idstring("units/payday2/characters/ene_fbi_1/ene_fbi_2"),
				Idstring("units/payday2/characters/ene_fbi_1/ene_fbi_3")
			}
		}
	}
	self.unit_categories.FBI_suit_stealth_MP5 = {
		unit_types = {
			america = {
				Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3")
			},
			russia = {
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_asval_smg/ene_akan_cs_cop_asval_smg")
			},
			zombie = {
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3")
			},
			murkywater = {
				Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3")
			},
			federales = {
				Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3")
			}
		},
		access = access_type_all
	}
	local unit_types = {}
	self.unit_categories.FBI_swat_M4 = {
		access = access_type_all,
		unit_types = unit_types
	}

	if difficulty_index <= DIFF_ID_5_OVERKILL then
		unit_types.america = {
			Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1")
		}
		unit_types.russia = {
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass")
		}
		unit_types.zombie = {
			Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1")
		}
		unit_types.murkywater = {
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_fbi/ene_murkywater_light_fbi")
		}
		unit_types.federales = {
			Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi")
		}
	elseif difficulty_index <= DIFF_ID_7_DEATHWISH then
		unit_types.america = {
			Idstring("units/payday2/characters/ene_city_swat_1/ene_city_swat_1")
		}
		unit_types.russia = {
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass/ene_akan_fbi_swat_dw_ak47_ass")
		}
		unit_types.zombie = {
			Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1")
		}
		unit_types.murkywater = {
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_city/ene_murkywater_light_city")
		}
		unit_types.federales = {
			Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city/ene_swat_policia_federale_city")
		}
	else
		unit_types.america = {
			Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat")
		}
		unit_types.russia = {
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass/ene_akan_fbi_swat_dw_ak47_ass")
		}
		unit_types.zombie = {
			Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1")
		}
		unit_types.murkywater = {
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light")
		}
		unit_types.federales = {
			Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale/ene_swat_policia_federale")
		}
	end

	local unit_types = {}
	self.unit_categories.FBI_swat_R870 = {
		access = access_type_all,
		unit_types = unit_types
	}

	if difficulty_index < DIFF_ID_6_MAYHEM then
		unit_types.america = {
			Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2")
		}
		unit_types.russia = {
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_r870/ene_akan_fbi_swat_r870")
		}
		unit_types.zombie = {
			Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_2/ene_fbi_swat_hvh_2")
		}
		unit_types.murkywater = {
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_r870/ene_murkywater_light_r870")
		}
		unit_types.federales = {
			Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_r870/ene_swat_policia_federale_r870")
		}
	elseif difficulty_index < DIFF_ID_8_DEATHSENT then
		unit_types.america = {
			Idstring("units/payday2/characters/ene_city_swat_r870/ene_city_swat_r870")
		}
		unit_types.russia = {
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_r870/ene_akan_fbi_swat_dw_r870")
		}
		unit_types.zombie = {
			Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_2/ene_fbi_swat_hvh_2")
		}
		unit_types.murkywater = {
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_city_r870/ene_murkywater_light_city_r870")
		}
		unit_types.federales = {
			Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city_r870/ene_swat_policia_federale_city_r870")
		}
	else
		unit_types.america = {
			Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat")
		}
		unit_types.russia = {
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_r870/ene_akan_fbi_swat_dw_r870")
		}
		unit_types.zombie = {
			Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_2/ene_fbi_swat_hvh_2")
		}
		unit_types.murkywater = {
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light")
		}
		unit_types.federales = {
			Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale/ene_swat_policia_federale")
		}
	end

	local unit_types = {}
	self.unit_categories.FBI_heavy_G36 = {
		access = access_type_all,
		unit_types = unit_types
	}

	if difficulty_index < DIFF_ID_6_MAYHEM then
		unit_types.america = {
			Idstring("units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1")
		}
		unit_types.russia = {
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_g36/ene_akan_fbi_heavy_g36")
		}
		unit_types.zombie = {
			Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_1/ene_fbi_heavy_hvh_1")
		}
		unit_types.murkywater = {
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_g36/ene_murkywater_heavy_g36")
		}
		unit_types.federales = {
			Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_g36/ene_swat_heavy_policia_federale_fbi_g36")
		}
	elseif difficulty_index < DIFF_ID_8_DEATHSENT then
		unit_types.america = {
			Idstring("units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36")
		}
		unit_types.russia = {
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_g36/ene_akan_fbi_heavy_g36")
		}
		unit_types.zombie = {
			Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_1/ene_fbi_heavy_hvh_1")
		}
		unit_types.murkywater = {
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_g36/ene_murkywater_heavy_g36")
		}
		unit_types.federales = {
			Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_g36/ene_swat_heavy_policia_federale_fbi_g36")
		}
	else
		unit_types.america = {
			Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy")
		}
		unit_types.russia = {
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_g36/ene_akan_fbi_heavy_g36")
		}
		unit_types.zombie = {
			Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_1/ene_fbi_heavy_hvh_1")
		}
		unit_types.murkywater = {
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy/ene_murkywater_heavy")
		}
		unit_types.federales = {
			Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale/ene_swat_heavy_policia_federale")
		}
	end

	local unit_types = {}
	self.unit_categories.FBI_heavy_R870 = {
		access = access_type_all,
		unit_types = unit_types
	}

	if difficulty_index < DIFF_ID_6_MAYHEM then
		unit_types.america = {
			Idstring("units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870")
		}
		unit_types.russia = {
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870")
		}
		unit_types.zombie = {
			Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870")
		}
		unit_types.murkywater = {
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_shotgun/ene_murkywater_heavy_shotgun")
		}
		unit_types.federales = {
			Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870")
		}
	elseif difficulty_index < DIFF_ID_8_DEATHSENT then
		unit_types.america = {
			Idstring("units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870")
		}
		unit_types.russia = {
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870")
		}
		unit_types.zombie = {
			Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870")
		}
		unit_types.murkywater = {
			Idstring("units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870")
		}
		unit_types.federales = {
			Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870")
		}
	else
		unit_types.america = {
			Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy")
		}
		unit_types.russia = {
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870")
		}
		unit_types.zombie = {
			Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870")
		}
		unit_types.murkywater = {
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy/ene_murkywater_heavy")
		}
		unit_types.federales = {
			Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870")
		}
	end

	if difficulty_index < DIFF_ID_8_DEATHSENT then
		self.unit_categories.FBI_heavy_G36_w = {
			access = access_type_walk_only,
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_g36/ene_akan_fbi_heavy_g36")
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_1/ene_fbi_heavy_hvh_1")
				},
				murkywater = {
					Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy/ene_murkywater_heavy")
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale/ene_swat_heavy_policia_federale")
				}
			}
		}
	else
		self.unit_categories.FBI_heavy_G36_w = {
			access = access_type_walk_only,
			unit_types = {
				america = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_g36/ene_akan_fbi_heavy_g36")
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_1/ene_fbi_heavy_hvh_1")
				},
				murkywater = {
					Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy/ene_murkywater_heavy")
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale/ene_swat_heavy_policia_federale")
				}
			}
		}
	end

	local unit_types = {}
	self.unit_categories.FBI_shield = {
		special_type = "shield",
		access = access_type_walk_only,
		unit_types = unit_types
	}

	if difficulty_index < DIFF_ID_6_MAYHEM then
		unit_types.america = {
			Idstring("units/payday2/characters/ene_shield_1/ene_shield_1")
		}
		unit_types.russia = {
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_sr2_smg/ene_akan_fbi_shield_sr2_smg")
		}
		unit_types.zombie = {
			Idstring("units/pd2_dlc_hvh/characters/ene_shield_hvh_1/ene_shield_hvh_1")
		}
		unit_types.murkywater = {
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_shield/ene_murkywater_shield")
		}
		unit_types.federales = {
			Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9/ene_swat_shield_policia_federale_mp9")
		}
	elseif difficulty_index < DIFF_ID_8_DEATHSENT then
		unit_types.america = {
			Idstring("units/payday2/characters/ene_city_shield/ene_city_shield")
		}
		unit_types.russia = {
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_dw_sr2_smg/ene_akan_fbi_shield_dw_sr2_smg")
		}
		unit_types.zombie = {
			Idstring("units/pd2_dlc_hvh/characters/ene_shield_hvh_1/ene_shield_hvh_1")
		}
		unit_types.murkywater = {
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_shield/ene_murkywater_shield")
		}
		unit_types.federales = {
			Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9/ene_swat_shield_policia_federale_mp9")
		}
	else
		unit_types.america = {
			Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield")
		}
		unit_types.russia = {
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_dw_sr2_smg/ene_akan_fbi_shield_dw_sr2_smg")
		}
		unit_types.zombie = {
			Idstring("units/pd2_dlc_hvh/characters/ene_shield_hvh_1/ene_shield_hvh_1")
		}
		unit_types.murkywater = {
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_shield/ene_murkywater_shield")
		}
		unit_types.federales = {
			Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9/ene_swat_shield_policia_federale_mp9")
		}
	end

	local unit_types = {}
	self.unit_categories.FBI_tank = {
		special_type = "tank",
		access = access_type_walk_only,
		unit_types = unit_types
	}

	if difficulty_index <= DIFF_ID_3_HARD then
		unit_types.america = {
			Idstring("units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1")
		}
		unit_types.russia = {
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_r870/ene_akan_fbi_tank_r870")
		}
		unit_types.zombie = {
			Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_1/ene_bulldozer_hvh_1")
		}
		unit_types.murkywater = {
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_2/ene_murkywater_bulldozer_2")
		}
		unit_types.federales = {
			Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_r870/ene_swat_dozer_policia_federale_r870")
		}
	elseif difficulty_index <= DIFF_ID_5_OVERKILL then
		unit_types.america = {
			Idstring("units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"),
			Idstring("units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2")
		}
		unit_types.russia = {
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_saiga/ene_akan_fbi_tank_saiga"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_r870/ene_akan_fbi_tank_r870")
		}
		unit_types.zombie = {
			Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_1/ene_bulldozer_hvh_1"),
			Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_2/ene_bulldozer_hvh_2")
		}
		unit_types.murkywater = {
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_2/ene_murkywater_bulldozer_2"),
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_3/ene_murkywater_bulldozer_3")
		}
		unit_types.federales = {
			Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_r870/ene_swat_dozer_policia_federale_r870"),
			Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_saiga/ene_swat_dozer_policia_federale_saiga")
		}
	elseif difficulty_index <= DIFF_ID_6_MAYHEM then
		unit_types.america = {
			Idstring("units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"),
			Idstring("units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"),
			Idstring("units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3")
		}
		unit_types.russia = {
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_saiga/ene_akan_fbi_tank_saiga"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_r870/ene_akan_fbi_tank_r870"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_rpk_lmg/ene_akan_fbi_tank_rpk_lmg")
		}
		unit_types.zombie = {
			Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_1/ene_bulldozer_hvh_1"),
			Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_2/ene_bulldozer_hvh_2"),
			Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_3/ene_bulldozer_hvh_3")
		}
		unit_types.murkywater = {
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_2/ene_murkywater_bulldozer_2"),
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_3/ene_murkywater_bulldozer_3"),
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_4/ene_murkywater_bulldozer_4")
		}
		unit_types.federales = {
			Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_r870/ene_swat_dozer_policia_federale_r870"),
			Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_saiga/ene_swat_dozer_policia_federale_saiga"),
			Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_m249/ene_swat_dozer_policia_federale_m249")
		}
	elseif difficulty_index <= DIFF_ID_7_DEATHWISH then
		unit_types.america = {
			Idstring("units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"),
			Idstring("units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"),
			Idstring("units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"),
			Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic")
		}
		unit_types.russia = {
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_r870/ene_akan_fbi_tank_r870"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_saiga/ene_akan_fbi_tank_saiga"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_rpk_lmg/ene_akan_fbi_tank_rpk_lmg"),
			Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic")
		}
		unit_types.zombie = {
			Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_1/ene_bulldozer_hvh_1"),
			Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_2/ene_bulldozer_hvh_2"),
			Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_3/ene_bulldozer_hvh_3"),
			Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic")
		}
		unit_types.murkywater = {
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_1/ene_murkywater_bulldozer_1"),
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_2/ene_murkywater_bulldozer_2"),
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_3/ene_murkywater_bulldozer_3"),
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_4/ene_murkywater_bulldozer_4")
		}
		unit_types.federales = {
			Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_r870/ene_swat_dozer_policia_federale_r870"),
			Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_saiga/ene_swat_dozer_policia_federale_saiga"),
			Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_m249/ene_swat_dozer_policia_federale_m249"),
			Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_minigun/ene_swat_dozer_policia_federale_minigun")
		}
	else
		unit_types.america = {
			Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer"),
			Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"),
			Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3"),
			Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic"),
			Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun/ene_bulldozer_minigun")
		}
		unit_types.russia = {
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_r870/ene_akan_fbi_tank_r870"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_saiga/ene_akan_fbi_tank_saiga"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_rpk_lmg/ene_akan_fbi_tank_rpk_lmg"),
			Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic"),
			Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun/ene_bulldozer_minigun")
		}
		unit_types.zombie = {
			Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_1/ene_bulldozer_hvh_1"),
			Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_2/ene_bulldozer_hvh_2"),
			Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_3/ene_bulldozer_hvh_3"),
			Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic"),
			Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun/ene_bulldozer_minigun")
		}
		unit_types.murkywater = {
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_1/ene_murkywater_bulldozer_1"),
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_2/ene_murkywater_bulldozer_2"),
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_3/ene_murkywater_bulldozer_3"),
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_4/ene_murkywater_bulldozer_4"),
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_medic/ene_murkywater_bulldozer_medic")
		}
		unit_types.federales = {
			Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_r870/ene_swat_dozer_policia_federale_r870"),
			Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_saiga/ene_swat_dozer_policia_federale_saiga"),
			Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_m249/ene_swat_dozer_policia_federale_m249"),
			Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_minigun/ene_swat_dozer_policia_federale_minigun"),
			Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_medic_policia_federale/ene_swat_dozer_medic_policia_federale")
		}
	end

	self.unit_categories.medic_M4 = {
		special_type = "medic",
		access = access_type_all,
		unit_types = {
			america = {
				Idstring("units/payday2/characters/ene_medic_m4/ene_medic_m4")
			},
			russia = {
				Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_ak47_ass/ene_akan_medic_ak47_ass")
			},
			zombie = {
				Idstring("units/pd2_dlc_hvh/characters/ene_medic_hvh_m4/ene_medic_hvh_m4")
			},
			murkywater = {
				Idstring("units/pd2_dlc_bph/characters/ene_murkywater_medic/ene_murkywater_medic")
			},
			federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale")
			}
		}
	}
	self.unit_categories.medic_R870 = {
		special_type = "medic",
		access = access_type_all,
		unit_types = {
			america = {
				Idstring("units/payday2/characters/ene_medic_r870/ene_medic_r870")
			},
			russia = {
				Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_r870/ene_akan_medic_r870")
			},
			zombie = {
				Idstring("units/pd2_dlc_hvh/characters/ene_medic_hvh_r870/ene_medic_hvh_r870")
			},
			murkywater = {
				Idstring("units/pd2_dlc_bph/characters/ene_murkywater_medic_r870/ene_murkywater_medic_r870")
			},
			federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale_r870/ene_swat_medic_policia_federale_r870")
			}
		}
	}
	self.unit_categories.Phalanx_minion = {
		special_type = "shield",
		is_captain = false,
		access = access_type_walk_only,
		unit_types = {
			america = {
				Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1/ene_phalanx_1")
			},
			russia = {
				Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1/ene_phalanx_1")
			},
			zombie = {
				Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1/ene_phalanx_1")
			},
			murkywater = {
				Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1/ene_phalanx_1")
			},
			federales = {
				Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1/ene_phalanx_1")
			}
		}
	}
	self.unit_categories.Phalanx_vip = {
		special_type = "shield",
		is_captain = false,
		access = access_type_walk_only,
		unit_types = {
			america = {
				Idstring("units/pd2_dlc_vip/characters/ene_vip_1/ene_vip_1")
			},
			russia = {
				Idstring("units/pd2_dlc_vip/characters/ene_vip_1/ene_vip_1")
			},
			zombie = {
				Idstring("units/pd2_dlc_vip/characters/ene_vip_1/ene_vip_1")
			},
			murkywater = {
				Idstring("units/pd2_dlc_vip/characters/ene_vip_1/ene_vip_1")
			},
			federales = {
				Idstring("units/pd2_dlc_vip/characters/ene_vip_1/ene_vip_1")
			}
		}
	}
	self.unit_categories.marshal_marksman = {
		access = access_type_all,
		unit_types = {
			america = {
				Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_1/ene_male_marshal_marksman_1")
			},
			russia = {
				Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2")
			},
			zombie = {
				Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2")
			},
			murkywater = {
				Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2")
			},
			federales = {
				Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2")
			}
		}
	}
	self.unit_categories.marshal_shield = {
		access = access_type_walk_only,
		unit_types = {
			america = {
				Idstring("units/pd2_dlc_usm2/characters/ene_male_marshal_shield_1/ene_male_marshal_shield_1")
			},
			russia = {
				Idstring("units/pd2_dlc_usm2/characters/ene_male_marshal_shield_2/ene_male_marshal_shield_2")
			},
			zombie = {
				Idstring("units/pd2_dlc_usm2/characters/ene_male_marshal_shield_2/ene_male_marshal_shield_2")
			},
			murkywater = {
				Idstring("units/pd2_dlc_usm2/characters/ene_male_marshal_shield_2/ene_male_marshal_shield_2")
			},
			federales = {
				Idstring("units/pd2_dlc_usm2/characters/ene_male_marshal_shield_2/ene_male_marshal_shield_2")
			}
		}
	}
	self.unit_categories.snowman_boss = {
		access = access_type_all,
		unit_types = {
			america = {
				Idstring("units/pd2_dlc_cg22/characters/ene_snowman_boss/ene_snowman_boss")
			},
			russia = {
				Idstring("units/pd2_dlc_cg22/characters/ene_snowman_boss/ene_snowman_boss")
			},
			zombie = {
				Idstring("units/pd2_dlc_cg22/characters/ene_snowman_boss/ene_snowman_boss")
			},
			murkywater = {
				Idstring("units/pd2_dlc_cg22/characters/ene_snowman_boss/ene_snowman_boss")
			},
			federales = {
				Idstring("units/pd2_dlc_cg22/characters/ene_snowman_boss/ene_snowman_boss")
			}
		}
	}
	self.unit_categories.piggydozer = {
		access = access_type_all,
		unit_types = {
			america = {
				Idstring("units/pd2_dlc_pda10/characters/ene_dozer_piggy/ene_dozer_piggy")
			},
			russia = {
				Idstring("units/pd2_dlc_pda10/characters/ene_dozer_piggy/ene_dozer_piggy")
			},
			zombie = {
				Idstring("units/pd2_dlc_pda10/characters/ene_dozer_piggy/ene_dozer_piggy")
			},
			murkywater = {
				Idstring("units/pd2_dlc_pda10/characters/ene_dozer_piggy/ene_dozer_piggy")
			},
			federales = {
				Idstring("units/pd2_dlc_pda10/characters/ene_dozer_piggy/ene_dozer_piggy")
			}
		}
	}
end

function GroupAITweakData:_i_t_d(difficulty_index, difficulty)
	local is_console = SystemInfo:platform() ~= Idstring("WIN32")
	self.max_nr_simultaneous_boss_types = 0
	self.difficulty_curve_points = {
		0.5
	}
  
	if difficulty_index < DIFF_ID_6_MAYHEM then
		self.smoke_and_flash_grenade_timeout = {
			10,
			20
		}
	else
		self.smoke_and_flash_grenade_timeout = {
			15,
			20
		}
	end

	if difficulty_index < DIFF_ID_6_MAYHEM then
		self.smoke_grenade_lifetime = 7.5
	else
		self.smoke_grenade_lifetime = 12
	end

	self.flash_grenade_lifetime = 7.5
	self.flash_grenade = {
		timer = 3,
		light_range = 300,
		range = 1000,
		light_specular = 1,
		beep_fade_speed = 4,
		beep_multi = 0.3,
		light_color = Vector3(255, 0, 0),
		beep_speed = {
			0.1,
			0.025
		}
	}

	if DIFF_ID_6_MAYHEM <= difficulty_index then
		self.flash_grenade.timer = 2
	else
		self.flash_grenade.timer = 3
	end

	self.flash_shields = {
		marshal_shield = {
			flash_charge_stun_sound = "USM_Beep_Stop",
			flash_charge_stun_effect = "effects/particles/explosions/explosion_flash_grenade",
			flash_effect = "effects/payday2/particles/character/marshal_bright_light",
			flash_charge_stun_sound_explosion = "no_sound",
			flash_charge_timer = 3,
			beep_effect = "effects/payday2/particles/character/marshal_red_light",
			flash_charge_stun_range = 1500,
			beep_sound = "USM_Beep",
			flash_range = 1200,
			flash_charge_range = 1100,
			flash_shape_radius = 120,
			flash_charge_cooldown = 18,
			flash_slotmask = "persons_no_players",
			flash_shape = "cylinder",
			flash_sound = "USM_Flash",
			flash_range_min = 200,
			flash_charge_stun_slotmask = "persons_no_players",
			beep_speeds = {
				0.1,
				0.025
			},
			beep_light_data = {
				type_str = "omni|specular",
				range = 300,
				beep_mul = 0.3,
				falloff_exp = 0.5,
				beep_fade_speed = 4,
				specular_mul = 1,
				color = Vector3(255, 0, 0)
			}
		}
	}
	self.flash_shields.default = self.flash_shields.marshal_shield
	self.optimal_trade_distance = {
		0,
		0
	}
	self.bain_assault_praise_limits = {
		1,
		3
	}

	if difficulty_index <= DIFF_ID_2_NORMAL then
		self.besiege.recurring_group_SO = {
			recurring_cloaker_spawn = {
				retire_delay = 30,
				interval = {
					180,
					300
				}
			},
			recurring_spawn_1 = {
				interval = {
					30,
					60
				}
			}
		}
	elseif difficulty_index == DIFF_ID_3_HARD then
		self.besiege.recurring_group_SO = {
			recurring_cloaker_spawn = {
				retire_delay = 30,
				interval = {
					60,
					120
				}
			},
			recurring_spawn_1 = {
				interval = {
					30,
					60
				}
			}
		}
	elseif difficulty_index == DIFF_ID_4_VERYHARD then
		self.besiege.recurring_group_SO = {
			recurring_cloaker_spawn = {
				retire_delay = 30,
				interval = {
					45,
					60
				}
			},
			recurring_spawn_1 = {
				interval = {
					30,
					60
				}
			}
		}
	elseif difficulty_index == DIFF_ID_5_OVERKILL then
		self.besiege.recurring_group_SO = {
			recurring_cloaker_spawn = {
				retire_delay = 30,
				interval = {
					20,
					40
				}
			},
			recurring_spawn_1 = {
				interval = {
					30,
					60
				}
			}
		}
	else
		self.besiege.recurring_group_SO = {
			recurring_cloaker_spawn = {
				retire_delay = 30,
				interval = {
					15,
					30
				}
			},
			recurring_spawn_1 = {
				interval = {
					30,
					60
				}
			}
		}
	end

	self.besiege.regroup.duration = {
		15,
		15,
		15
	}
	self.besiege.assault = {
		anticipation_duration = {
			{
				30,
				1
			},
			{
				30,
				1
			},
			{
				45,
				0.5
			}
		},
		build_duration = 35,
		sustain_duration_min = {
			40,
			120,
			160
		},
		sustain_duration_max = {
			40,
			120,
			160
		},
		sustain_duration_balance_mul = {
			1,
			1.1,
			1.2,
			1.3
		},
		fade_duration = 5
	}

	if difficulty_index <= DIFF_ID_2_NORMAL then
		self.besiege.assault.delay = {
			60,
			45,
			30
		}
	elseif difficulty_index == DIFF_ID_3_HARD then
		self.besiege.assault.delay = {
			45,
			35,
			25
		}
	elseif difficulty_index == DIFF_ID_4_VERYHARD then
		self.besiege.assault.delay = {
			40,
			30,
			20
		}
	elseif difficulty_index == DIFF_ID_5_OVERKILL then
		self.besiege.assault.delay = {
			30,
			20,
			10
		}
	else
		self.besiege.assault.delay = {
			20,
			15,
			10
		}
	end

	if difficulty_index <= DIFF_ID_5_OVERKILL then
		self.besiege.assault.hostage_hesitation_delay = {
			30,
			30,
			30
		}
	else
		self.besiege.assault.hostage_hesitation_delay = {
			10,
			10,
			10
		}
	end

	self.besiege.assault.force = {
		15,
		17,
		18
	}
	self.besiege.assault.force_pool = {
		150,
		175,
		225
	}

	if difficulty_index <= DIFF_ID_5_OVERKILL then
		self.besiege.assault.force_balance_mul = {
			1,
			2,
			3,
			4
		}
		self.besiege.assault.force_pool_balance_mul = {
			1,
			2,
			3,
			4
		}
	elseif difficulty_index == DIFF_ID_6_MAYHEM then
		self.besiege.assault.force_balance_mul = {
			1.1,
			2.25,
			3.25,
			4.5
		}
		self.besiege.assault.force_pool_balance_mul = {
			1.1,
			2.25,
			3.25,
			4.5
		}
	elseif difficulty_index == DIFF_ID_7_DEATHWISH then
		self.besiege.assault.force_balance_mul = {
			1.2,
			2.5,
			3.75,
			5
		}
		self.besiege.assault.force_pool_balance_mul = {
			1.2,
			2.5,
			3.75,
			5
		}
	else
		self.besiege.assault.force_balance_mul = {
			1.5,
			3,
			4.5,
			6
		}
		self.besiege.assault.force_pool_balance_mul = {
			1.5,
			3,
			4.5,
			6
		}
	end

	if difficulty_index <= DIFF_ID_2_NORMAL then
		self.besiege.assault.groups = {
			tac_swat_shotgun_rush = {
				0.2,
				0.2,
				0.2
			},
			tac_swat_shotgun_flank = {
				0.2,
				0.2,
				0.2
			},
			tac_swat_rifle = {
				0.2,
				0.2,
				0.2
			},
			tac_swat_rifle_flank = {
				0.2,
				0.2,
				0.2
			},
			tac_shield_wall_ranged = {
				0.2,
				0.2,
				0.2
			},
			tac_shield_wall_charge = {
				0,
				0,
				0
			},
			tac_shield_wall = {
				0,
				0,
				0
			},
			tac_tazer_flanking = {
				0,
				0,
				0
			},
			tac_tazer_charge = {
				0,
				0,
				0
			},
			single_spoocs = {
				0,
				0,
				0
			},
			tac_bull_rush = {
				0,
				0,
				0
			}
		}
	elseif difficulty_index == DIFF_ID_3_HARD then
		self.besiege.assault.groups = {
			tac_swat_shotgun_rush = {
				0.1,
				0.1,
				0.1
			},
			tac_swat_shotgun_flank = {
				0.1,
				0.1,
				0.1
			},
			tac_swat_rifle = {
				0.2,
				0.2,
				0.2
			},
			tac_swat_rifle_flank = {
				0.1,
				0.1,
				0.1
			},
			tac_shield_wall_ranged = {
				0.1,
				0.1,
				0.1
			},
			tac_shield_wall_charge = {
				0.1,
				0.1,
				0.1
			},
			tac_shield_wall = {
				0.1,
				0.1,
				0.1
			},
			tac_tazer_flanking = {
				0.1,
				0.1,
				0.1
			},
			tac_tazer_charge = {
				0.1,
				0.1,
				0.1
			},
			single_spoocs = {
				0,
				0,
				0
			},
			tac_bull_rush = {
				0,
				0,
				0
			}
		}
	elseif difficulty_index == DIFF_ID_4_VERYHARD then
		self.besiege.assault.groups = {
			tac_swat_shotgun_rush = {
				0.19,
				0.19,
				0.19
			},
			tac_swat_shotgun_flank = {
				0.19,
				0.19,
				0.19
			},
			tac_swat_rifle = {
				0.2,
				0.2,
				0.2
			},
			tac_swat_rifle_flank = {
				0.19,
				0.19,
				0.19
			},
			tac_shield_wall_ranged = {
				0.03,
				0.03,
				0.03
			},
			tac_shield_wall_charge = {
				0.025,
				0.025,
				0.025
			},
			tac_shield_wall = {
				0.025,
				0.025,
				0.025
			},
			tac_tazer_flanking = {
				0.045,
				0.045,
				0.045
			},
			tac_tazer_charge = {
				0.045,
				0.045,
				0.045
			},
			FBI_spoocs = {
				0.02,
				0.02,
				0.02
			},
			tac_bull_rush = {
				0.04,
				0.04,
				0.04
			}
		}
	elseif difficulty_index == DIFF_ID_5_OVERKILL then
		self.besiege.assault.groups = {
			tac_swat_shotgun_rush = {
				0.19,
				0.19,
				0.19
			},
			tac_swat_shotgun_flank = {
				0.19,
				0.19,
				0.19
			},
			tac_swat_rifle = {
				0.2,
				0.2,
				0.2
			},
			tac_swat_rifle_flank = {
				0.19,
				0.19,
				0.19
			},
			tac_shield_wall_ranged = {
				0.03,
				0.03,
				0.03
			},
			tac_shield_wall_charge = {
				0.025,
				0.025,
				0.025
			},
			tac_shield_wall = {
				0.025,
				0.025,
				0.025
			},
			tac_tazer_flanking = {
				0.045,
				0.045,
				0.045
			},
			tac_tazer_charge = {
				0.045,
				0.045,
				0.045
			},
			FBI_spoocs = {
				0.02,
				0.02,
				0.02
			},
			tac_bull_rush = {
				0.04,
				0.04,
				0.04
			}
		}
	elseif difficulty_index == DIFF_ID_6_MAYHEM then
		self.besiege.assault.groups = {
			tac_swat_shotgun_rush = {
				0.18,
				0.18,
				0.18
			},
			tac_swat_shotgun_flank = {
				0.18,
				0.18,
				0.18
			},
			tac_swat_rifle = {
				0.18,
				0.18,
				0.18
			},
			tac_swat_rifle_flank = {
				0.18,
				0.18,
				0.18
			},
			tac_shield_wall_ranged = {
				0.03,
				0.03,
				0.03
			},
			tac_shield_wall_charge = {
				0.04,
				0.04,
				0.04
			},
			tac_shield_wall = {
				0.03,
				0.03,
				0.03
			},
			tac_tazer_flanking = {
				0.05,
				0.05,
				0.05
			},
			tac_tazer_charge = {
				0.05,
				0.05,
				0.05
			},
			FBI_spoocs = {
				0.03,
				0.03,
				0.03
			},
			tac_bull_rush = {
				0.05,
				0.05,
				0.05
			}
		}
	elseif difficulty_index == DIFF_ID_7_DEATHWISH then
		self.besiege.assault.groups = {
			tac_swat_shotgun_rush = {
				0.18,
				0.18,
				0.18
			},
			tac_swat_shotgun_flank = {
				0.18,
				0.18,
				0.18
			},
			tac_swat_rifle = {
				0.18,
				0.18,
				0.18
			},
			tac_swat_rifle_flank = {
				0.18,
				0.18,
				0.18
			},
			tac_shield_wall_ranged = {
				0.03,
				0.03,
				0.03
			},
			tac_shield_wall_charge = {
				0.04,
				0.04,
				0.04
			},
			tac_shield_wall = {
				0.03,
				0.03,
				0.03
			},
			tac_tazer_flanking = {
				0.05,
				0.05,
				0.05
			},
			tac_tazer_charge = {
				0.05,
				0.05,
				0.05
			},
			FBI_spoocs = {
				0.03,
				0.03,
				0.03
			},
			tac_bull_rush = {
				0.05,
				0.05,
				0.05
			}
		}
	elseif difficulty_index == DIFF_ID_8_DEATHSENT then
		self.besiege.assault.groups = {
			tac_swat_shotgun_rush = {
				0.18,
				0.18,
				0.18
			},
			tac_swat_shotgun_flank = {
				0.18,
				0.18,
				0.18
			},
			tac_swat_rifle = {
				0.18,
				0.18,
				0.18
			},
			tac_swat_rifle_flank = {
				0.18,
				0.18,
				0.18
			},
			tac_shield_wall_ranged = {
				0.03,
				0.03,
				0.03
			},
			tac_shield_wall_charge = {
				0.04,
				0.04,
				0.04
			},
			tac_shield_wall = {
				0.03,
				0.03,
				0.03
			},
			tac_tazer_flanking = {
				0.05,
				0.05,
				0.05
			},
			tac_tazer_charge = {
				0.05,
				0.05,
				0.05
			},
			FBI_spoocs = {
				0.05,
				0.05,
				0.05
			},
			tac_bull_rush = {
				0.05,
				0.05,
				0.05
			}
		}
	else
		self.besiege.assault.groups = {
			tac_swat_shotgun_rush = {
				0.13,
				0.13,
				0.13
			},
			tac_swat_shotgun_flank = {
				0.13,
				0.13,
				0.13
			},
			tac_swat_rifle = {
				0.13,
				0.13,
				0.13
			},
			tac_swat_rifle_flank = {
				0.13,
				0.13,
				0.13
			},
			tac_shield_wall_ranged = {
				0.06,
				0.06,
				0.06
			},
			tac_shield_wall_charge = {
				0.05,
				0.05,
				0.05
			},
			tac_shield_wall = {
				0.05,
				0.05,
				0.05
			},
			tac_tazer_flanking = {
				0.09,
				0.09,
				0.09
			},
			tac_tazer_charge = {
				0.09,
				0.09,
				0.09
			},
			FBI_spoocs = {
				0.01,
				0.01,
				0.01
			},
			tac_bull_rush = {
				0.09,
				0.09,
				0.09
			}
		}
	end

	self.besiege.assault.groups.single_spooc = {
		0,
		0,
		0
	}
	self.besiege.assault.groups.Phalanx = {
		0,
		0,
		0
	}
	self.besiege.assault.groups.marshal_squad = {
		0,
		0,
		0
	}
	self.besiege.assault.groups.snowman_boss = {
		0,
		0,
		0
	}
	self.besiege.assault.groups.piggydozer = {
		0,
		0,
		0
	}
	self.besiege.reenforce.interval = {
		10,
		20,
		30
	}
	self.besiege.reenforce.groups = {
		tac_swat_shotgun_rush = {
			0,
			0,
			0
		},
		tac_swat_shotgun_flank = {
			0,
			0,
			0
		},
		tac_swat_rifle = {
			0,
			0,
			0
		},
		tac_swat_rifle_flank = {
			0,
			0,
			0
		}
	}
	self.besiege.recon.interval = {
		5,
		5,
		5
	}
	self.besiege.recon.interval_variation = 40

	if difficulty_index <= DIFF_ID_5_OVERKILL then
		self.besiege.recon.force = {
			2,
			4,
			6
		}
	else
		self.besiege.recon.force = {
			3,
			4,
			6
		}
	end

	if difficulty_index <= DIFF_ID_2_NORMAL then
		self.besiege.recon.groups = {
			tac_swat_shotgun_rush = {
				0.1,
				0.1,
				0.1
			},
			tac_swat_shotgun_flank = {
				0.1,
				0.1,
				0.1
			},
			tac_swat_rifle = {
				0.1,
				0.1,
				0.1
			},
			tac_swat_rifle_flank = {
				0.1,
				0.1,
				0.1
			}
		}
	elseif difficulty_index == DIFF_ID_3_HARD then
		self.besiege.recon.groups = {
			tac_swat_shotgun_rush = {
				0.1,
				0.1,
				0.1
			},
			tac_swat_shotgun_flank = {
				0.1,
				0.1,
				0.1
			},
			tac_swat_rifle = {
				0.1,
				0.1,
				0.1
			},
			tac_swat_rifle_flank = {
				0.1,
				0.1,
				0.1
			}
		}
	elseif difficulty_index == DIFF_ID_4_VERYHARD then
		self.besiege.recon.groups = {
			tac_swat_shotgun_rush = {
				0.1,
				0.1,
				0.1
			},
			tac_swat_shotgun_flank = {
				0.1,
				0.1,
				0.1
			},
			tac_swat_rifle = {
				0.1,
				0.1,
				0.1
			},
			tac_swat_rifle_flank = {
				0.1,
				0.1,
				0.1
			}
		}
	elseif difficulty_index == DIFF_ID_5_OVERKILL then
		self.besiege.recon.groups = {
			tac_swat_shotgun_rush = {
				0.1,
				0.1,
				0.1
			},
			tac_swat_shotgun_flank = {
				0.1,
				0.1,
				0.1
			},
			tac_swat_rifle = {
				0.1,
				0.1,
				0.1
			},
			tac_swat_rifle_flank = {
				0.1,
				0.1,
				0.1
			}
		}
	else
		self.besiege.recon.groups = {
			tac_swat_shotgun_rush = {
				0.1,
				0.1,
				0.1
			},
			tac_swat_shotgun_flank = {
				0.1,
				0.1,
				0.1
			},
			tac_swat_rifle = {
				0.1,
				0.1,
				0.1
			},
			tac_swat_rifle_flank = {
				0.1,
				0.1,
				0.1
			}
		}
	end

	self.besiege.recon.groups.single_spooc = {
		0,
		0,
		0
	}
	self.besiege.recon.groups.Phalanx = {
		0,
		0,
		0
	}
	self.besiege.recon.groups.marshal_squad = {
		0,
		0,
		0
	}
	self.besiege.recon.groups.snowman_boss = {
		0,
		0,
		0
	}
	self.besiege.recon.groups.piggydozer = {
		0,
		0,
		0
	}
	self.besiege.cloaker.groups = {
		single_spooc = {
			1,
			1,
			1
		}
	}
	self.besiege.assault.groups.custom = {
		0,
		0,
		0
	}
	self.besiege.recon.groups.custom = {
		0,
		0,
		0
	}
	self.besiege.reenforce.groups.custom = {
		0,
		0,
		0
	}
	self.street = deep_clone(self.besiege)
	self.phalanx.minions.min_count = 4
	self.phalanx.minions.amount = 10
	self.phalanx.minions.distance = 100
	self.phalanx.vip.health_ratio_flee = 0.2
	self.phalanx.vip.damage_reduction = {
		max = 0.5,
		start = 0.1,
		increase_intervall = 5,
		increase = 0.05
	}
	self.phalanx.check_spawn_intervall = 120
	self.phalanx.chance_increase_intervall = 120

	if difficulty_index == DIFF_ID_4_VERYHARD then
		self.phalanx.spawn_chance = {
			decrease = 0.7,
			start = 0,
			respawn_delay = 300000,
			increase = 0.05,
			max = 1
		}
	elseif difficulty_index == DIFF_ID_5_OVERKILL then
		self.phalanx.spawn_chance = {
			decrease = 0.7,
			start = 0.01,
			respawn_delay = 300000,
			increase = 0.09,
			max = 1
		}
	elseif difficulty_index == DIFF_ID_6_MAYHEM then
		self.phalanx.spawn_chance = {
			decrease = 1,
			start = 0.05,
			respawn_delay = 300000,
			increase = 0.09,
			max = 1
		}
	elseif difficulty_index == DIFF_ID_7_DEATHWISH then
		self.phalanx.spawn_chance = {
			decrease = 1,
			start = 0.05,
			respawn_delay = 300000,
			increase = 0.09,
			max = 1
		}
	elseif difficulty_index == DIFF_ID_8_DEATHSENT then
		self.phalanx.spawn_chance = {
			decrease = 1,
			start = 0.05,
			respawn_delay = 300000,
			increase = 0.09,
			max = 1
		}
	else
		self.phalanx.spawn_chance = {
			decrease = 0,
			start = 0,
			respawn_delay = 120,
			increase = 0,
			max = 0
		}
	end

	self.safehouse = deep_clone(self.besiege)
end

if RequiredScript == "lib/tweak_data/groupaitweakdata" then
  local state = ""
  
  if AlvasMod._path then
    local file = io.open(AlvasMod._path .. "enabled.dat", "r")
    if file then
      state = file:read("*all")
      file:close()
    end
  end
  
  if state and state == "false" then
  GroupAITweakData._init_enemy_spawn_groups = GroupAITweakData._i_e_s_g
  GroupAITweakData._init_enemy_spawn_groups_level = GroupAITweakData._i_e_s_g_l
  GroupAITweakData._init_unit_categories = GroupAITweakData._i_u_c
  GroupAITweakData._init_task_data = GroupAITweakData._i_t_d
  Hooks:RemovePostHook("dwe_init_enemy_spawn_groups")
  Hooks:RemovePostHook("dwe_marshal_level")
  Hooks:RemovePostHook("dwe_init_unit_categories")
  Hooks:RemovePostHook("dwe_grouptweak_init")
  Hooks:RemovePostHook("dwe_init_task_data")
  end
end