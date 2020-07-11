CFLAGS=-g -pthread -Og

BuildPath=build

programs:=$(patsubst %.c,%,$(wildcard *.c))

all:$(programs)
	@echo 'Build...'
	mkdir -p $(BuildPath)
	mv $+ $(BuildPath)

$(programs):

.PHONY: all

.PHONY: clean

clean: 
	rm -rf $(BuildPath)  


