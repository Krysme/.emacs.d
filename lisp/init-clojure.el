;; -*- lexical-binding: t; -*-
(straight-use-package 'clojure-mode)
(straight-use-package 'cider)

;; Recognize source, data, and Babashka/Boot scripts without manual mode selection.
(dolist (entry '(("\\.clj\\'" . clojure-mode)
                 ("\\.cljs\\'" . clojurescript-mode)
                 ("\\.cljc\\'" . clojurec-mode)
                 ("\\.edn\\'" . edn-mode)
                 ("\\.\\(?:bb\\|boot\\)\\'" . clojure-mode)))
        (add-to-list 'auto-mode-alist entry))

(after-load 'cider-repl
        ;; CIDER captures Paredit's keymap before running the REPL mode hooks.
        (require 'paredit)
        (after-load 'evil
                (evil-define-key 'insert cider-repl-mode-map
                        (kbd "C-l") 'cider-repl-clear-buffer
                        (kbd "C-p") 'cider-repl-previous-input
                        (kbd "C-n") 'cider-repl-next-input)))

(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'clojure-mode-hook 'company-mode)
;; Make CIDER's editing/evaluation commands available immediately.  Starting a
;; REPL remains explicit (C-c M-j), rather than launching a JVM on every visit.
(add-hook 'clojure-mode-hook 'cider-mode)

(add-hook 'cider-repl-mode-hook 'paredit-mode)
(add-hook 'cider-repl-mode-hook 'company-mode)

(provide 'init-clojure)
