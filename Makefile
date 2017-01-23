# makefile: makes the learn_dg program

SRC=$(shell pwd)/src
OBJ=$(shell pwd)/obj
BIN=$(shell pwd)/bin
DOC=$(shell pwd)/docs

# Compiler
FF = gfortran
FFLAGS = -Wall -std=f2008 -Wextra -fPIC -fmax-errors=1 -Wimplicit-interface
FFLAGS += -O0 -g -fcheck=all -fbacktrace
FORD_FLAGS = -d $(SRC) -o $(DOC)

default: docs

# Dependencies of main program
objects=$(OBJ)/external.o \
	$(OBJ)/square.o
objects_ex=$(OBJ)/external_ex.o \
	$(OBJ)/square.o

$(OBJ)/square.o: $(SRC)/square.f90
	$(FF) $(FFLAGS) -J$(OBJ) -c -o $@ $<

$(OBJ)/external.o: $(SRC)/external.f90 $(OBJ)/square.o
	$(FF) $(FFLAGS) -J$(OBJ) -c -o $@ $<
$(OBJ)/external_ex.o: $(SRC)/external_ex.f90 $(OBJ)/square.o
	$(FF) $(FFLAGS) -J$(OBJ) -c -o $@ $<

# Main program(s)
$(OBJ)/main.o: $(SRC)/main.f90 $(objects)
	$(FF) $(FFLAGS) -I$(OBJ) -J$(OBJ) -c -o $@ $< $(FLIBS)
$(BIN)/main: $(OBJ)/main.o $(objects)
	$(FF) $(FFLAGS) -o $@ $+ $(FLIBS)
$(OBJ)/main_ex.o: $(SRC)/main_ex.f90 $(objects_ex)
	$(FF) $(FFLAGS) -I$(OBJ) -J$(OBJ) -c -o $@ $< $(FLIBS)
$(BIN)/main_ex: $(OBJ)/main_ex.o $(objects_ex)
	$(FF) $(FFLAGS) -o $@ $+ $(FLIBS)


build: $(BIN)/main $(BIN)/main_ex

run: build
	$(BIN)/main > /dev/null 2>&1
	$(BIN)/main_ex > /dev/null 2>&1

.PHONY: docs
docs: build run
	ford $(FORD_FLAGS) project.md

clean:
	rm -rf $(OBJ)/*.o $(OBJ)/*.mod $(BIN)/main* $(DOC)/*
