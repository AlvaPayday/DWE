function throwGrenade(owning_unit,target_pos)
  -- function for taser to throw electric grenade at player
  
  local throw_dis = mvector3.distance(owning_unit:position(),target_pos)
  
  local mov_ext = owning_unit:movement()
  local head_pos = mov_ext:m_head_pos()
  
  local throw_from = head_pos + mov_ext:m_head_rot():y() * 50
  local throw_dir = Vector3()

	mvector3.lerp(throw_dir, throw_from, target_pos, 0.3)
	mvector3.subtract(throw_dir, throw_from)
  local dis_lerp = math.clamp((throw_dis - 1000) / 1000, 0, 1)
	local compensation = math.lerp(0, 300, dis_lerp)
  mvector3.set_z(throw_dir, throw_dir.z + compensation)
	mvector3.normalize(throw_dir)
  
  if mov_ext:play_redirect("throw_grenade") then
		managers.network:session():send_to_peers_synched("play_distance_interact_redirect", owning_unit, "throw_grenade")
	end
  
  local	unit = "units/pd2_dlc_sawp/weapons/wpn_launcher_electric/wpn_launcher_electric"
  
  local grenade = World:spawn_unit(Idstring(unit), throw_from, Rotation())
  	grenade:base():throw({
		dir = throw_dir,
		projectile_entry = "gre_m79"
	})
  
end

function releaseHusk()
  
  for u_key, u_data in pairs(managers.groupai:state():all_AI_criminals()) do
		if u_data and alive(u_data.unit) then
      local unit = u_data.unit
      if unit:movement():tased() then
        unit:movement():on_tase_ended()
      end
      
    end
  end

end


Hooks:PostHook(TaserLogicAttack, "_upd_aim", "taser_throw_grenade_chk", function(self, data, my_data, reaction)

if not Network:is_server() or not AlvasMod then return end

local peer = AlvasMod:nearestPeer(data.unit:position())
if peer == nil then return end

local rnd = math.random(1,10)
if rnd > 3 then return end

local pos = peer:unit():position()
local distance = mvector3.distance(pos,data.unit:position())
if distance > 200 then
  local attention_data = {
		unit = peer:unit()
	}
  
  data.unit:movement():set_attention(attention_data)
  local hitPos = peer:unit():position()
  
  throwGrenade(data.unit,hitPos)
  
  DelayedCalls:Add("tase_bomb_plyr_check", 2.5, function()
      --electric grenade set to 2.5 second timer. check distance 
      if peer and peer:unit() and peer:unit():position() then
      local distance = mvector3.distance(hitPos, peer:unit():position())
        if distance < 350 then
          sync_player(peer, "tased")
        end
      end
  end)


  DelayedCalls:Add("untase_me_bro", 5, function()
      --2 second tase duration
      if peer and peer:unit() then
        local state = AlvasMod:unit_state(peer:unit())
        if state and state == "tased" then
          sync_player(peer, "standard")
          
        end
     end
     --release ai players from never-ending tase
     releaseHusk()
  end)

end
    
end)




