SRC = $(wildcard src/*.asm)
OBJ = $(patsubst src/%.asm,build/%.rel,$(SRC))

NAME = project

all: $(NAME)

$(NAME): $(NAME).ihx

$(NAME).ihx: $(OBJ)
	echo	$(OBJ)  | tr ' ' '\n' > $(NAME).lnk
	sdld	-n -m -u -y -b CODE=0x8000 -i+ $(NAME).ihx -f $(NAME)
	echo	'{"name": "$(NAME)", "dbg": "$(NAME).cdb", "bin": "$(NAME).bin", "map": "$(NAME).map"}' > $(NAME).b865
	objcopy	-I ihex -O binary $(NAME).ihx $(NAME).bin

build/%.rel: src/%.asm Makefile
	sdasb865	-plosgffy -o $@ $<

clean:
	rm	 -f build/*.cdb build/*.lst build/*.map build/*.omf build/*.rel build/*.rst build/*.sym
	rm	 -f *.b865 *.bin *.cdb *.ihx *.lnk *.map *.omf