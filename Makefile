# makefile: makes the learn_dg program

SRC=$(shell pwd)/src
OBJ=$(shell pwd)/obj
BIN=$(shell pwd)/bin
DOC=$(shell pwd)/docs

# Compiler
FF = gfortran
FFLAGS = -Wall -std=f2008 -Wextra -fPIC -fmax-errors=1 -Wimplicit-interface
FFLAGS += -O0 -g -fcheck=all -fbacktrace
FORD_FLAGS = -d $(SRC) -o $(DOC)/html

default: docs

# Dependencies of main program
objects=$(OBJ)/example.o


$(OBJ)/example.o: $(SRC)/example.f90
	$(FF) $(FFLAGS) -J$(OBJ) -c -o $@ $<

# Main program
$(OBJ)/main.o: $(SRC)/main.f90 $(objects)
	$(FF) $(FFLAGS) -I$(OBJ) -J$(OBJ) -c -o $@ $< $(FLIBS)
$(BIN)/main: $(OBJ)/main.o $(objects)
	$(FF) $(FFLAGS) -o $@ $+ $(FLIBS)

build: $(BIN)/main

run: build
	$(BIN)/main

.PHONY: docs
docs: build run
	cp README.md $(DOC)/.
	ford $(FORD_FLAGS) $(DOC)/project.md
	rm $(DOC)/README.md

clean:
	rm -rf $(OBJ)/*.o $(OBJ)/*.mod $(BIN)/main $(DOC)/html
