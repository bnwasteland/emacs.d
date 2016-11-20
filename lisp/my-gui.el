(require 'my-platforms)
(when window-system
;;fonts
(when-windows
  (set-face-attribute 'default nil :font "Consolas" :height 108))

(when-osx
  (set-face-attribute 'default nil :font "Monaco" :height 118))

;;start maximized
(when-windows
  (defun w32-maximize-frame ()
    "Maximize the current frame (windows only)"
    (interactive)
    (w32-send-sys-command 61488))

  (add-hook 'window-setup-hook 'w32-maximize-frame t))

(when-unixy
  (set-frame-parameter nil 'fullscreen 'maximized)))

(provide 'my-gui)
