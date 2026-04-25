Hooks:PostHook(ConnectionNetworkHandler, "kick_peer", "rebroadcast_host_kick", function (self)
  if not Network:is_server() or not AlvasMod then return end

  if managers and managers.network:session() then
    managers.network.matchmake:set_server_joinable(true) 
    managers.network:session():broadcast_server_up()
  end
end)

Hooks:PostHook(ConnectionNetworkHandler, "set_peer_left", "rebroadcast_host_left", function (self)
  if not Network:is_server() or not AlvasMod then return end
  
  if managers and managers.network:session() then
    managers.network.matchmake:set_server_joinable(true)  
    managers.network:session():broadcast_server_up()
  end
end)

local desync_count = 0

Hooks:PostHook(ConnectionNetworkHandler, "set_member_ready", "dwe_cnh_set_member_ready", function (self, peer_id, ready, mode, outfit_versions_str, sender)
    
  --this code handles players that for whatever reason cannot finish loading or join the game. 
  --it politely disconnects them and they are able to reconnect, which usually resolves the issue
  --it shows them as disconnected to all players including the host
  if mode == 1 and peer_id == 1 and Network:is_server() and Utils:IsInHeist() then
    desync_count = desync_count + 1
    
		local peer = self._verify_sender(sender)
		if peer and desync_count > 1 then
      managers.network._session:on_peer_kicked(peer, peer_id, 1)
      managers.network._session:send_to_peers("kick_peer", peer_id, 2)
      desync_count = 0
    end
  end 
end)
