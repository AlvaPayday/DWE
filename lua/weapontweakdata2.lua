Hooks:PostHook(WeaponTweakData, "init", "dwe_wtd_init", function (self)
    
   if AlvasMod and AlvasMod.settings.en_elite_ultra then
      self.ak47_npc.auto.fire_rate = 0.04
      self.g36_npc.auto.fire_rate = 0.04
      self.mac11_npc.auto.fire_rate = 0.04
    else
      self.g36_npc.auto.fire_rate = 0.08
      self.m249_npc.auto.fire_rate = 0.08   
    end
    
end)

Hooks:PostHook(WeaponTweakData, "_set_overkill_290", "dwe_set_overkill_290", function (self)    
  self.swat_van_turret_module.HEALTH_INIT = 5000
	self.swat_van_turret_module.SHIELD_HEALTH_INIT = 700
	self.swat_van_turret_module.DAMAGE = 3.5
	self.swat_van_turret_module.CLIP_SIZE = 800 
  self.swat_van_turret_module.AUTO_RELOAD = true
	self.swat_van_turret_module.AUTO_RELOAD_DURATION = 8
	self.swat_van_turret_module.CAN_GO_IDLE = true
	self.swat_van_turret_module.IDLE_WAIT_TIME = 5
	self.swat_van_turret_module.AUTO_REPAIR = false
  self.swat_van_turret_module.ECM_HACKABLE = false
  self.swat_van_turret_module.HACKABLE_WITH_ECM = false
  self.swat_van_turret_module.FIRE_DMG_MUL = 5
end)



