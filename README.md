# aima-agent-lfe-example

[![][aima-cover]][aima-cover]

[aima-cover]: resources/images/aima-cover.jpg

#### Contents

* [Introduction](#introduction-)
* [Dependencies](#dependencies-)
* [Get, Build, & Start](#get-build--start-)
* [Usage](#usage-)

## Introduction [&#x219F;](#contents)

TBD

## Dependencies [&#x219F;](#contents)

* Erlang
* ``rebar3``


## Get, Build, & Start [&#x219F;](#contents)

Download:

```bash
$ git clone git@github.com:oubiwann/aima-agent-lfe-example.git aima.agents
$ cd aima.agents
```

Compile:

```bash
$ make build
```

Start up the LFE REPL:

```bash
$ make run
```


## Usage [&#x219F;](#contents)

Once you're at the REPL, you can run the example code:

```cl
> (set agent (aima.agents.wumpus:aimless-agent))
(#(...)...)
> (set env (aima.agents.wumpus:world `(#(max-steps 10)
                                       #(agents (,agent)))))
(#(...)...)
> (aima.agents.env:start env)
#(ok <0.80.0>)
> (aima.agents.env:run env)
2016-01-02 00:34:05.152 [<0.48.0>] [info] aima.agents.env:run/0 Starting run ...
...
> 2016-01-02 00:34:05.256 [<0.48.0>] [info] aima.agents.env:run/0 Finished run.
> (aima.agents.env:stop)
ok
```
