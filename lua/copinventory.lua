--modified code borrowed from "Everyone wears a covid face mask" 
--https://modworkshop.net/mod/36084
Hooks:PostHook(CopInventory, "init", "Cop_SetMaskInit", function(self, cop, ...)
  if not AlvasMod then return end

  local unit_name = self._unit:base()._tweak_table
  
  if unit_name == "spooc" or unit_name == "marshal_marksman" or unit_name == "marshal_shield" then
      self._mask_unit_name = "units/payday2/masks/msk_skullhard/msk_skullhard"
  end
end)

function CopInventory:CUS_Can_I_Have_Mask()
	if not self._mask_unit_name or not self._mask_unit_name:find("masks") or self._mask_unit_name:find("NONE") then
		return false
	end
	return true
end

function CopInventory:CUS_preload_mask()
	if not self or not self:CUS_Can_I_Have_Mask() then
		return
	end
	self._mask_visibility = true
  
	managers.dyn_resource:load(Idstring("unit"), Idstring(self._mask_unit_name), managers.dyn_resource.DYN_RESOURCES_PACKAGE, callback(self, self, "CUS_clbk_mask_unit_loaded"))
end

function CopInventory:CUS_clbk_mask_unit_loaded(status, asset_type, asset_name)
	self._mask_unit_loaded = status
	self:CUS_reset_mask_visibility()
end

function CopInventory:CUS_unload_mask()
	if not self:CUS_Can_I_Have_Mask() then
		return
	end
	managers.dyn_resource:unload(Idstring("unit"), Idstring(self._mask_unit_name), DynamicResourceManager.DYN_RESOURCES_PACKAGE, false)
	self._mask_unit_name = nil
end

function CopInventory:CUS_reset_mask_visibility()
	self:CUS_set_mask_visibility(self._mask_visibility and true or false)
end

function CopInventory:CUS_pre_destroy(unit)
	CopInventory.super.pre_destroy(self, unit)
	self:CUS_unload_mask()
end

function CopInventory:CUS_set_mask_visibility(state)
	if not self:CUS_Can_I_Have_Mask() then
		return
	end
	if self._unit == managers.player:player_unit() then
		return
	end
	local character_name = managers.criminals:character_name_by_unit(self._unit)
	if character_name then
		return
	end
	self._mask_visibility = state
	if alive(self._mask_unit) then
		if not state then
			for _, linked_unit in ipairs(self._mask_unit:children()) do
				linked_unit:unlink()
				World:delete_unit(linked_unit)
			end
			self._mask_unit:unlink()
			local name = self._mask_unit:name()
			World:delete_unit(self._mask_unit)
		end
		return
	end
	if not state then
		return
	end
	local mask_align = self._unit:get_object(Idstring("Head"))
	if not mask_align then
		return
	end
  
local blueprint = {
	material = {
		id = "plastic",
		global_value = "normal"
	},
	pattern = {
		id = "no_color_full_material",
		global_value = "normal"
	},
	mask_colors = {
		id = "nothing",
		global_value = "normal"
	},
	color_a = {
		id = "nothing",
		global_value = "normal"
	},
	color_b = {
		id = "nothing",
		global_value = "normal"
	},
	color_c = {
		id = "strip_paint",
		global_value = "normal"
	}
}

 
  
  local mask_unit = World:spawn_unit(Idstring(self._mask_unit_name), mask_align:position(), mask_align:rotation())
	if not mask_unit or not alive(mask_unit) then
		return
	end
  
  mask_unit:base():apply_blueprint(blueprint, nil)
  
	self._unit:link(mask_align:name(), mask_unit, mask_unit:orientation_object():name())
	self._mask_unit = mask_unit
	local backside = World:spawn_unit(Idstring("units/payday2/masks/msk_backside/msk_backside"), mask_align:position(), mask_align:rotation())
	self._mask_unit:link(self._mask_unit:orientation_object():name(), backside, backside:orientation_object():name())
  
  self._mask_visibility = true
  local unit = self._mask_unit
  unit:set_extension_update_enabled(Idstring("sync_unit_data"), true)
  managers.network:session():send_to_peers("add_unit", unit)
  managers.network:session():send_to_peers_synched("sync_unit_event_id_16", unit, "base", 1)
end


Hooks:PostHook(CopInventory, "on_shield_break", "dwe_ci_on_shield_break", function (self, attacker_unit)
    local distance = mvector3.distance(self._unit:position(), attacker_unit:position())
    if distance > 100 and math.random(1,10) > 3 then
      AlvasMod:throwMolotov(self._unit,attacker_unit:position())
    end
end)



