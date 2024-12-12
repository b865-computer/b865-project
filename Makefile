SRC = $(wildcard src/*.asm)
OBJ = $(patsubst src/%.asm,build/%,$(SRC))
INCLUDE = $(wildcard include/*.h)

all: project

project: $(OBJ)
	aslink -i+ project.hex $(OBJ)

build/%: src/%.asm $(INCLUDE)
	asb865 -o+ $@ $<
