local verified_sender = false
local previous_state = ""

function PlayerManager:set_player_state(state,unit)
  --player state will need to be verified so that it cannot be abused.
  
  if state == "arrested" and unit:base()._tweak_table == "spooc" then
    verified_sender = true
  end
  
  if state == "incapacitated" and string.find(unit:base()._tweak_table, "tank") then
    verified_sender = true
  end
  
  previous_state = state
  
  self:set_player_state(state)
  
end

function PlayerManager:set_player_state(state)
	state = state or self._current_state
  
  if state == "arrested" or state == "incapacitated" then
    if not verified_sender then
      --self._current_state = "standard"
      return
    end
  end
  
--  if state == "bleed_out" then
--    local unit = managers.player:player_unit()
--    if unit:character_damage():health_ratio() > 0 then
--      return
--    end
--  end
  
  

	if state == "bleed_out" and self._super_syndrome_count and self._super_syndrome_count > 0 then
		if Network:is_server() then
			managers.groupai:state():set_super_syndrome(managers.network:session():local_peer():id(), true)
		else
			managers.network:session():send_to_host("sync_set_super_syndrome", managers.network:session():local_peer():id(), true)
		end
	end

	if state == "standard" and self:get_my_carry_data() then
		state = "carry"
	end

	if state == self._current_state then
		return
	end

	if state ~= "standard" and state ~= "carry" and state ~= "bipod" and state ~= "jerry1" and state ~= "jerry2" and state ~= "tased" then
		local unit = self:player_unit()

		if unit then
			unit:character_damage():disable_berserker()
		end
	end

	if (state == "clean" or state == "mask_off" or state == "civilian") and self._current_state ~= "clean" and self._current_state ~= "mask_off" and self._current_state ~= "civilian" then
		managers.groupai:state():calm_ai()
	end

	if not self._player_states[state] then
		Application:error("State '" .. tostring(state) .. "' does not exist in list of available states.")

		state = self._DEFAULT_STATE
	end

	if table.contains(self._sync_states, state) then
		self._current_sync_state = state
	end

	self._current_state = state

	self:_change_player_state()
  
  previous_state = state
  verified_sender = false
  
end

