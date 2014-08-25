(require 'package)
(package-initialize)

(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)

(when (not package-archive-contents)
  (package-refresh-contents))

(unless (package-installed-p 'package-filter)
  (package-install 'package-filter))

(unless (package-installed-p 'package+)
  (package-install 'package+))

(package-manifest 'magit
		  'package-filter
		  'package+
		  'evil
		  'paredit
		  'powerline
		  'evil-paredit
		  'powerline-evil
		  'rainbow-delimiters
		  'clojure-mode
		  'cider
		  'coffee-mode)

(require 'my-magit)
(require 'my-evil)
(require 'my-paredit)
(require 'my-powerline)

(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

(require 'coffee-mode)

(defun my-smart-tab ()
  (interactive)
  (if (and (eolp)
	   (eq (char-before) 32))
      (insert-tab)
      (indent-for-tab-command)))

(defun my-coffee-evil-open-above (count)
  "Insert a new line above point and switch to Insert state.
The insertion will be repeated COUNT times."
  (interactive "p")
  (evil-insert-newline-above)
  (setq evil-insert-count count
	evil-insert-lines t
	evil-insert-vcount nil)
  (evil-insert-state 1)
  (add-hook 'post-command-hook #'evil-maybe-remove-spaces)
  (indent-relative))

(defun my-coffee-evil-open-below (count)
  "Insert a new line below point and switch to Insert state.
The insertion will be repeated COUNT times."
  (interactive "p")
  (evil-insert-newline-below)
  (setq evil-insert-count count
	evil-insert-lines t
	evil-insert-vcount nil)
  (evil-insert-state 1)
  (add-hook 'post-command-hook #'evil-maybe-remove-spaces)
  (indent-relative))

(defun my-custom-coffee ()
  (define-key evil-normal-state-local-map (kbd "O") 'my-coffee-evil-open-above)
  (define-key evil-normal-state-local-map (kbd "o") 'my-coffee-evil-open-below)
  (define-key evil-insert-state-local-map (kbd "<tab>") 'my-smart-tab))

(add-hook 'coffee-mode-hook 'my-custom-coffee t)

;; automatically clean up bad whitespace
(setq whitespace-action '(auto-cleanup))
;; only show bad whitespace
(setq whitespace-style '(trailing space-before-tab indentation empty space-after-tab))

(add-hook 'prog-mode-hook 'whitespace-mode)

(provide 'my-packages)
