--Hooks:PreHook(MissionManager, "to_server_area_event", "process_event_triggers", function(self, event_id, id, unit)
--  if not Network:is_server() then return end
--  if not AlvasMod then return end
--  if managers and managers.chat then
--    AlvasMod:msg("pre event_id: " .. tostring(event_id) .. " id: " .. tostring(id))
--  end
  
----	for name, data in pairs(self._scripts) do
----		local element = data:element(id)
----		if element and AlvasMod.settings.specialMap then
----      --reserved
----		end
----	end
--end)

--Hooks:PostHook(MissionManager, "to_server_area_event", "process_event_triggers", function(self, event_id, id, unit)
--  if not Network:is_server() then return end
--  if not AlvasMod then return end
--  if managers and managers.chat then
--    AlvasMod:msg("post event_id: " .. tostring(event_id) .. " id: " .. tostring(id))
--  end
  
----	for name, data in pairs(self._scripts) do
----		local element = data:element(id)
----		if element and AlvasMod.settings.specialMap then
----      --reserved
----		end
----	end
--end)


--Hooks:PostHook(MissionManager, "client_run_mission_element", "djhskfd", function (self, id, unit, orientation_element_index, id_from)
--    AlvasMod:msg("client_run: " .. tostring(id))
--end)

--Hooks:PostHook(MissionManager, "server_run_mission_element_trigger", "hjgsd0989dg", function (self, id, unit)
--    AlvasMod:msg("server_run: " .. tostring(id))
--end)
