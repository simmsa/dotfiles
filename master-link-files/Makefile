# Compiling a lone c file
# make f=<filename without the .c>
# Running that file
# make run f=<filename without the .c>
# Cleaning up the build files
# make clean f=<filename without the .c>

CC     = gcc
# CFLAGS -g makes the .dSYM folder
CFLAGS = -std=c11 -g

default: all

all: MyMake

# @ means silent execution
MyMake:
	@$(CC) $(CFLAGS) $(f).c -o $(f)

# " || true" supresses make errors which sometimes happen when
# running inside of vim.
run:
	@./$(f) || true

run_w_args:
	@./$(f) $(args) || true

valgrind:
	valgrind ./$(f)

scan-build:
	scan-build make f=$(f)

gdb:
	gdb -q -tui $(f)

clean:
	@rm $(f) && rm -rf $(f).dSYM || true
