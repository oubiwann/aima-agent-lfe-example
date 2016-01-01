(defun extend-proplist (plist1-constructor plist1-setter plist2)
  (lists:foldl
    (match-lambda ((`#(,k ,v) acc)
      (funcall plist1-setter acc k v)))
    (funcall plist1-constructor)
    plist2))

(defun proplist-get (plist key)
  (case (lists:keyfind key 1 plist)
    ('false 'false)
    (`#(,_ ,val) val)))

(defun proplist-set (plist key val)
  (lists:keyreplace key 1 plist `#(,key ,val)))

(defun loaded-aima-common ()
  "This is just a dummy function for display purposes when including from the
  REPL (the last function loaded has its name printed in stdout).

  This function needs to be the last one in this include."
  'ok)
