(defun environment ()
  '(#(agents ())
    #(step 0)
    #(max-steps 0)
    #(display true)
    #(initialized false)
    #(state undefined)))

(defun environment (args)
  (let ((env (environment)))
    (lists:foldl
      (match-lambda ((`#(,k ,v) acc)
        (env-set acc k v)))
      env
      args)))

(defun env-get (env key)
  (case (lists:keyfind key 1 env)
    ('false 'false)
    (`#(,_ ,val) val)))

(defun env-set (env key val)
  (lists:keyreplace key 1 env `#(,key ,val)))
