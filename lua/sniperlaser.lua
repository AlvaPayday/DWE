Hooks:PostHook(CopLogicSniper, "_upd_aim", "check_sniper_laser", function(data,my_data)
     if not AlvasMod then return end
     data.unit:inventory():equipped_unit():base():set_laser_enabled(true)
     my_data.weapon_laser_on = true
     data.unit:base():prevent_main_bones_disabling(true)
     managers.network:session():send_to_peers_synched("sync_unit_event_id_16", data.unit, "brain", HuskCopBrain._NET_EVENTS.weapon_laser_on)

end)
