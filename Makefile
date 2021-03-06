VICE_OK := $(shell c1541 -h 2> /dev/null; echo $$?)
ifeq ($(VICE_OK),127)
    $(error "Please install vice to extract the DDD files")
endif

C64DIR := c64

.PHONY: all
all:
	@echo "Make targets (run 'make \"target\"')"
	@echo    "data    - downloads and unpacks the data from the DDD c64 disk images"
	@echo    "images  - downloads the DDD c64 disk images"
	@echo    "palette - generates C64 palette data from the colodore.com image"
	@echo    "basic   - convert all basic programs to source"

.PHONY: images
images: c64/Dddc1.d64 c64/Dddc2.d64 c64/Dddc3.d64

c64/die_dunkle_dimension.zip:
	@curl -o c64/die_dunkle_dimension.zip 'http://www.c64games.de/f133/d/die_dunkle_dimension.zip'
	@touch c64/die_dunkle_dimension.zip

c64/Dddc1.d64: c64/die_dunkle_dimension.zip
	@unzip -d c64 c64/die_dunkle_dimension.zip Dddc1.d64
	@touch c64/Dddc1.d64

c64/Dddc2.d64: c64/die_dunkle_dimension.zip
	@unzip -d c64 c64/die_dunkle_dimension.zip Dddc2.d64
	@touch c64/Dddc2.d64

c64/Dddc3.d64: c64/die_dunkle_dimension.zip
	@unzip -d c64 c64/die_dunkle_dimension.zip Dddc3.d64
	@touch c64/Dddc3.d64

.PHONY: data
data: images
	@cd c64; \
	mkdir -p DDD1 DDD2 DDD3; \
	for n in 1 2 3; do cd DDD$$n; pwd;  c1541 -attach ../Dddc$$n.d64 -extract; cd ..; done

.PHONY: palette
palette: c64/colodore_vic2.png
	@convert c64/colodore_vic2.png -format %c -depth 8 histogram:info:- \
	  | cut -d\( -f2 | cut -d\) -f1 | sed 's/ //g' \
	  | awk '{ print "[" $$1 "], " }'


TWN_FILES    := $(shell find $(C64DIR) -name 'ddd.twn?' -or -name ddd.konj -or -name ddd.prep -or -name ddd.dbas -or -name ddd.boot)
BASIC_SOURCES := $(TWN_FILES:=.txt)

%.txt: %
	@petcat -2 -o $@ -- $<

.PHONY: basic
basic: $(BASIC_SOURCES)


.PHONY: disassemble
disassemble:
	# disassembling main loader
	@./contrib/dis/dis -l -type prg -c 0334 c64/DDD1/dunkle\ dimension > c64/DDD1/dunkle\ dimension.asm
	# disassembling assembler routines
	@./contrib/dis/dis -l -t prg -i `./src/entrypts.py -dis c64/DDD1/ddd.asmb c64/DDD?/ddd.twn?.txt` c64/DDD1/ddd.asmb > c64/DDD1/ddd.asmb.asm
	# disassembling title file
	@./contrib/dis/dis -l -t prg -i `./src/entrypts.py -dis c64/DDD1/ddd.dcod c64/DDD?/ddd.dbas.txt` c64/DDD1/ddd.dcod > c64/DDD1/ddd.dcod.asm
	# disassembling dungeon assembler routines
	@./contrib/dis/dis -l -t prg -i `./src/entrypts.py -dis c64/DDD3/ddd.assm c64/DDD3/ddd.twn[mp].txt` c64/DDD3/ddd.assm > c64/DDD3/ddd.assm.asm

.PHONY: maps
maps:
	# town and castle maps
	@for map in `find c64 -name ddd.map\? -size 1507c`; \
	do \
	  ./src/map2png.py $$map $${map/map/chr}; \
	done
	# world map
	@./src/worldmap2png.py
	# druid cottage
	@./src/map2png.py c64/DDD1/ddd.mapb c64/DDD1/ddd.chrb 11

CHR_FILES  := $(shell find $(C64DIR) -name 'ddd.chr?')
CHR_IMAGES := $(CHR_FILES:=.png)

%.png: %
	@./src/chr2png.py $<
	@./src/tiles2png.py $<

.PHONY: chars
chars: $(CHR_IMAGES)

.PHONY: sprites
	@./src/spr2png.py

.PHONY: gather
gather: chars maps sprites
	@mv c64/*/*.png res
