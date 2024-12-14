SRC = $(wildcard src/*.asm)
OBJ = $(patsubst src/%.asm,build/%.rel,$(SRC))
DBG_SYM = $(patsubst %.rel,%.noi,$(OBJ))

NAME = project

all: $(NAME)

$(NAME): $(NAME).hex config.json

project.hex: $(OBJ)
	aslink -n -j -i+ $(NAME).hex -a CODE=0x8000 $(OBJ)

build/%.rel: src/%.asm Makefile
	asb865 -j -o+ $@ $<

config.json: $(DBG_SYM) Makefile
	echo {"name": "$(NAME)", "dbg": "$<"} > $@
