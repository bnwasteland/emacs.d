(require 'my-platforms)

;;serenity now
(global-set-key (kbd "<home>") 'move-beginning-of-line)
(global-set-key (kbd "<end>") 'move-end-of-line)

(when-osx
 (global-set-key [kp-delete] 'delete-char)) ;; sets fn-delete to be right-delete

;;keep config handy
(global-set-key (kbd "<f6>") (lambda() (interactive)(find-file (or user-init-file ""))))
(global-set-key (kbd "<f5>") 'eval-buffer)

(provide 'my-keys)
