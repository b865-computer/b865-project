SRC = $(wildcard src/*.asm)
OBJ = $(patsubst src/%.asm,build/%.rel,$(SRC))
DBG_SYM = $(patsubst %.rel,%.noi,$(OBJ))

NAME = project

all: $(NAME)

$(NAME): $(NAME).hex

project.hex: $(OBJ)
	$(eval DBG_SYM := $(patsubst %.rel,%.noi,$<))
	aslink	-n -j -i+ $(NAME).hex -a CODE=0x8000 $(OBJ)
	echo	{"name": "$(NAME)", "dbg": "$(DBG_SYM)"} > config.json

build/%.rel: src/%.asm Makefile
	asb865	-g -j -s -o+ $@ $<

clean:
	rm	 build/*