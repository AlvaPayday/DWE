local function firstToUpper(str)
    return (str:gsub("^%l", string.upper))
end


Hooks:PostHook(ChatManager, "_receive_message", "msg_chmgr", function(self,channel_id, name, message, color, icon)
    if not Network:is_server() or not AlvasMod then return end
    
    message = string.lower(message)
    
    if message == "modinfo" then
      local chosenpeer = nil
      
      for _, peer in pairs(managers.network:session():all_peers()) do
          if peer:name() == name then
            chosenpeer = peer
            break
          end
      end
      
      local file = io.open(AlvasMod._path .. "modinfo.txt","r")
      
      if file and chosenpeer then
        local text = ""
        
        for line in file:lines() do 
          text = text .. line .. "\n"
        end
        
        managers.network:session():send_to_peer(chosenpeer, "send_chat_message", 1, text)
      else
--        text = "file or chosenpeer is null"
--        AlvasMod:msg(text)
      end 
      
      file:close()
      
    end
    
    if message == "stat" then
      if elite_task_data.phase == nil or elite_task_data.phase_end == nil or elite_task_data.assault_current_pool == 0 or elite_task_data.assault_max_pool == 0 or elite_task_data.assault_threshold == 0 then
        AlvasMod:broadcast("stats not available yet")
        return
      end
      
      local remaining = math.floor((elite_task_data.phase_end - TimerManager:game():time()))
      local current = math.floor(elite_task_data.assault_current_pool)
      local max = math.floor(elite_task_data.assault_max_pool)
      local min = math.floor(elite_task_data.assault_threshold)

      if not remaining or remaining < 0 then remaining = 0 end
      
      local text = "\n" .. "______ Assault Info ______" .. "\n"
      text = text .. "total: " .. tostring(current) .. "   max: " .. tostring(max) .. "   min: " .. tostring(min) .. "\n"
      text = text ..       "______ Assault Phase _____" .. "\n"
      text = text .. elite_task_data.phase .. "   time left: " .. tostring(remaining) .. " seconds" .. "\n"
      AlvasMod:broadcast(text)
    end
    
end)

Hooks:PostHook(ChatManager, "send_message", "send_msg_chmgr", function(self,channel_id, sender, message)
  if not Network:is_server() or not AlvasMod then return end

  message = string.lower(message)
   
  if message == "modinfo" then
      
    	local peer = managers.network:session():local_peer()
      local file = io.open(AlvasMod._path .. "modinfo.txt","r")
      
      if file and peer then
        local text = ""
        
        for line in file:lines() do 
          text = text .. line .. "\n"
        end
        managers.chat:feed_system_message(ChatManager.GAME,  text)
        file:close()
      else
        if not file then 
          local text = "file not found"
          managers.chat:feed_system_message(ChatManager.GAME,  text)
        end
        
        if not peer then
          local text = "peer not found"
          managers.chat:feed_system_message(ChatManager.GAME,  text)
        end
        
        
      end   
  end
  
end)

