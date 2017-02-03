.PHONY: all

all: c64/Dddc1.d64 c64/Dddc1.d64 c64/Dddc1.d64

c64/die_dinkle_dimension.zip:
	curl -o c64/die_dunkle_dimension.zip 'http://www.c64games.de/f133/d/die_dunkle_dimension.zip'

c64/Dddc1.d64: c64/die_dinkle_dimension.zip
	unzip -d c64 c64/die_dinkle_dimension.zip Dddc1.d64

c64/Dddc2.d64: c64/die_dinkle_dimension.zip
	unzip -d c64 c64/die_dinkle_dimension.zip Dddc2.d64

c64/Dddc3.d64: c64/die_dinkle_dimension.zip
	unzip -d c64 c64/die_dinkle_dimension.zip Dddc3.d64
