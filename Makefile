SRC = $(wildcard src/*.asm)
OBJ = $(patsubst src/%.asm,build/%.rel,$(SRC))

all: project

project: project.hex

project.hex: $(OBJ)
	aslink -i+ project.hex -a CODE=0x8000 $(OBJ)

build/%.rel: src/%.asm Makefile
	asb865 -o+ $@ $<
