CXX := g++
MKDIR := mkdir -p
CXXFLAGS := -Wall -Werror -Wextra -Weffc++ -pedantic -std=c++11
LDFLAGS := -lSDL2
PROGS := bin/cave
OBJS := $(patsubst src/%.cpp,obj/%.o, $(wildcard src/*.cpp))

.PHONY: all clean

all: build

build: $(PROGS)

clean:
	rm -rf $(PROGS) $(OBJS)

bin/cave: obj/game.o obj/main.o obj/graphics.o

$(PROGS):
	@$(MKDIR) $(dir $@)
	$(CXX) $(CXXFLAGS) $(LDFLAGS) -o $@ $^

obj/%.o : src/%.cpp
	@$(MKDIR) $(dir $@)
	$(CXX) $(CXXFLAGS) -c -MD -o $@ $<

