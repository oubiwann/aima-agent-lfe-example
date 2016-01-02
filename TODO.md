# TODO

## Dev Plan

TBD

## Module Layout

* ``aima.agents.env`` (``gen_server``)
  * define an ``env`` behaviour with required funcs (e.g., ``print-state``, ``run``, ``iterate``) then use to implement simple, grid, etc.
  * also include ``run/1`` (does ``start``, ``iterate``, and ``stop``)
* ``aima.agents.wumpus`` (``gen_server``)
