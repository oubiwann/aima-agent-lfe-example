# aima-agent-lfe-example

[![][aima-cover]][aima-cover]

[aima-cover]: resources/images/aima-cover.jpg

#### Contents

* [Introduction](#introduction-)
* [Dependencies](#dependencies-)
* [Get, Build, & Start](#get-build--start-)
* [Usage](#usage-)

## Introduction [&#x219F;](#contents)

*Artificial Intelligence: A Modern Approach (AIMA)* is one of the best AI textbooks ever published (arguably *the* best AI textbook ...). Not only does the text contain some of the best and most lucid explanations you will find in the field, it comes with companion original Lisp source code, available [here](http://aima.cs.berkeley.edu/). An updated version of the code that runs on a recent release of SBCL is available from [this repository](https://github.com/oubiwann/cl-aima) (its ``README`` provides setup, build, and usage instructions). 

The 1995 first edition of the book is divided into eight parts with 27 chapters and two appendices. The chapters upon which this LFE example respository focuses are:

* 2 "Intelligent Agents"
* 6 "Agents that Reason Logically"
* 7 "First Order Logic"
* 22 "Agents that Communicate"

In particular, chapters 2 and 6 will get special attention.

Due to the differences between the simplified object system used in AIMA and the process-oriented approach employed by the Erlang VM and OTP, the LFE examples will diverge quite a bit. (Even though LFE and the Common Lisp dialect used in the book are book Lisp-2, the design of the Erlang VM is so distinctive as to shadow the similarities between the Lisps of LFE and CL.)

## Dependencies [&#x219F;](#contents)

* Erlang
* ``rebar3``
* GNU ``make``


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
...
> (set env (aima.agents.wumpus:world `(#(max-steps 10)
                                       #(agents (,agent)))))
...
> (aima.agents.env:start env)
#(ok <0.80.0>)
> (aima.agents.env:run env)
2016-01-02 00:34:05.152 [<0.48.0>] [info] aima.agents.env:run/0 Starting run ...
...
> 2016-01-02 00:34:05.256 [<0.48.0>] [info] aima.agents.env:run/0 Finished run.
> (aima.agents.env:stop)
ok
```
