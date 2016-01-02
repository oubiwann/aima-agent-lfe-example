;;;; Agents include

;; !!! This include file assumes that you have included the common.lfe and
;; !!! objects.lfe files already!

;;; Base agent

(defun agent-body ()
  (object `(#(alive? true)
            #(name "agent")
            #(repr undefined)
            #(holding undefined))))

(defun agent-body (args)
  (extend-proplist #'agent-body/0 #'object-set/3 args))

(defun agent ()
  `(#(program undefined)
    #(body ,(agent-body))
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

(defun get-body (agent)
  (agent-get agent 'body))

(defun get-action (agent)
  (agent-get agent 'action))

(defun alive? (agent)
  (-> agent
      (agent-get 'body)
      (object-get 'alive?)))

(defun die (agent)
  (-> agent
      (agent-get 'body)
      (object-set 'alive? 'false)
      (update-body agent)))

(defun revive (agent)
  (-> agent
      (agent-get 'body)
      (object-set 'alive? 'true)
      (update-body agent)))

(defun update-body (body agent)
  (agent-set agent 'body body))

;;; Environment-agent actions

(defun speak (env agent sound)
  'noop)

(defun turn (env agent direction)
  'noop)

(defun forward (env agent)
  'noop)

(defun grab (env agent loc)
  'noop)

(defun release (env agent loc)
  'noop)

;;; Other agents

(defun prompting-user-agent ()
  (agent))

(defun prompting-user-agent (args)
  (agent args))

(defun aimless-wumpus-agent ()
  (let ((wumpus-agent-body (agent-body `(#(contents (arrow))))))
    (agent `(#(body ,wumpus-agent-body)))))

(defun aimless-wumpus-agent (args)
  (extend-proplist #'aimless-wumpus-agent/0 #'agent-set/3 args))

(defun loaded-aima-agents ()
  "This is just a dummy function for display purposes when including from the
  REPL (the last function loaded has its name printed in stdout).

  This function needs to be the last one in this include."
  'ok)
