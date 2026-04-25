Hooks:PostHook(ElementSpawnEnemyGroup, "init", "clone_init", function(self)
  
  if AlvasMod and Network:is_server() and AlvasMod.settings.en_alvasmod == true then
    
      local groups = self._values.preferred_spawn_groups
      if groups ~= nil then
        for k, v in pairs(groups) do
          if v == "tac_swat_rifle_flank" or "tac_swat_rifle" or "CS_swat_rifle" or "CS_swat_rifle_flank" or "FBI_swat_rifle" or "FBI_swat_rifle_flank" then
            if AlvasMod.settings.en_fbi_sniper then
            table.insert(groups, "tac_sniper")
            break
            end
          end
          
          
        end
      end
  end
end)