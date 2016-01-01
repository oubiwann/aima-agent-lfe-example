LFE_HOME = _build/default/lib/lfe/
LFE_BIN = $(LFE_HOME)/bin
LFE = $(LFE_BIN)/lfe

all: build run

clean:
	rebar3 clean
	rebar3 lfe clean

build:
	rebar3 compile

run:
	$(LFE) -pa ./ebin #-s aima.agents.env

.PHONY: deps

rebuild: clean build

repl:
	$(LFE) -pa ./ebin
