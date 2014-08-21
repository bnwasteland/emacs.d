(require 'my-platforms)

(when-windows
 (add-to-list 'exec-path "C:/Program Files (x86)/Git/bin")
 (setq explicit-shell-file-name "C:/Program Files (x86)/Git/bin/sh.exe")
 (setq shell-file-name explicit-shell-file-name)
 (setq explicit-sh.exe-args '("--login" "-i"))
 (setenv "SHELL" shell-file-name))

(provide 'my-shell)
