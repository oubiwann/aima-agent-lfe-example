;;;; Environments include

;; !!! This include file assumes that you have included the common.lfe,
;; !!! objects.lfe, and agent.lfe files already!

;;; Base environment

(defun environment ()
  `(#(agents ())
    #(step 0)
    #(max-steps 0)
    #(display true)
    #(initialized false)
    #(state undefined)
    #(term-check-func ,(lambda (_) 'false))))

(defun environment (args)
  (extend-proplist #'environment/0 #'env-set/3 args))

(defun env-get (env key)
  (proplist-get env key))

(defun env-set (env key val)
  (proplist-set env key val))

(defun get-term-check-func (env)
  (env-get env 'term-check-func))

(defun run-term-check (env)
  (funcall (get-term-check-func env) env))

(defun get-agents (env)
  (env-get env 'agents))

(defun any-agents? (env)
  (->> env
       (get-agents)
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

(defun get-start-loc (env)
  (env-get env 'start))

(defun set-agents-start-loc (env)
  (->> env
       (get-agents)
       (lists:map
         (lambda (agent)
           (object-set agent 'loc (get-start-loc env))))
       (env-set env 'agents)))

(defun at-start? (env obj)
  (== (get-start-loc env)
      (get-loc obj)))

(defun get-loc-count (env)
  (let ((`#(,x ,y) (env-get env 'size)))
    (* x y)))

(defun get-random-loc (env)
  (let ((`#(,x ,y) (env-get env 'size)))
    `#(,(random:uniform x)
       ,(random:uniform y))))

(defun get-random-locs (env count)
  (lists:map
    (lambda (_)
      (get-random-loc env))
    (lists:seq 1 count)))

(defun get-random-locs
  ((env count '#(overlap false))
    (if (> count (- (get-loc-count env) 1))
      #(error count-larger-than-grid)
      (get-random-locs env count '())))
  ((env count acc) (when (== (length acc) count))
    acc)
  ((env count acc)
    (let ((loc (get-random-loc env)))
      (if (== loc #(1 1))
        (get-random-locs env count acc)
        (if (lists:any (lambda (x) (== loc x)) acc)
          (get-random-locs env count acc)
          (get-random-locs env count (++ acc `(,loc))))))))

(defun place-objects (env objs)
  (env-set env 'objects
    (let* ((obj-count (length objs))
           (locs (get-random-locs env obj-count #(overlap false))))
      (lists:zipwith
        (lambda (obj loc)
          (object-set obj 'loc loc))
        objs
        locs))))

(defun place-object
  ((obj (= `#(,_ ,_) loc))
    (object-set obj 'loc loc))
  ((env obj)
    (place-object obj (get-random-loc env))))

;;; Wumpus environment

(defun -wumpus-world ()
  (grid `(#(size #(6 6))
          #(pit-freq 0.2)
          #(gold-amount ,(random:uniform 100))
          #(wumpus-count 1))))

(defun -wumpus-world (args)
  (extend-proplist #'-wumpus-world/0 #'env-set/3 args))

(defun wumpus-world ()
  (wumpus-world '()))

(defun wumpus-world (args)
  (let* ((env (-wumpus-world args))
         (gold (make-gold env))
         (pits (make-pits env))
         (wumpi (make-wumpi env))
         (objs (++ pits wumpi `(,gold))))
    (-> env
        (set-agents-start-loc)
        (place-objects objs))))

(defun make-pits (env)
  (let* ((total-locs (get-loc-count env))
         (freq (env-get env 'pit-freq))
         (pit-count (trunc (* freq total-locs))))
    (lists:map (lambda (_) (pit)) (lists:seq 1 pit-count))))

(defun make-gold (env)
  (gold `(#(amount ,(env-get env 'gold-amount)))))

(defun make-wumpi (env)
  (lists:map
    (lambda (_)
      (wumpus))
    (lists:seq 1 (env-get env 'wumpus-count))))

(defun loaded-aima-envs ()
  "This is just a dummy function for display purposes when including from the
  REPL (the last function loaded has its name printed in stdout).

  This function needs to be the last one in this include."
  'ok)
