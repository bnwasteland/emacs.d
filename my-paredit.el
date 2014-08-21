(require 'evil)
(require 'paredit)
(require 'evil-paredit)

(defun my-enable-paredit-mode ()
  (enable-paredit-mode)
  (evil-paredit-mode))

(add-hook 'emacs-lisp-mode-hook 'my-enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook 'my-enable-paredit-mode)
(add-hook 'lisp-mode-hook 'my-enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook 'my-enable-paredit-mode)
(add-hook 'scheme-mode-hook 'my-enable-paredit-mode)
(add-hook 'clojure-mode-hook 'my-enable-paredit-mode)

(provide 'my-paredit)
