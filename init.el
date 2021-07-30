(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'preload)
(require 'init-evil)
(require 'init-selectrum)
(require 'init-elisp)
(require 'init-vterm)
(require 'init-rust)
(require 'init-lsp)
(require 'init-magit)
(require 'init-company)
(require 'init-utils)
(require 'init-which-key)
(require 'init-yasnippet)
(require 'settings)



(setq custom-file (expand-file-name "custom.el" user-emacs-directory))


