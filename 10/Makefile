NAME=example

SRC=$(NAME).asm

FLAGSYASM=-g dwarf2 -f elf64

OBJ=$(SRC:.asm=.o)

LIST=$(SRC:.asm=.lst)

all: $(NAME)

$(NAME): $(OBJ)
	ld -g -o $(NAME) $(OBJ)

%.o: %.asm
	yasm $(FLAGSYASM) -l $(@:.o=.lst) -o $@ $<

clean:
	find . -name "*.o" -o -name ".*.sw[pon]" -o -name "*.lst" -exec rm -rf {} \;
	rm -rf $(OBJ)
	rm -rf $(LIST)

fclean: clean
	rm -rf $(NAME)

re: fclean all

.PHONY: all, clean, fclean, re
