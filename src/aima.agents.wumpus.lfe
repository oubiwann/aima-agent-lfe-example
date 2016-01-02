(defmodule aima.agents.wumpus
  (export all))

(include-lib "aima.agents/include/all.lfe")

(defun terminate? (env)
  (or (not (any-agents? env))
      (any-climbing-out? env)))

(defun any-climbing-out? (env)
  (lists:any
    (lambda (agent)
      (climbing-out? env agent))
    (get-agents env)))

(defun climbing-out? (env agent)
  (and (at-start? env (get-body agent))
       (== (get-action agent) 'climb)))

(defun aimless-agent ()
  (aimless-wumpus-agent))

(defun aimless-agent (args)
  (aimless-wumpus-agent args))
