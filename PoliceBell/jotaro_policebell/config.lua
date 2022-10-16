Config = {}
Config.DrawDistance         = 10.0
Config.Target               = false -- if true = enable qtarget support
Config.MarkerType           = 27
Config.MarkerSize           = {x = 1.5, y = 1.5, z = 1.0}
Config.MarkerColor          = {r = 26, g = 29, b = 48}

Config.Locations = {
    {
		Marker  = vector3(441.2, -982.14, 29.71),
	},
}

Config.Translations = {
	['must_wait'] = 'Musisz poczekać %s sekund',
	['waiting_for_police'] = 'Ktoś oczekuje na Funkcjonariusza na Komendzie!',
	['target_label'] = 'Zadzwoń Dzwonkiem',
	['press'] = 'Naciśnij ~INPUT_CONTEXT~, aby zadzwonić dzwonkiem',
-- ^^ Polish Translations

--	['must_wait'] = 'You must wait %s seconds before next use!',
--	['waiting_for_police'] = 'Someone is waiting for a cop in Police Station!'
--	['target_label'] = 'Use Bell',
--	['press'] = 'Press ~INPUT_CONTEXT~, to use bell',
-- ^^ English Translations
}