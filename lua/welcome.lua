
Hooks:PostHook(NetworkPeer, "set_ip_verified", "welcome_text", function(self, state)
if not Network:is_server() or not AlvasMod then return end
local path = AlvasMod._path .. "welcome.txt"

if AlvasMod.settings.en_welcome then
  DelayedCalls:Add( "lobby_welcome_text_entry", 5, function()
  local file = io.open(path, "r")
  local text = ""
  
  if file then
    for line in file:lines() do
      text = text .. line
    end
    
    file.close()
  
    if Network:is_server() then
			welcome_name = self:name()
			local outputmsg = text:gsub( "$NAME", welcome_name)
      if AlvasMod.settings.en_elite_ultra then
        outputmsg = "\n" .. outputmsg .. "\n" .. "*** Difficulty: Elite Ultra ***"
      end
      
      AlvasMod:broadcast(outputmsg)
    end
  end
  end)
end

end)