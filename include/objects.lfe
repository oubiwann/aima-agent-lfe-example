;;;; Objects include

;; !!! This include file assumes that you have included the common.lfe
;; !!! file already!

;;; Base object

(defun object ()
  '(#(name "object")
    #(repr "?")
    #(alive? false)
    #(movable? true)
    #(pass-through? true)
    #(loc #(1 1))
    #(bump undefined)
    #(size 0.5)
    #(color black)
    #(shape rectangle)
    #(sound undefined)
    #(contents ())
    #(max-contents 0.4)
    #(container? false)
    #(facing #(1 0))))

(defun object (args)
  (extend-proplist #'object/0 #'object-set/3 args))

(defun object-get (object key)
  (proplist-get object key))

(defun object-set (object key val)
  (proplist-set object key val))

(defun get-loc (object)
  (object-get object 'loca))

;;; Other objects

(defun attached ()
  (object '(#(movable? false))))

(defun attached (args)
  (extend-proplist #'attached/0 #'object-set/3 args))

(defun obstacle ()
  (attached '(#(repr "#")
              #(pass-through? false))))

(defun obstacle (args)
  (extend-proplist #'obstacle/0 #'object-set/3 args))

(defun wall ()
  (obstacle '(#(name "wall"))))

(defun wall (args)
  (extend-proplist #'wall/0 #'object-set/3 args))

(defun gold ()
  (object '(#(name "gold")
            #(repr "$")
            #(size 0.001)
            #(amount 1)
            #(loc undefined))))

(defun pit ()
  (object '(#(name "pit")
            #(repr "O")
            #(loc undefined))))

(defun arrow ()
  (object '(#(name "arrow")
            #(repr "!")
            #(size 0.01)
            #(loc undefined))))

(defun wumpus ()
  (object '(#(name "wumpus")
            #(repr "W")
            #(size 0.7)
            #(alive? true)
            #(loc undefined))))

(defun loaded-aima-objects ()
  "This is just a dummy function for display purposes when including from the
  REPL (the last function loaded has its name printed in stdout).

  This function needs to be the last one in this include."
  'ok)
