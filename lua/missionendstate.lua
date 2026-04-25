local oldfunc = MissionEndState.at_enter

function MissionEndState:at_enter(...)
  
  oldfunc(self, ...)
  
  if not managers.crime_spree:is_active() then
    self:set_completion_bonus_done(true)
  end

end