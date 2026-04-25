Hooks:PostHook(SkirmishTweakData, "_init_wave_phase_durations", "dwe_init_wave_phase_durations", function (self, tweak_data)
    if not AlvasMod then return end
    
    local skirmish_data = tweak_data.group_ai.skirmish
    
    skirmish_data.assault.anticipation_duration = {
		{
			15,
			15
		}
	}
	skirmish_data.assault.build_duration = 15
	skirmish_data.assault.sustain_duration_min = {
		120,
		120,
		120
	}
	skirmish_data.assault.sustain_duration_max = {
		120,
		120,
		120
	}
	skirmish_data.assault.sustain_duration_balance_mul = {
		1,
		1,
		1,
		1
	}
	skirmish_data.assault.fade_duration = 5
	skirmish_data.assault.delay = {
		10,
		15,
		25
	}
  
    
end)

