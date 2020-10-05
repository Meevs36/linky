TARGET = linky.out
FLAGS =	
BASE_FLAGS = -I$(INC_DIR) -L$(LIB_DIR)
OUT_FLAGS = -o $@
OBJ_FLAGS = -c $<

CC = gcc

SRC_EXT = .c
INC_EXT = .h

SRC_DIR = src
INC_DIR = inc
LIB_DIR = lib
OBJ_DIR = obj
BIN_DIR = bin

SOURCES := $(wildcard $(SRC_DIR)/*$(SRC_EXT))
INCLUDE := $(wildcard $(INC_DIR)/*$(INC_EXT))
OBJECTS := $(SOURCES:$(SRC_DIR)/%$(SRC_EXT)=$(OBJ_DIR)/%.o)


all: $(BIN_DIR)/$(TARGET)

$(BIN_DIR)/$(TARGET): $(OBJECTS)
	if ! [ -d $(BIN_DIR) ]; then mkdir $(BIN_DIR); fi
	$(CC) $(BASE_FLAGS) $(OBJECTS) $(OUT_FLAGS) $(FLAGS)

$(OBJECTS): $(OBJ_DIR)/%.o : $(SRC_DIR)/%$(SRC_EXT)
	if ! [ -d $(OBJ_DIR) ]; then mkdir $(OBJ_DIR); fi
	$(CC) $(BASE_FLAGS) $(OBJ_FLAGS) $(OUT_FLAGS) $(FLAGS)

clean: tidy
	-rm -r $(BIN_DIR)

tidy:
	-rm *~
	-rm \#*#
	-rm $(SRC_DIR)/*~
	-rm $(SRC_DIR)/\#*#
	-rm -r $(OBJ_DIR)
