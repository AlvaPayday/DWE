
local new_objective = {
    scan = true,
    is_default = true,
    type = "free",
    attitude = "engage"
  }

function CopLogicTravel.queued_update(data)
	local my_data = data.internal_data
  
	data.t = TimerManager:game():time()
	my_data.close_to_criminal = nil
	local delay = CopLogicTravel._upd_enemy_detection(data)

	if data.internal_data ~= my_data then
		return
	end
  
  if data and data.objective and data.objective.type == "follow" then
    if not alive(data.objective.follow_unit) then
      data.unit:brain():cancel_all_pathing_searches()
      CopLogicBase.cancel_queued_tasks(my_data)
      CopLogicBase.cancel_delayed_clbks(my_data)
      data.unit:brain():set_objective(new_objective)
      return
    end

  end
  
  
	CopLogicTravel.upd_advance(data)

	if data.internal_data ~= my_data then
		return
	end

	if not delay then
		debug_pause_unit(data.unit, "crap!!!", inspect(data))

		delay = 1
	end

	CopLogicTravel.queue_update(data, data.internal_data, delay)
end

function CopLogicTravel.upd_advance(data)
  if not data then return end
  if not data.unit then return end
  if not data.objective then return end
  if not data.internal_data then return end
  
	local unit = data.unit
	local my_data = data.internal_data
	local objective = data.objective
	local t = TimerManager:game():time()
	data.t = t


  if data.objective.type == "follow" then
    if not alive(data.objective.follow_unit) then
      data.unit:brain():cancel_all_pathing_searches()
      CopLogicBase.cancel_queued_tasks(my_data)
      CopLogicBase.cancel_delayed_clbks(my_data)
      data.unit:brain():set_objective(new_objective)
      return
    end
  end

	if my_data.has_old_action then
		CopLogicAttack._upd_stop_old_action(data, my_data)
	elseif my_data.warp_pos then
		local action_desc = {
			body_part = 1,
			type = "warp",
			position = mvector3.copy(objective.pos),
			rotation = objective.rot
		}

		if unit:movement():action_request(action_desc) then
			CopLogicTravel._on_destination_reached(data)
		end
	elseif my_data.advancing then
		if my_data.coarse_path then
			if my_data.announce_t and my_data.announce_t < t then
				CopLogicTravel._try_anounce(data, my_data)
			end

			CopLogicTravel._chk_stop_for_follow_unit(data, my_data)

			if my_data ~= data.internal_data then
				return
			end
		end
	elseif my_data.advance_path then
		CopLogicTravel._chk_begin_advance(data, my_data)

		if my_data.advancing and my_data.path_ahead then
			CopLogicTravel._check_start_path_ahead(data)
		end
	elseif my_data.processing_advance_path or my_data.processing_coarse_path then
		CopLogicTravel._upd_pathing(data, my_data)

		if my_data ~= data.internal_data then
			return
		end
	elseif my_data.cover_leave_t then
		if not my_data.turning and not unit:movement():chk_action_forbidden("walk") and not data.unit:anim_data().reload then
			if my_data.cover_leave_t < t then
				my_data.cover_leave_t = nil
			elseif data.attention_obj and AIAttentionObject.REACT_SCARED <= data.attention_obj.reaction and (not my_data.best_cover or not my_data.best_cover[4]) and not unit:anim_data().crouch and (not data.char_tweak.allowed_poses or data.char_tweak.allowed_poses.crouch) then
				CopLogicAttack._chk_request_action_crouch(data)
			end
		end
	elseif objective and (objective.nav_seg or objective.type == "follow") then
    
    if not alive(data.objective.follow_unit) then
      data.unit:brain():cancel_all_pathing_searches()
      CopLogicBase.cancel_queued_tasks(my_data)
      CopLogicBase.cancel_delayed_clbks(my_data)
      data.unit:brain():set_objective(new_objective)
      return
    end
    
		if my_data.coarse_path then
			if my_data.coarse_path_index == #my_data.coarse_path then
				CopLogicTravel._on_destination_reached(data)

				return
			else
				CopLogicTravel._chk_start_pathing_to_next_nav_point(data, my_data)
			end
		else
			CopLogicTravel._begin_coarse_pathing(data, my_data)
		end
	else
		CopLogicBase._exit(data.unit, "idle")

		return
	end
end

