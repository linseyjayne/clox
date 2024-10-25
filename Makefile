CC=gcc
CFLAGS=
PROGNAME=clox

# runs if no args passed to 'make' command
all: compile

# compiles and links, outputting single binary
# $^ is auto variable for the list of deps
compile: main.o memory.o chunk.o compiler.o debug.o object.o scanner.o table.o value.o vm.o
	$(CC) $(CFLAGS) -o $(PROGNAME) $^
	@chmod +x $(PROGNAME)

# create object files with matching names to C files
%.o: %.c
	$(CC) $(CFLAGS) -c $^

clean:
	rm *.o $(PROGNAME)

run:
	@./$(PROGNAME)

dev: compile run