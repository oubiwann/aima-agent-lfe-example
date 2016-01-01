;; !!! This module assumes that you have included the common.lfe file already!

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

(defun loaded-aima-envs ()
  "This is just a dummy function for display purposes when including from the
  REPL (the last function loaded has its name printed in stdout).

  This function needs to be the last one in this include."
  'ok)
