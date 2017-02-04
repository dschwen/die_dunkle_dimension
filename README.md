[Areas of the game](AREAS.md), [Game files](DDDFILES.md),


# Maps

All map images are built by running

```
make gather
```

and can be found in the `res` directory.

## World map

The world map is shown to consist of 39*4 x 39*4 tiles (can be seen in the pencil drawing of the map available on the web). The
data seems to be stored in `DDD1/ddd.mapa` and can be plotted with

```
./src/map2png.py c64/DDD1/ddd.mapa 52
```

It looks like the map file contains a `52 x 52*2` data set (52*3 == 39*4).

![](res/ddd.mapa.png)

## Submaps

Most submaps of towns and castles are 35 tiles wide.

```
./src/map2png.py c64/DDD1/ddd.mapc 35
```

![](res/ddd.mapc.png)
![](res/ddd.mapd.png)
![](res/ddd.mape.png)
![](res/ddd.mapf.png)
![](res/ddd.mapg.png)
![](res/ddd.maph.png)
![](res/ddd.mapi.png)
![](res/ddd.mapj.png)
![](res/ddd.mapk.png)
![](res/ddd.mapl.png)
![](res/ddd.mapo.png)
![](res/ddd.mapq.png)


The druid cottage is 11 tiles wide.

![](res/ddd.mapb.png)

# Graphics

## Extracting palette data

Go to http://www.colodore.com/ and fine tune the palette. Click on the cog wheel
icon in the top right corner and select "PNG Format" to download the palette as
a png file. Use

```
make palette
```

to extract the color info.

## Charsets

```
make chars
```

![](res/ddd.chra.png)
![](res/ddd.chrb.png)
![](res/ddd.chrc.png)
![](res/ddd.chrd.png)
![](res/ddd.chre.png)
![](res/ddd.chrf.png)
![](res/ddd.chrg.png)
![](res/ddd.chrh.png)
![](res/ddd.chri.png)
![](res/ddd.chrj.png)
![](res/ddd.chrk.png)
![](res/ddd.chrl.png)
![](res/ddd.chrm.png)
![](res/ddd.chrn.png)
![](res/ddd.chro.png)
![](res/ddd.chrq.png)

## Sprites

Only one spritesheet seems to be present and it looks like it should be a multicolor sprite

![](res/ddd.dspr.png)
