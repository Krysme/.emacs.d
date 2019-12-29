
;; (after-load 'paredit
;;   (after-load 'evil
;;     (add-hook
;;      'paredit-mode-hook
;;      (lambda ()
;;        (define-key evil-normal-state-map (kbd "SPC s l") 'paredit-forward-slurp-sexp)
;;        (define-key evil-normal-state-map (kbd "SPC s f") 'paredit-forward-barf-sexp)
;;        (define-key evil-normal-state-map (kbd "SPC s r") 'paredit-raise-sexp)
;;        (define-key evil-normal-state-map (kbd "SPC s ;") 'lisp-comment-sexp)
;;        (define-key evil-normal-state-map (kbd "SPC s h") 'paredit-backward-barf-sexp)
;;        (define-key evil-normal-state-map (kbd "SPC s s") 'paredit-split-sexp)))))

(after-load 'evil-collection
  (evil-collection-define-key 'normal 'paredit-mode-map
	(kbd "SPC s h") 'paredit-forward-slurp-sexp
	(kbd "SPC s l") 'paredit-forward-barf-sexp
	(kbd "SPC s r") 'paredit-raise-sexp
	(kbd "C") (lambda () (interactive) (progn (paredit-kill) (evil-insert 1))))
  (evil-collection-define-key 'insert 'paredit-mode-map
	(kbd "C-w") 'paredit-backward-kill-word))
