(add-to-list 'load-path user-emacs-directory)

(require 'my-text)
(require 'my-keys)
(require 'my-gui)
(require 'my-shell)

(require 'my-packages)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(custom-enabled-themes (quote (wombat)))
 '(display-time-default-load-average nil)
 '(display-time-mode t)
 '(ido-mode (quote both) nil (ido))
 '(inhibit-startup-screen t)
 '(menu-bar-mode nil)
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
 '(powerline-evil-visual-face ((t (:inherit powerline-evil-base-face :background "orange" :foreground "gray22")))))


