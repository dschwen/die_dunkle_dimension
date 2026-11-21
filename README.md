[Areas of the game](AREAS.md) | [Game files](DDDFILES.md) | [Game state area](FLAGS.md) | [Maps (spoilers!)](MAPS.md) | [Web app](WEBAPP.md)

# Die Dunkle Dimension

### ▶ [Play it in your browser](https://dschwen.github.io/die_dunkle_dimension/)

[![The Dark Dimension title picture](art/enhanced/en/ddd.titl.png)](https://dschwen.github.io/die_dunkle_dimension/)

**[dschwen.github.io/die_dunkle_dimension](https://dschwen.github.io/die_dunkle_dimension/)** – the complete 1990 C64
fantasy role-playing game by German Design Group, running in the browser on the original game code: full story,
combat and first-person dungeons, original music and sound, save games in the browser. In German or English, as the
regular (original) or the enhanced edition. See [WEBAPP.md](WEBAPP.md) for how it works.

This repository also documents the reverse engineering of the game's files, graphics and data.

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

### ...and the tiles they make up

![](res/ddd.chra.tiles.png)
![](res/ddd.chrb.tiles.png)
![](res/ddd.chrc.tiles.png)
![](res/ddd.chrd.tiles.png)
![](res/ddd.chre.tiles.png)
![](res/ddd.chrf.tiles.png)
![](res/ddd.chrg.tiles.png)
![](res/ddd.chrh.tiles.png)
![](res/ddd.chri.tiles.png)
![](res/ddd.chrj.tiles.png)
![](res/ddd.chrk.tiles.png)
![](res/ddd.chrl.tiles.png)
![](res/ddd.chrm.tiles.png)
![](res/ddd.chrn.tiles.png)
![](res/ddd.chro.tiles.png)
![](res/ddd.chrq.tiles.png)

## Sprites

Only one spritesheet seems to be present and it looks like it should be a multicolor sprite

![](res/ddd.dspr.png)
