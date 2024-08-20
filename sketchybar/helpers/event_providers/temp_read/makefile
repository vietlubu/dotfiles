all: bin/temp_read

bin/temp_read: temp_read.c temp.h ../sketchybar.h | bin
	clang -std=c99 -O3 temp_read.c -o bin/temp_read -framework IOKit

bin:
	mkdir -p bin

