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
	  | awk '{ print "[" $1 "], " }'


TWN_FILES    := $(shell find $(C64DIR) -name 'ddd.twn?')
BASIC_SOURCES := $(TWN_FILES:=.txt)

%.txt: %
	@petcat -2 -o $@ -- $<

.PHONY: basic
basic: $(BASIC_SOURCES)

CHR_FILES  := $(shell find $(C64DIR) -name 'ddd.chr?')
CHR_IMAGES := $(CHR_FILES:=.png)

%.png: %
	@./src/chr2png.py $<

.PHONY: chars
chars: $(CHR_IMAGES)
