(require 'my-evil)
(require 'powerline)
(require 'powerline-evil)

(defun my-powerline-vc ()
  (let* ((orig (powerline-vc))
	 (stripped (when orig (replace-regexp-in-string "\\`[ \t\n]*Git." "" orig))))
    (when stripped (concat "(" stripped ")"))))

(defun my-powerline-minor-modes (face &optional padding)
  (let ((invisible-minor-modes '("Undo-Tree")))
    (replace-regexp-in-string (concat " " (mapconcat 'identity invisible-minor-modes "\\|"))
			      ""
			      (powerline-minor-modes face padding))))

(defface my-powerline-modified-buffer
  '((t :inherit mode-line :background "OrangeRed3"))
  "Face used to show buffer name when modified"
  :group 'powerline)

(defface my-powerline-unmodified-buffer
  '((t :inherit mode-line :background "dark green"))
  "Face used to show buffer name when NOT modified"
  :group 'powerline)

(defface my-powerline-transient-buffer
  '((t :inherit mode-line :background "sky blue" :foreground "gray22"))
  "Face used to when buffer is not visiting a file"
  :group 'powerline)

(defface my-powerline-clean-vc-face
  '((t :inherit mode-line :foreground "light green"))
  "Face used to when working repo is clean"
  :group 'powerline)

(defface my-powerline-dirty-vc-face
  '((t :inherit mode-line :foreground "DarkOrange1"))
  "Face used to when working repo is dirty"
  :group 'powerline)

(defun my-powerline-buffer-face ()
  (if (buffer-file-name)
      (if (buffer-modified-p)
	  'my-powerline-modified-buffer
	'my-powerline-unmodified-buffer)
    'my-powerline-transient-buffer))

(defun my-git-dirty-p ()
  "Return t if local repository is dirty."
  (with-temp-buffer
    (vc-git-command t 0 nil "status" "--porcelain")
    (> (buffer-size) 0)))

(defun my-powerline-vc-face ()
  (if (eq (vc-backend (buffer-file-name)) 'Git)
      (if (my-git-dirty-p)
	  'my-powerline-dirty-vc-face
	  'my-powerline-clean-vc-face)
      'mode-line))

(defun my-powerline-theme ()
  "Setup my default mode-line."
  (interactive)
  (setq-default mode-line-format
		'("%e"
		  (:eval
		   (let* ((active (powerline-selected-window-active))
			  (vc-string (my-powerline-vc))
			  (evil-face (if active (powerline-evil-face) 'mode-line-inactive))
			  (buffer-face (if active (my-powerline-buffer-face) 'mode-line-inactive))
			  (mode-line (if active 'mode-line 'mode-line-inactive))
			  (vc-face (if active (my-powerline-vc-face) 'mode-line-inactive))
			  (face1 (if active 'powerline-active1 'powerline-inactive1))
			  (face2 (if active 'powerline-active2 'powerline-inactive2))
			  (separator-left (intern (format "powerline-%s-%s"
							  powerline-default-separator
							  (car powerline-default-separator-dir))))
			  (separator-right (intern (format "powerline-%s-%s"
							   powerline-default-separator
							   (cdr powerline-default-separator-dir))))
			  (lhs (list (powerline-raw (concat " " (powerline-evil-tag) "  ") evil-face)
				     (funcall separator-left evil-face buffer-face)
				     (powerline-raw "%b" buffer-face 'l)
				     (powerline-raw " " buffer-face)
				     (when vc-string
				       (funcall separator-left buffer-face vc-face))
				     (when vc-string
				       (powerline-raw vc-string vc-face 'l))
				     (when vc-string
				       (powerline-raw " " vc-face))
				     (when vc-string
				       (funcall separator-left mode-line face1))
				     (when (not vc-string)
				       (funcall separator-left buffer-face face1))
				     (when (boundp 'erc-modified-channels-object)
				       (powerline-raw erc-modified-channels-object face1 'l))
				     (powerline-major-mode face1 'l)
				     (powerline-process face1)
				     (my-powerline-minor-modes face1 'l)
				     (powerline-narrow face1 'l)
				     (powerline-raw " " face1)
				     (funcall separator-left face1 face2)))
			  (rhs (list (funcall separator-right face2 face1)
				     (powerline-raw mode-line-mule-info face1 'l)
				     (powerline-raw " " face1)
				     (funcall separator-right face1 mode-line)
				     (powerline-raw "%l:%c" nil 'l)
				     (powerline-raw "(%3p)" nil 'l)
				     (powerline-raw " " nil)
				     (powerline-raw global-mode-string nil 'r))))
		     (concat (powerline-render lhs)
			     (powerline-fill face2 (powerline-width rhs))
			     (powerline-render rhs)))))))

(add-hook 'after-init-hook 'my-powerline-theme t)

(provide 'my-powerline)
