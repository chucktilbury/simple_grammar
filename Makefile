

CC = gcc
OBJS	=	scanner.o \
			main.o \
			parser.o \
			pointer_list.o

OPT = -g -std=c11 -Wall -Wextra -Wpedantic -pedantic

%.o: %.c
	$(CC) -c $(OPT) $< -o $@

simp: $(OBJS)
	$(CC) $(OPT) $^ -o $@

scan.gen.h scanner.c: scanner.l
	flex scanner.l

#$(CC) -c $(OPT) -Wno-implicit-function-declaration -Wno-unused-function scanner.c
scanner.o: scanner.c scan.gen.h
	$(CC) -c -g -std=c11 -Wno-implicit-function-declaration scanner.c

parser.o: parser.c parser.h
pointer_list.o: pointer_list.c pointer_list.h
main.o: main.c

clean:
	rm -f scanner.c scanner.gen.h simp $(OBJS)
