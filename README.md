[PL]

Witam prezentuje skrypt na dzwonek policyjny w wersji markera i pod qtarget poniżej wyjaśnie Config.

```
Config.DrawDistance         = 10.0 -- Odpowiada za odległość z jakiej widoczny jest blip (nie radzę dawać wysokiej liczby ze względu na optymalizację. 10 Wystarczy)
Config.Target               = false -- Jeśli nie chcecie markera na podłodze, ustawcie na "true" marker zniknie a pojawi się możliwość interakcji z targetem (w pliku znajduje się zdjęcie pokazujące lokacje interakcji)
Config.MarkerType           = 27 -- typ markera (można wziąść z https://docs.fivem.net/docs/game-references/markers/)
Config.MarkerSize           = {x = 1.5, y = 1.5, z = 1.0} -- wielkosć markera
Config.MarkerColor          = {r = 26, g = 29, b = 48} -- kolor markera

Config.Locations = {
    {
		Marker  = vector3(441.2, -982.14, 29.71),
	},
}

Powyższy kod configu odpowiada za ustanowienie lokalizacji dzwonka.
```

Jeśli ktoś z was ma ochotę zmienić lokalizację interakcji za pomocą targeta, musicie sobie poradzić sami.
Notify i HelpNotification nie są dołączone, są one tylko na preview ze względu na to że był on dawno nagrywany. W środku zastosowane zostały ESX.ShowHelpNotification i ESX.ShowNotification

W razie błędów proszę o informacje postaram się je naprawić.

https://streamable.com/7y1oww

^^Preview Link

[ENG]

Hi, here's my script for police bell. Supported framework is ESX only

```
Config.DrawDistance         = 10.0 -- If you want marker, this is the distance from where player will see the marker
Config.Target               = false -- if true it enabled qtarget support
Config.MarkerType           = 27 -- marker type (https://docs.fivem.net/docs/game-references/markers/)
Config.MarkerSize           = {x = 1.5, y = 1.5, z = 1.0} -- marker size
Config.MarkerColor          = {r = 26, g = 29, b = 48} -- marker color

Config.Locations = { -- marker locations
    {
		Marker  = vector3(441.2, -982.14, 29.71),
	},
}
```

If you want to change the location of the interact you are on your own (location is on the image inside)
Notify and HelpNotification are not included it is just on preview inside there are Default ESX.ShowNotification and ESX.ShowHelpNotification

https://streamable.com/7y1oww

^^Preview Link
