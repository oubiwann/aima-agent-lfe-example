;; !!! This module assumes that you have included the common.lfe file already!

(defun agent ()
  '(#(program undefined)
    #(body undefined)
    #(score 0)
    #(percept undefined)
    #(action undefined)
    #(name undefined)))

(defun agent (args)
  (extend-proplist #'agent/0 #'agent-set/3 args))

(defun agent-get (agent key)
  (proplist-get agent key))

(defun agent-set (agent key val)
  (proplist-set agent key val))

(defun loaded-aima-agent ()
  "This is just a dummy function for display purposes when including from the
  REPL (the last function loaded has its name printed in stdout).

  This function needs to be the last one in this include."
  'ok)
