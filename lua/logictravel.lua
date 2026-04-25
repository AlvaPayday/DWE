local new_objective = {
  type = "free",
  scan = true,
  action = {
			variant = "idle",
			body_part = 1,
			type = "act",
			blocks = {
				action = -1,
				walk = -1
      }
  }
}

--Hooks:PreHook(CopLogicTravel, "upd_advance", "dwe_clt_upd_advance", function (self, data)
--  if not data then return end
--  if not data.objective then return end
    
--  if data.objective.type == "follow" then
--     if not data.objective.follow_unit or not alive(data.objective.follow_unit) then
--       AlvasMod:log("chk_stop_for_follow_unit : caught nil follow unit")
--       data.unit:brain():cancel_all_pathing_searches()
--       CopLogicBase.cancel_queued_tasks(data.internal_data)
--       CopLogicBase.cancel_delayed_clbks(data.internal_data)
--       data.unit:brain():set_objective(new_objective)
--       return
--     end
--  end 
--end)

--Hooks:PreHook(CopLogicTravel, "_chk_stop_for_follow_unit", "dwe_clt_chk_stop_for_follow_unit", function (self, data, my_data)
--  if not data then return end
--  if not data.objective then return end
    
--  if data.objective.type == "follow" then
--     if not data.objective.follow_unit or not alive(data.objective.follow_unit) then
--       AlvasMod:log("chk_stop_for_follow_unit : caught nil follow unit")
--       data.unit:brain():cancel_all_pathing_searches()
--       CopLogicBase.cancel_queued_tasks(data.internal_data)
--       CopLogicBase.cancel_delayed_clbks(data.internal_data)
--       data.unit:brain():set_objective(new_objective)
--       return
--     end
--  end
    
--end)
