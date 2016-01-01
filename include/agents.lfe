(defun agent ()
  '(#(program undefined)
    #(body undefined)
    #(score 0)
    #(percept undefined)
    #(action undefined)
    #(name undefined)))

(defun agent (args)
  (let ((agent (agent)))
    (lists:foldl
      (match-lambda ((`#(,k ,v) acc)
        (agent-set acc k v)))
      agent
      args)))

(defun agent-get (agent key)
  (case (lists:keyfind key 1 agent)
    ('false 'false)
    (`#(,_ ,val) val)))

(defun agent-set (agent key val)
  (lists:keyreplace key 1 agent `#(,key ,val)))
