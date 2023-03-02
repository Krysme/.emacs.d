(straight-use-package 'cider)
(straight-use-package 'clojure-mode)


(add-hook 'clojure-mode-hook 'cider)
(after-load 'cider 
  (evil-define-key 'insert cider-repl-mode-map (kbd "C-l") 'cider-repl-clear-buffer)
  (evil-define-key 'insert cider-repl-mode-map (kbd "C-p") 'cider-repl-previous-input)
  (evil-define-key 'insert cider-repl-mode-map (kbd "C-n") 'cider-repl-next-input))

(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'clojure-mode-hook 'company-mode)



(provide 'init-clojure)
