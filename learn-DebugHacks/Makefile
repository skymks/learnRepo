CFLAGS=-g
BuildPath=build

programs:=$(patsubst %.c,%,$(wildcard *.c))

all:$(programs)
	@echo 'DebugHacks'
	mkdir -p $(BuildPath)
	mv $+ $(BuildPath)

$(programs):

.PHONY: all

.PHONY: clean

clean: 
	rm -rf $(BuildPath)  


