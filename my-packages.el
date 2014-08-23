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

(provide 'my-packages)
