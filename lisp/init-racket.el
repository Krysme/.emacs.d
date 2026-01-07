
(straight-use-package 'racket-mode)

(add-hook 'racket-mode-hook (lambda () (define-key racket-mode-map (kbd "C-c C-r") 'racket-run)))

(after-load 'racket-mode
        (define-key racket-mode-map (kbd "C-x C-e") 'racket-eval-last-sexp-fixed))

(defun box-cursor-active-p ()
       (cond
        ((bound-and-true-p evil-local-mode) (eq evil-state 'normal))))

(defun racket-eval-last-sexp-fixed ()
       (interactive)
       (save-excursion
               (if (and (box-cursor-active-p) (memq (char-after) '(?\) ?\] ?\})))
                       (forward-char))
               (call-interactively 'racket-eval-last-sexp)))

(add-hook 'racket-mode-hook 'paredit-mode)

(add-hook 'racket-mode-hook 'company-mode)

(provide 'init-racket)
