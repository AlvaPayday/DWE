Hooks:PostHook(EnemyManager, "init", "rmdelay_init", function(self)
  if not Network:is_server() or not AlvasMod then return end
	self._sfm_delay = 0
end)

Hooks:PostHook(EnemyManager, "on_enemy_registered", "update_cur_pool", function (self, unit)
    if not Network:is_server() or not AlvasMod then return end
    elite_task_data.assault_current_pool = self._enemy_data.nr_units
end)

Hooks:PostHook(EnemyManager, "on_enemy_unregistered", "update_cur_pool2", function (self, unit)
     if not Network:is_server() or not AlvasMod then return end
     elite_task_data.assault_current_pool = self._enemy_data.nr_units
end)

Hooks:PreHook(EnemyManager, "on_enemy_died", "dwe_on_enemy_died", function (self, dead_unit, damage_info)
    if self._destroyed then
      --reserved
    end
    
    if not dead_unit:brain() then
      return 
    end
    
    dead_unit:brain():cancel_all_pathing_searches()
      
end)
