--Hooks:PostHook(PlayerDamage,"damage_bullet","dwe_player_damage_bullet",function(self,attack_data)
  
--  local unit_name = tostring(attack_data.attacker_unit:base()._tweak_table)
--  local unit_damage = math.floor(attack_data.damage * 10)
--  local unit_weapon = tostring(attack_data.attacker_unit:inventory():equipped_unit():base().name_id)
--  AlvasMod:msg(unit_name .. "  " .. unit_damage .. " damage  " .. unit_weapon)
--end)
