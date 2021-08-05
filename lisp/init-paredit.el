;; -*- lexical-binding: t -*-

(straight-use-package 'paredit)

(straight-use-package 'rainbow-delimiters)

(add-hook 'paredit-mode-hook 'rainbow-delimiters-mode)

(defun lisp-comment-sexp ()
  "comment out the sexp at point."
  (interactive)
  (save-excursion
    (mark-sexp)
    (paredit-comment-dwim)))

(after-load 'paredit
  (after-load 'evil
    (add-hook
     'paredit-mode-hook
     (lambda ()
       (define-key evil-normal-state-map (kbd "SPC s w") 'transpose-sexps)
       (define-key evil-normal-state-map (kbd "SPC s l") 'paredit-forward-slurp-sexp)
       (define-key evil-normal-state-map (kbd "SPC a l") 'paredit-forward-barf-sexp)
       (define-key evil-normal-state-map (kbd "SPC s f") 'paredit-forward-barf-sexp)
       (define-key evil-normal-state-map (kbd "SPC s r") 'paredit-raise-sexp)
       (define-key evil-normal-state-map (kbd "SPC s ;") 'lisp-comment-sexp)
       (define-key evil-normal-state-map (kbd "SPC s h") 'paredit-backward-barf-sexp)
       (define-key evil-normal-state-map (kbd "SPC s s") 'paredit-split-sexp)))))

(provide 'init-paredit)
