(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'preload)
(require 'init-evil)
(require 'init-selectrum)
(require 'init-elisp)
(require 'init-vterm)
(require 'settings)


(setq custom-file (expand-file-name "custom.el" user-emacs-directory))


