;; -*- lexical-binding: t -*-

(straight-use-package
 '(eat :type git
       :host codeberg
       :repo "akib/emacs-eat"
       :files ("*.el" ("term" "term/*.el") "*.texi"
               "*.ti" ("terminfo/e" "terminfo/e/*")
               ("terminfo/65" "terminfo/65/*")
               ("integration" "integration/*")
               (:exclude ".dir-locals.el" "*-tests.el"))))

(after-load 'eat
        (setq eat-kill-buffer-on-exit t)
        (define-key eat-mode-map (kbd "C-g") 'eat-self-input))

(global-set-key (kbd (if (display-graphic-p) "C-4" "C-\\")) 'eat)

(provide 'init-eat)
