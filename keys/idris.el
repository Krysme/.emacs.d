
(after-load 'idris-mode
  (evil-collection-define-key 'insert 'idris-repl-mode-map
	(kbd "C-p") 'idris-repl-backward-history
	(kbd "C-n") 'idris-repl-forward-history
	(kbd "C-l") 'idris-repl-clear-buffer))
