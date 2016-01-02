;;;; Environments include

;; !!! This include file assumes that you have included the common.lfe,
;; !!! objects.lfe, and agent.lfe files already!

;;; Base environment

(defun environment ()
  '(#(agents ())
    #(step 0)
    #(max-steps 0)
    #(display true)
    #(initialized false)
    #(state undefined)))

(defun environment (args)
  (extend-proplist #'environment/0 #'env-set/3 args))

(defun env-get (env key)
  (proplist-get env key))

(defun env-set (env key val)
  (proplist-set env key val))

(defun any-agents? (env)
  (->> (env-get env 'agents)
       (lists:map #'alive?/1)
       (lists:member 'true)))

;;; Grid environment

(defun grid ()
  (environment '(#(size #(2 2))
                 #(grid 'undefined)
                 #(objects ())
                 #(start #(1 1))
                 #(default-agents (#'prompting-user-agent/0))
                 #(default-objects ((at edge wall)))
                 #(default-dynamic-objects ()))))

(defun grid (args)
  (extend-proplist #'grid/0 #'env-set/3 args))

(defun loaded-aima-envs ()
  "This is just a dummy function for display purposes when including from the
  REPL (the last function loaded has its name printed in stdout).

  This function needs to be the last one in this include."
  'ok)
