(ensure-package 'cider)
(ensure-package 'clojure-mode)
(ensure-package 'clj-refactor)


(after-load 'clojure-mode
  (add-hook 'clojure-mode-hook 'clj-refactor-mode)
  (add-hook 'clojure-mode-hook 'cider-mode)
  (add-hook 'clojure-mode-hook 'paredit-mode)
  (add-hook 'clojure-mode-hook 'company-mode)
  (add-hook 'clojure-mode-hook 'yas-minor-mode-on))
