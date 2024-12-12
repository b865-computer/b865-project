SRC = $(wildcard src/*.asm)
SRCOBJ = $(SRC:.asm=.rel)
OBJ = $(SRCOBJ:src=build)
INCLUDE = $(wildcard include/*.h)

all: project

project: $(OBJ)
	aslink -i $(OBJ)

build/%.rel: src/%.asm $(INCLUDE)
	asb865 -o $(@F)
