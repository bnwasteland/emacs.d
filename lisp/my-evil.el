(require 'my-platforms)
(require 'evil)
(require 'evil-paredit)

(defun my-enable-evil-mode ()
  (evil-mode 1)

  (define-key evil-window-map (kbd "<left>") 'evil-window-left)
  (define-key evil-window-map (kbd "<right>") 'evil-window-right)
  (define-key evil-window-map (kbd "<up>") 'evil-window-up)
  (define-key evil-window-map (kbd "<down>") 'evil-window-down))

(add-hook 'after-init-hook 'my-enable-evil-mode t)

(provide 'my-evil)
