SRC = $(wildcard src/*.asm)
OBJ = $(patsubst src/%.asm,build/%.rel,$(SRC))
# DBG_SYM = $(patsubst %.rel,%.cdb,$(OBJ))

NAME = project

all: $(NAME)

$(NAME): $(NAME).hex

project.hex: $(OBJ)
	sdld	-n -y -i+ $(NAME).hex -b CODE=0x8000 $(OBJ)
	echo	'{"name": "$(NAME)", "dbg": "$(NAME).cdb"}' > $(NAME).b865
	objcopy	-I ihex -O binary $(NAME).ihx $(NAME).bin

build/%.rel: src/%.asm Makefile
	sdasb865	-g -y -s -o $@ $<

clean:
	rm	 build/*