;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp")

(require 'my-text)
(require 'my-keys)
(require 'my-gui)
(require 'my-shell)

;; put emacs droppings togther
(setq backup-directory-alist `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

(electric-indent-mode 1)

(require 'my-packages)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(coffee-tab-width 2)
 '(custom-enabled-themes (quote (wombat)))
 '(display-time-default-load-average nil)
 '(display-time-mode t)
 '(ido-mode (quote both) nil (ido))
 '(inhibit-startup-screen t)
 '(menu-bar-mode nil)
 '(package-selected-packages
   (quote
    (coffee-mode
     cider
     clojure-mode
     rainbow-delimiters
     powerline-evil
     evil-paredit
     powerline
     paredit
     evil
     magit
     git-commit
     magit-popup
     undo-tree
     goto-chg
     pkg-info
     queue
     spinner
     epl
     package+)))
 '(powerline-evil-tag-style (quote verbose))
 '(scroll-bar-mode nil)
 '(show-trailing-whitespace t)
 '(tool-bar-mode nil)
 '(visible-bell t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :width normal :foundry "outline"))))
 '(mode-line ((t (:background "#444444" :foreground "#f6f3e8"))))
 '(mode-line-highlight ((t (:box (:line-width 1 :color "grey40" :style released-button)))))
 '(mode-line-inactive ((t (:inherit mode-line :background "#444444" :foreground "#857b6f" :weight light))))
 '(powerline-evil-emacs-face ((t (:inherit powerline-evil-base-face :background "violet" :foreground "gray22"))))
 '(powerline-evil-motion-face ((t (:inherit powerline-evil-base-face :background "magenta" :foreground "gray22"))))
 '(powerline-evil-normal-face ((t (:inherit powerline-evil-base-face :background "green" :foreground "gray22"))))
 '(powerline-evil-operator-face ((t (:inherit powerline-evil-operator-face :background "cyan" :foreground "gray22"))))
 '(powerline-evil-visual-face ((t (:inherit powerline-evil-base-face :background "orange" :foreground "gray22"))))
 '(rainbow-delimiters-depth-1-face ((t (:foreground "dark gray"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "light blue"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "royal blue"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "yellow3"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "forest green"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "DarkOrange3"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "slate blue"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "red3"))))
 '(rainbow-delimiters-depth-9-face ((t (:foreground "snow3"))))
 '(rainbow-delimiters-unmatched-face ((t (:foreground "white")))))
