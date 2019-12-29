(after-load 'clj-refactor
  (cljr-add-keybindings-with-prefix "C-c C-r"))

(after-load 'cider
  (define-key cider-mode-map (kbd "C-c C-f") 'cider-format-buffer)
  (define-key cider-mode-map (kbd "C-n") nil)
  (define-key evil-insert-state-map (kbd "C-n") nil))

(after-load 'evil-collection
  (evil-collection-define-key 'insert 'cider-mode-map
	(kbd "C-n") nil))
