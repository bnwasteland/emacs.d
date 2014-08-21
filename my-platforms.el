(defvar my-running-platforms ())

(defmacro defplatform (platform-symbol platform-p)
  (let* ((platform-name (symbol-name platform-symbol))
         (varname (intern (concat "running-" platform-name)))
         (macroname (intern (concat "when-" platform-name))))
    `(progn
       (when ,platform-p
	 (add-to-list (quote my-running-platforms) (quote ,platform-symbol)))
       (defvar ,varname ,platform-p)
       (defmacro ,macroname (&rest body)
         (append (list 'when (quote ,varname)) body)))))


(defplatform windows (eq system-type 'windows-nt))
(defplatform windows-7 (eq system-type 'windows-nt))

(defplatform osx (eq system-type 'darwin))
(defplatform linux (eq system-type 'gnu/linux))

(defplatform unixy (or running-osx
                       running-linux))

(mapc (lambda (p) (message (concat "Detected platform: " (symbol-name p)))) my-running-platforms)

(provide 'my-platforms)
