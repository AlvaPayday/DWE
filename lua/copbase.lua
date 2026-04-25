local ultra = {
  
  pistol = {
		"raging_bull"

	},
  
  shotgun = {
    "r870"
  },
  
  light_rifle = {
    "g36",
    "ak47"
  },
  
  heavy_rifle = {
    "g36",
    "ak47"
  },
  
  special1 = {
    "g36"
  }
  
  
}


local cop = {
	pistol = {
    "c45",
		"raging_bull"
	},
	heavy = {
		"r870"
	}
}
--SWAT
local swat = {
	rifle_light = {
		"g36"
	},
	rifle_heavy = {
		"m249",
		"g36"
	}
}
--FBI and Medics
local fbi = {
	pistol_agent = {
    "c45",
		"raging_bull"
	},
	rifle_agent = {
		"g36"
	},
	rifle_light = {
		"g36"
	},
	rifle_heavy = {
		"g36",
		"m249"
	},
	shotgun = {
		"r870"
	},
	shotgun_medic = {
		"r870",
		"benelli"
	}
}
--GenSec
local gensec = {
	rifle_heavy = {
		"g36",
		"m249"
	},
	shotgun = {
		"r870",
		"benelli"
	}
}
--ZEAL
local zeal = {
	rifle_light = {
		"mp5"
	},
	rifle_heavy = {
		"m4"
	},
	rifle_medic = {
		"mp5",
		"m4"
	}
}
--Russian Reapers
local russia = {
	rifle_light = {
		"ak47_ass",
		"akmsu_smg"
	},
	rifle_heavy = {
		"ak47_ass",
		"rpk_lmg"
	},
	shotgun = {
		"r870",
		"benelli"
	}
}
--Murkywater
local murkywater = {
	rifle_light = {
		"m4",
		"scar_murky",
		"ump"
	},
	rifle_heavy = {
		"m4",
		"scar_murky",
		"ump",
		"m249",
		"m249",
		"m249"
	},
	shotgun = {
		"r870",
		"benelli"
	}
}
--Policia Federal
local federales = {
	rifle_light = {
		"mp5",
		"m4",
		"ump"
	},
	rifle_heavy = {
		"mp5",
		"m4",
		"ump",
		"m249",
		"m249",
		"m249"
	},
	shotgun = {
		"r870",
		"benelli"
	}
}





	local elite_mapping = {
-- Beat cops
	[("units/payday2/characters/ene_cop_1/ene_cop_1"):key()] = cop.pistol,
	[("units/payday2/characters/ene_cop_2/ene_cop_2"):key()] = cop.pistol,
	[("units/payday2/characters/ene_cop_3/ene_cop_3"):key()] = cop.heavy,
	[("units/payday2/characters/ene_cop_4/ene_cop_4"):key()] = cop.heavy,
	[("units/pd2_dlc_rvd/characters/ene_la_cop_1/ene_la_cop_1"):key()] = cop.pistol,
	[("units/pd2_dlc_rvd/characters/ene_la_cop_2/ene_la_cop_2"):key()] = cop.pistol,
	[("units/pd2_dlc_rvd/characters/ene_la_cop_3/ene_la_cop_3"):key()] = cop.heavy,
	[("units/pd2_dlc_rvd/characters/ene_la_cop_4/ene_la_cop_4"):key()] = cop.heavy,
	[("units/pd2_dlc_bex/characters/ene_policia_01/ene_policia_01"):key()] = cop.pistol,
	[("units/pd2_dlc_bex/characters/ene_policia_02/ene_policia_02"):key()] = cop.pistol,

-- SWAT
	[("units/payday2/characters/ene_swat_1/ene_swat_1"):key()] = swat.rifle_heavy,
	[("units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"):key()] = swat.rifle_heavy,
-- FBI
	[("units/payday2/characters/ene_fbi_1/ene_fbi_1"):key()] = fbi.pistol_agent,
	[("units/payday2/characters/ene_fbi_2/ene_fbi_2"):key()] = fbi.rifle_agent,
	[("units/payday2/characters/ene_fbi_3/ene_fbi_3"):key()] = fbi.rifle_agent,
	[("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"):key()] = fbi.rifle_light,
	[("units/payday2/characters/ene_medic_m4/ene_medic_m4"):key()] = fbi.rifle_light,
	[("units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"):key()] = fbi.rifle_heavy,
	[("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"):key()] = fbi.shotgun,
	[("units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"):key()] = fbi.shotgun,
	[("units/payday2/characters/ene_medic_r870/ene_medic_r870"):key()] = fbi.shotgun_medic,
-- GenSec
	[("units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"):key()] = gensec.rifle_heavy,
	[("units/payday2/characters/ene_city_swat_2/ene_city_swat_2"):key()] = gensec.shotgun,
	[("units/payday2/characters/ene_city_swat_r870/ene_city_swat_r870"):key()] = gensec.shotgun,
	[("units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"):key()] = gensec.shotgun,
-- ZEAL
	[("units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"):key()] = zeal.rifle_light,
	[("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"):key()] = zeal.rifle_heavy,
	[("units/pd2_dlc_gitgud/characters/ene_zeal_medic_m4/ene_zeal_medic_m4"):key()] = zeal.rifle_medic,
-- Russia
	[("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass"):key()] = russia.rifle_light,
	[("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_ak47_ass/ene_akan_cs_heavy_ak47_ass"):key()] = russia.rifle_light,
	[("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"):key()] = russia.rifle_light,
	[("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass/ene_akan_fbi_swat_dw_ak47_ass"):key()] = russia.rifle_light,
	[("units/pd2_dlc_mad/characters/ene_akan_medic_ak47_ass/ene_akan_medic_ak47_ass"):key()] = russia.rifle_light,
	[("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_g36/ene_akan_fbi_heavy_g36"):key()] = russia.rifle_heavy,
	[("units/pd2_dlc_mad/characters/ene_akan_cs_swat_r870/ene_akan_cs_swat_r870"):key()] = russia.shotgun,
	[("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_r870/ene_akan_cs_heavy_r870"):key()] = russia.shotgun,
	[("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_r870/ene_akan_fbi_swat_r870"):key()] = russia.shotgun,
	[("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"):key()] = russia.shotgun,
	[("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_r870/ene_akan_fbi_swat_dw_r870"):key()] = russia.shotgun,
	[("units/pd2_dlc_mad/characters/ene_akan_medic_r870/ene_akan_medic_r870"):key()] = russia.shotgun,
-- Zombie
	[("units/pd2_dlc_hvh/characters/ene_cop_hvh_1/ene_cop_hvh_1"):key()] = cop.pistol,
	[("units/pd2_dlc_hvh/characters/ene_cop_hvh_2/ene_cop_hvh_2"):key()] = cop.pistol,
	[("units/pd2_dlc_hvh/characters/ene_cop_hvh_3/ene_cop_hvh_3"):key()] = cop.heavy,
	[("units/pd2_dlc_hvh/characters/ene_cop_hvh_4/ene_cop_hvh_4"):key()] = cop.heavy,
	[("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"):key()] = swat.rifle_light,
	[("units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_1/ene_swat_heavy_hvh_1"):key()] = swat.rifle_heavy,
	[("units/pd2_dlc_hvh/characters/ene_fbi_hvh_1/ene_fbi_hvh_1"):key()] = fbi.pistol_agent,
	[("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"):key()] = fbi.rifle_agent,
	[("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"):key()] = fbi.rifle_agent,
	[("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"):key()] = fbi.rifle_light,
	[("units/pd2_dlc_hvh/characters/ene_medic_hvh_m4/ene_medic_hvh_m4"):key()] = fbi.rifle_light,
	[("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_1/ene_fbi_heavy_hvh_1"):key()] = fbi.rifle_heavy,
	[("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_2/ene_fbi_swat_hvh_2"):key()] = fbi.shotgun,
	[("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"):key()] = fbi.shotgun,
	[("units/pd2_dlc_hvh/characters/ene_medic_hvh_r870/ene_medic_hvh_r870"):key()] = fbi.shotgun_medic,
-- Murkywater
	[("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light"):key()] = murkywater.rifle_light,
	[("units/pd2_dlc_bph/characters/ene_murkywater_heavy/ene_murkywater_heavy"):key()] = murkywater.rifle_light,
	[("units/pd2_dlc_bph/characters/ene_murkywater_light_fbi/ene_murkywater_light_fbi"):key()] = murkywater.rifle_light,
	[("units/pd2_dlc_bph/characters/ene_murkywater_light_city/ene_murkywater_light_city"):key()] = murkywater.rifle_light,
	[("units/pd2_dlc_bph/characters/ene_murkywater_medic/ene_murkywater_medic"):key()] = murkywater.rifle_light,
	[("units/pd2_dlc_bph/characters/ene_murkywater_heavy_g36/ene_murkywater_heavy_g36"):key()] = murkywater.rifle_heavy,
	[("units/pd2_dlc_bph/characters/ene_murkywater_light_r870/ene_murkywater_light_r870"):key()] = murkywater.shotgun,
	[("units/pd2_dlc_bph/characters/ene_murkywater_light_fbi_r870/ene_murkywater_light_fbi_r870"):key()] = murkywater.shotgun,
	[("units/pd2_dlc_bph/characters/ene_murkywater_light_city_r870/ene_murkywater_light_city_r870"):key()] = murkywater.shotgun,
	[("units/pd2_dlc_bph/characters/ene_murkywater_heavy_shotgun/ene_murkywater_heavy_shotgun"):key()] = murkywater.shotgun,
	[("units/pd2_dlc_bph/characters/ene_murkywater_medic_r870/ene_murkywater_medic_r870"):key()] = murkywater.shotgun,
-- Federales
	[("units/pd2_dlc_bex/characters/ene_swat_policia_federale/ene_swat_policia_federale"):key()] = federales.rifle_light,
	[("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale/ene_swat_heavy_policia_federale"):key()] = federales.rifle_light,
	[("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_g36/ene_swat_heavy_policia_federale_g36"):key()] = federales.rifle_light,
	[("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi"):key()] = federales.rifle_light,
	[("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city/ene_swat_policia_federale_city"):key()] = federales.rifle_light,
	[("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"):key()] = federales.rifle_light,
	[("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi/ene_swat_heavy_policia_federale_fbi"):key()] = federales.rifle_heavy,
	[("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_g36/ene_swat_heavy_policia_federale_fbi_g36"):key()] = federales.rifle_heavy,
	[("units/pd2_dlc_bex/characters/ene_swat_policia_federale_r870/ene_swat_policia_federale_r870"):key()] = federales.shotgun,
	[("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_r870/ene_swat_policia_federale_fbi_r870"):key()] = federales.shotgun,
	[("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city_r870/ene_swat_policia_federale_city_r870"):key()] = federales.shotgun,
	[("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_r870/ene_swat_heavy_policia_federale_r870"):key()] = federales.shotgun,
	[("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"):key()] = federales.shotgun,
	[("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale_r870/ene_swat_medic_policia_federale_r870"):key()] = federales.shotgun
}

local ultra_mapping = {
-- Beat cops
	[("units/payday2/characters/ene_cop_1/ene_cop_1"):key()] = ultra.pistol,
	[("units/payday2/characters/ene_cop_2/ene_cop_2"):key()] = ultra.pistol,
	[("units/payday2/characters/ene_cop_3/ene_cop_3"):key()] = ultra.shotgun,
	[("units/payday2/characters/ene_cop_4/ene_cop_4"):key()] = ultra.shotgun,
	[("units/pd2_dlc_rvd/characters/ene_la_cop_1/ene_la_cop_1"):key()] = ultra.pistol,
	[("units/pd2_dlc_rvd/characters/ene_la_cop_2/ene_la_cop_2"):key()] = ultra.pistol,
	[("units/pd2_dlc_rvd/characters/ene_la_cop_3/ene_la_cop_3"):key()] = ultra.shotgun,
	[("units/pd2_dlc_rvd/characters/ene_la_cop_4/ene_la_cop_4"):key()] = ultra.shotgun,
	[("units/pd2_dlc_bex/characters/ene_policia_01/ene_policia_01"):key()] = ultra.pistol,
	[("units/pd2_dlc_bex/characters/ene_policia_02/ene_policia_02"):key()] = ultra.pistol,

-- SWAT
	[("units/payday2/characters/ene_swat_1/ene_swat_1"):key()] = ultra.light_rifle,
	[("units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"):key()] = ultra.heavy_rifle,
-- FBI
	[("units/payday2/characters/ene_fbi_1/ene_fbi_1"):key()] = ultra.pistol,
	[("units/payday2/characters/ene_fbi_2/ene_fbi_2"):key()] = ultra.light_rifle,
	[("units/payday2/characters/ene_fbi_3/ene_fbi_3"):key()] = ultra.light_rifle,
	[("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"):key()] = ultra.heavy_rifle,
	[("units/payday2/characters/ene_medic_m4/ene_medic_m4"):key()] = fbi.rifle_light,
	[("units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"):key()] = ultra.special1,
	[("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"):key()] = ultra.shotgun,
	[("units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"):key()] = ultra.shotgun,
	[("units/payday2/characters/ene_medic_r870/ene_medic_r870"):key()] = fbi.shotgun_medic,
	[("units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"):key()] = ultra.special1,
	[("units/payday2/characters/ene_city_swat_2/ene_city_swat_2"):key()] = ultra.heavy_rifle,
	[("units/payday2/characters/ene_city_swat_r870/ene_city_swat_r870"):key()] = ultra.shotgun,
	[("units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"):key()] = ultra.shotgun,
-- ZEAL
	[("units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"):key()] = zeal.rifle_light,
	[("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"):key()] = zeal.rifle_heavy,
	[("units/pd2_dlc_gitgud/characters/ene_zeal_medic_m4/ene_zeal_medic_m4"):key()] = zeal.rifle_medic,
-- Russia
	[("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass"):key()] = russia.rifle_light,
	[("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_ak47_ass/ene_akan_cs_heavy_ak47_ass"):key()] = russia.rifle_light,
	[("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"):key()] = russia.rifle_light,
	[("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass/ene_akan_fbi_swat_dw_ak47_ass"):key()] = russia.rifle_light,
	[("units/pd2_dlc_mad/characters/ene_akan_medic_ak47_ass/ene_akan_medic_ak47_ass"):key()] = russia.rifle_light,
	[("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_g36/ene_akan_fbi_heavy_g36"):key()] = russia.rifle_heavy,
	[("units/pd2_dlc_mad/characters/ene_akan_cs_swat_r870/ene_akan_cs_swat_r870"):key()] = russia.shotgun,
	[("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_r870/ene_akan_cs_heavy_r870"):key()] = russia.shotgun,
	[("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_r870/ene_akan_fbi_swat_r870"):key()] = russia.shotgun,
	[("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"):key()] = russia.shotgun,
	[("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_r870/ene_akan_fbi_swat_dw_r870"):key()] = russia.shotgun,
	[("units/pd2_dlc_mad/characters/ene_akan_medic_r870/ene_akan_medic_r870"):key()] = russia.shotgun,
-- Zombie
	[("units/pd2_dlc_hvh/characters/ene_cop_hvh_1/ene_cop_hvh_1"):key()] = cop.pistol,
	[("units/pd2_dlc_hvh/characters/ene_cop_hvh_2/ene_cop_hvh_2"):key()] = cop.pistol,
	[("units/pd2_dlc_hvh/characters/ene_cop_hvh_3/ene_cop_hvh_3"):key()] = cop.heavy,
	[("units/pd2_dlc_hvh/characters/ene_cop_hvh_4/ene_cop_hvh_4"):key()] = cop.heavy,
	[("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"):key()] = swat.rifle_light,
	[("units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_1/ene_swat_heavy_hvh_1"):key()] = swat.rifle_heavy,
	[("units/pd2_dlc_hvh/characters/ene_fbi_hvh_1/ene_fbi_hvh_1"):key()] = fbi.pistol_agent,
	[("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"):key()] = fbi.rifle_agent,
	[("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"):key()] = fbi.rifle_agent,
	[("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"):key()] = fbi.rifle_light,
	[("units/pd2_dlc_hvh/characters/ene_medic_hvh_m4/ene_medic_hvh_m4"):key()] = fbi.rifle_light,
	[("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_1/ene_fbi_heavy_hvh_1"):key()] = fbi.rifle_heavy,
	[("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_2/ene_fbi_swat_hvh_2"):key()] = fbi.shotgun,
	[("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"):key()] = fbi.shotgun,
	[("units/pd2_dlc_hvh/characters/ene_medic_hvh_r870/ene_medic_hvh_r870"):key()] = fbi.shotgun_medic,
-- Murkywater
	[("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light"):key()] = murkywater.rifle_light,
	[("units/pd2_dlc_bph/characters/ene_murkywater_heavy/ene_murkywater_heavy"):key()] = murkywater.rifle_light,
	[("units/pd2_dlc_bph/characters/ene_murkywater_light_fbi/ene_murkywater_light_fbi"):key()] = murkywater.rifle_light,
	[("units/pd2_dlc_bph/characters/ene_murkywater_light_city/ene_murkywater_light_city"):key()] = murkywater.rifle_light,
	[("units/pd2_dlc_bph/characters/ene_murkywater_medic/ene_murkywater_medic"):key()] = murkywater.rifle_light,
	[("units/pd2_dlc_bph/characters/ene_murkywater_heavy_g36/ene_murkywater_heavy_g36"):key()] = murkywater.rifle_heavy,
	[("units/pd2_dlc_bph/characters/ene_murkywater_light_r870/ene_murkywater_light_r870"):key()] = murkywater.shotgun,
	[("units/pd2_dlc_bph/characters/ene_murkywater_light_fbi_r870/ene_murkywater_light_fbi_r870"):key()] = murkywater.shotgun,
	[("units/pd2_dlc_bph/characters/ene_murkywater_light_city_r870/ene_murkywater_light_city_r870"):key()] = murkywater.shotgun,
	[("units/pd2_dlc_bph/characters/ene_murkywater_heavy_shotgun/ene_murkywater_heavy_shotgun"):key()] = murkywater.shotgun,
	[("units/pd2_dlc_bph/characters/ene_murkywater_medic_r870/ene_murkywater_medic_r870"):key()] = murkywater.shotgun,
-- Federales
	[("units/pd2_dlc_bex/characters/ene_swat_policia_federale/ene_swat_policia_federale"):key()] = federales.rifle_light,
	[("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale/ene_swat_heavy_policia_federale"):key()] = federales.rifle_light,
	[("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_g36/ene_swat_heavy_policia_federale_g36"):key()] = federales.rifle_light,
	[("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi"):key()] = federales.rifle_light,
	[("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city/ene_swat_policia_federale_city"):key()] = federales.rifle_light,
	[("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"):key()] = federales.rifle_light,
	[("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi/ene_swat_heavy_policia_federale_fbi"):key()] = federales.rifle_heavy,
	[("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_g36/ene_swat_heavy_policia_federale_fbi_g36"):key()] = federales.rifle_heavy,
	[("units/pd2_dlc_bex/characters/ene_swat_policia_federale_r870/ene_swat_policia_federale_r870"):key()] = federales.shotgun,
	[("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_r870/ene_swat_policia_federale_fbi_r870"):key()] = federales.shotgun,
	[("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city_r870/ene_swat_policia_federale_city_r870"):key()] = federales.shotgun,
	[("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_r870/ene_swat_heavy_policia_federale_r870"):key()] = federales.shotgun,
	[("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"):key()] = federales.shotgun,
	[("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale_r870/ene_swat_medic_policia_federale_r870"):key()] = federales.shotgun
}

Hooks:PreHook(CopBase, "post_init", "dwe_copbase_post_init", function(self)
  if not Network:is_server() or not AlvasMod then return end

  local weapon_swap = nil
  
  if AlvasMod.settings.en_elite_ultra then
    weapon_swap = ultra_mapping[self._unit:name():key()]
  else
    weapon_swap = elite_mapping[self._unit:name():key()]
  end
  
	if weapon_swap then
		self._default_weapon_id = type(weapon_swap) == "table" and table.random(weapon_swap) or weapon_swap
	end
  

end)


Hooks:PreHook(CopBase, "default_weapon_name", "dwe_default_weapon_name", function(self, selection_name)
  
if not Network:is_server() or not AlvasMod then return end

local weapon_swap = nil
  
  if AlvasMod.settings.en_elite_ultra then
    weapon_swap = ultra_mapping[self._unit:name():key()]
  else
    weapon_swap = elite_mapping[self._unit:name():key()]
  end
  
	if weapon_swap then
		self._default_weapon_id = type(weapon_swap) == "table" and table.random(weapon_swap) or weapon_swap
    if self._default_weapons then
		self._default_weapons.primary = self._default_weapon_id
		self._default_weapons.secondary = self._default_weapon_id
    end
	end
  
  if self._unit and self._unit:base() and self._unit:base()._tweak_table then
    
    if self._unit:base()._tweak_table== "marshal_marksman" then
      if self._default_weapon_id then
        self._default_weapon_id = "m14_sniper_npc"
      end
    end
    
  end
  
end)

function CopBase:on_follow_failed(data)
  local new_objective = {
    is_default = true,
    type = "free",
    attitude = "engage"
  }

  data.unit:brain():cancel_all_pathing_searches()
  data.unit:brain():set_objective(new_objective)
end

