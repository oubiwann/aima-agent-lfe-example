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

Once in the LFE REPL:

```cl
>
> (set env (aima.agents.env:environment `(#(max-steps 10))))
(#(...)...)
> (aima.agents.env:start env)
#(ok <0.79.0>)
> (aima.agents.env:run env)
```


## Dev Plan

TBD

## Module Layout

* ``aima.agents.env`` (``gen_server``)
  * define an ``env`` behaviour with required funcs (e.g., ``print-state``, ``run``, ``iterate``) then use to implement simple, grid, etc.
  * also include ``run/1`` (does ``start``, ``iterate``, and ``stop``)
* ``aima.agents.wumpus`` (``gen_server``)
