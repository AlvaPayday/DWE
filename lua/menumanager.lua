if not MenuHelper then
	return
end

local key = ModPath .. '	' .. RequiredScript
if _G[key] then return else _G[key] = true end

local function _switch()
  local file = io.open(AlvasMod._path .. "enabled.dat", "w")
  if file then
    local value = AlvasMod.settings.en_alvasmod
    file:write(tostring(value))
    file:flush()
    file:close()
  end   
end




Hooks:Add('LocalizationManagerPostInit', 'LocalizationManagerPostInit_AlvasMod', function(loc)
	local language_filename

	local modname_to_language = {
		['PAYDAY 2 THAI LANGUAGE Mod'] = 'thai.txt',
	}
	for _, mod in pairs(BLT and BLT.Mods:Mods() or {}) do
		language_filename = mod:IsEnabled() and modname_to_language[mod:GetName()]
		if language_filename then
			break
		end
	end

	if language_filename then
		loc:load_localization_file(AlvasMod._path .. 'loc/' .. language_filename)
	end
	loc:load_localization_file(AlvasMod._path .. 'loc/english.txt', false)
end)

Hooks:Add('MenuManagerInitialize', 'MenuManagerInitialize_AlvasMod', function(menu_manager)

	MenuCallbackHandler.AlvasModMenuCheckboxClbk = function(this, item)
    if AlvasMod then
      
      AlvasMod.settings[item:name()] = item:value() == 'on'
    
      if item:name() == "en_alvasmod" and not Utils:IsInGameState() then
        _switch()
      end
    end
  end
  
	MenuCallbackHandler.AlvasModMenuValueClbk = function(this, item)
    if AlvasMod then
		AlvasMod.settings[item:name()] = math.floor(item:value())
    end
	end

	MenuCallbackHandler.AlvasModSave = function(this, item)
    if AlvasMod then
		AlvasMod:save()
    end
	end
  
  
	AlvasMod:load()

	MenuHelper:LoadFromJsonFile(AlvasMod._path .. 'options.txt', AlvasMod, AlvasMod.settings)

end)

