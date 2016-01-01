# aima-agent-lfe-example

## Get and Build

Download:

```bash
$ git clone git@github.com:oubiwann/aima-agent-lfe-example.git aima.agents
$ cd aima.agents
```

Compile:

```bash
$ make build
```


## Usage

Start up the LFE REPL with the agent code automatically running:

```bash
$ make run
```


## Dev Plan

TBD

## Module Layout

* ``aima.agents.env`` (``gen_server``)
  * define an ``env`` behaviour with required funcs (e.g., ``print-state``, ``run``, ``iterate``) then use to implement simple, grid, etc. 
  * also include ``run/1`` (does ``start``, ``iterate``, and ``stop``)  
* ``aima.agents.wumpus`` (``gen_server``)
