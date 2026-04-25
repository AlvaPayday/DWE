----this code displays the applied damage ratio to other players during gameplay

--Hooks:PostHook(UnitNetworkHandler, "criminal_hurt", "dwe_unh_criminal_hurt", function (self, criminal_unit, attacker_unit, damage_ratio, height_offset, sender)
    
--local damage_taken = damage_ratio
--local peer = managers.network:session():peer_by_unit(criminal_unit)

--if peer and attacker_unit then
--  AlvasMod:msg(peer:name() .. "   damage: " .. tostring(damage_taken) ..  "  " .. tostring(attacker_unit:base()._tweak_table) .. "  " .. tostring(attacker_unit:inventory():equipped_unit():base().name_id) .. "\n")
--else
--  --AlvasMod:msg("peer not found")
--end

--end)




