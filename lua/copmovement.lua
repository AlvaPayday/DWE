--modified code borrowed from "Everyone wears a covid face mask" 
--https://modworkshop.net/mod/36084
Hooks:PostHook(CopMovement, "set_character_anim_variables", "Cop_GetMask", function(cop, ...)
	if cop._unit:inventory().CUS_preload_mask ~= nil then
		cop._unit:inventory():CUS_preload_mask()
	end
end)