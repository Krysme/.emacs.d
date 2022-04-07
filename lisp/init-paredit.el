;; -*- lexical-binding: t -*-

(straight-use-package 'paredit)

(straight-use-package 'rainbow-delimiters)

(add-hook 'paredit-mode-hook 'rainbow-delimiters-mode)

(defun lisp-comment-sexp () 
  "comment out the sexp at point." 
  (interactive) 
  (save-excursion (mark-sexp) 
		  (paredit-comment-dwim)))


(defun paredit-kill-and-insert () 
  (interactive) 
  (call-interactively 'paredit-kill) 
  (call-interactively 'evil-insert))


(defun paredit-custom-leader-keys() 
  (define-key evil-normal-state-map (kbd "SPC sw") 'transpose-sexps) 
  (define-key evil-normal-state-map (kbd "SPC sl") 'paredit-forward-slurp-sexp) 
  (define-key evil-normal-state-map (kbd "SPC al") 'paredit-forward-barf-sexp) 
  (define-key evil-normal-state-map (kbd "SPC sf") 'paredit-forward-barf-sexp) 
  (define-key evil-normal-state-map (kbd "SPC sr") 'paredit-raise-sexp) 
  (define-key evil-normal-state-map (kbd "SPC s;") 'lisp-comment-sexp) 
  (define-key evil-normal-state-map (kbd "SPC sh") 'paredit-backward-barf-sexp) 
  (define-key evil-normal-state-map (kbd "SPC ss") 'paredit-split-sexp) 
  (define-key evil-normal-state-map (kbd "D") 'paredit-kill) 
  (define-key evil-normal-state-map (kbd "C") 'paredit-kill-and-insert)
  (define-key evil-insert-state-map (kbd "C-w") 'paredit-backward-kill-word))


(provide 'init-paredit)
