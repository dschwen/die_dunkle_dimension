VICE_OK := $(shell c1541 -h 2> /dev/null; echo $$?)
ifeq ($(VICE_OK),127)
    $(error "Please install vice to extract the DDD files")
endif

.PHONY: all
all: data

.PHONY: images
images: c64/Dddc1.d64 c64/Dddc2.d64 c64/Dddc3.d64

c64/die_dunkle_dimension.zip:
	curl -o c64/die_dunkle_dimension.zip 'http://www.c64games.de/f133/d/die_dunkle_dimension.zip'

c64/Dddc1.d64: c64/die_dunkle_dimension.zip
	unzip -d c64 c64/die_dunkle_dimension.zip Dddc1.d64

c64/Dddc2.d64: c64/die_dunkle_dimension.zip
	unzip -d c64 c64/die_dunkle_dimension.zip Dddc2.d64

c64/Dddc3.d64: c64/die_dunkle_dimension.zip
	unzip -d c64 c64/die_dunkle_dimension.zip Dddc3.d64

.PHONY: data
data: images
	cd c64; \
	mkdir -p DDD1 DDD2 DDD3; \
	for n in 1 2 3; do cd DDD$$n; pwd;  c1541 -attach ../Dddc$$n.d64 -extract; cd ..; done
