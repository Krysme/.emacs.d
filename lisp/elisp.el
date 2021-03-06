(ensure-package 'paredit)
(ensure-package 'rainbow-delimiters)
(ensure-package 'popwin)
(popwin-mode t)

(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
(add-hook 'emacs-lisp-mode-hook 'company-mode)

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
       (define-key evil-normal-state-map (kbd "SPC s l") 'paredit-forward-slurp-sexp)
       (define-key evil-normal-state-map (kbd "SPC s f") 'paredit-forward-barf-sexp)
       (define-key evil-normal-state-map (kbd "SPC s r") 'paredit-raise-sexp)
       (define-key evil-normal-state-map (kbd "SPC s ;") 'lisp-comment-sexp)
       (define-key evil-normal-state-map (kbd "SPC s h") 'paredit-backward-barf-sexp)
       (define-key evil-normal-state-map (kbd "SPC s s") 'paredit-split-sexp)))))


(after-load 'paredit
  (add-hook 'emacs-lisp-mode-hook 'paredit-mode))


(after-load 'rainbow-delimiters
  (add-hook 'paredit-mode-hook 'rainbow-delimiters-mode))

