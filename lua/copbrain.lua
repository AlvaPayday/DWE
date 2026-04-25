--function CopBrain:on_follow_unit_destroyed(data)
--AlvasMod:log("on_follow_unit_destroyed")
--local new_objective = {
--    is_default = true,
--    type = "free",
--    attitude = "engage"
--  }

--if data and data.unit and data.unit:brain() then
--  data.unit:brain():cancel_all_pathing_searches()
--  data.unit:brain():set_objective(new_objective)
--  AlvasMod:log("unit_destroyed_finished_logic")
--end

--end
