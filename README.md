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
Dołączam jeszcze skrypt dopeNotify ponieważ pod niego robiłem eksporty odpowiadające za powiadomienie w skrypcie. Można je zamienić jednak też samemu.

W razie błędów proszę o informacje postaram się je naprawić.

https://streamable.com/7y1oww

^^Preview
