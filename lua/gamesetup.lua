-- TODO: possibly add zeal units as an option on ultra

--Hooks:PostHook(GameSetup, "load_packages", "dwe_load_zeal", function (self)
--	if not PackageManager:loaded("packages/sm_wish") then
--		table.insert(self._loaded_diff_packages, "packages/sm_wish")
--		PackageManager:load("packages/sm_wish")
--	end
--end)