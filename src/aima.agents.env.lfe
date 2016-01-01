(defmodule aima.agents.env
  (gen_server)
  (export all))

(include-lib "aima.agents/include/envs.lfe")

;;; config functions

(defun server-name () (MODULE))
(defun callback-module () (MODULE))
(defun initial-state () '())
(defun genserver-opts () '())
(defun register-name () `#(local ,(server-name)))

;;; gen_server implementation

(defun start ()
  (start (initial-state)))

(defun start (env)
  (logjam:start)
  (gen_server:start (register-name)
                    (callback-module)
                    env
                    (genserver-opts)))

(defun stop ()
  (gen_server:call (server-name) 'stop))

(defun restart (env)
  (stop)
  (start env))

;;; callback implementation

(defun init (initial-state)
  `#(ok ,initial-state))

(defun handle_cast
  (('print state)
    (do-print state)
    `#(noreply ,state))
  (('iterate old-state)
    (let ((new-state (do-iterate old-state)))
      `#(noreply ,new-state))))

(defun handle_call
  (('step _caller state)
    `#(reply ,(env-get state 'step) ,state))
  (('env _caller state)
    `#(reply ,state ,state))
  ((`#(update ,new-state) _caller _old-state)
    `#(reply ,new-state ,new-state))
  (('stop _caller state)
    `#(stop shutdown ok state))
  ((message _caller state)
    `#(reply ,(aima.agents.util:unknown-command) ,state)))

(defun handle_info
  ((`#(EXIT ,_pid normal) state)
   `#(noreply ,state))
  ((`#(EXIT ,pid ,reason) state)
   (logjam:error `#(c ,(logjam:caller))
                 "Process ~p exited! (Reason: ~p)~n"
                 `(,pid ,reason))
   `#(noreply ,state))
  ((_msg state)
   `#(noreply ,state)))

(defun terminate (_reason _state)
  'ok)

(defun code_change (_old-version state _extra)
  `#(ok ,state))

;;; our server API

(defun run ()
  (logjam:info `#(c ,(logjam:caller)) "Starting run ...")
  (timer:sleep 100)
  (print-state)
  (iterate)
  (logjam:info `#(c ,(logjam:caller)) "Finished run."))

(defun run (env)
  (restart env)
  (print-state)
  (iterate)
  (stop))

(defun print-state ()
  (gen_server:cast (server-name) 'print))

(defun iterate ()
  (gen_server:cast (server-name) 'iterate))

(defun get-step ()
  (gen_server:call (server-name) 'step))

(defun get-env ()
  (gen_server:call (server-name) 'env))

;;; private functions

(defun do-print (state)
  (if (env-get state 'display)
    (lfe_io:format "~p. <print env tbd ...>~n" `(,(env-get state 'step)))))

(defun do-iterate (state)
  (let* ((step (env-get state 'step))
         (max (- (env-get state 'max-steps) 1))
         (state (env-set state 'step (+ 1 step))))
    (do-print state)
    (if (>= step max)
      state
      (do-iterate state))))

(defun measure-performance (state)
  )

(defun score-agents (state)
  )

(defun score-agent (agent)
  )
