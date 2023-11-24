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


(after-load 'evil
    (evil-define-key 'normal paredit-mode-map (kbd "SPC sw") 'transpose-sexps) 
    (evil-define-key 'normal paredit-mode-map (kbd "SPC sl") 'paredit-forward-slurp-sexp) 
    (evil-define-key 'normal paredit-mode-map (kbd "SPC al") 'paredit-forward-barf-sexp) 
    (evil-define-key 'normal paredit-mode-map (kbd "SPC sf") 'paredit-forward-barf-sexp) 
    (evil-define-key 'normal paredit-mode-map (kbd "SPC sr") 'paredit-raise-sexp) 
    (evil-define-key 'normal paredit-mode-map (kbd "SPC s;") 'lisp-comment-sexp) 
    (evil-define-key 'normal paredit-mode-map (kbd "SPC sh") 'paredit-backward-barf-sexp) 
    (evil-define-key 'normal paredit-mode-map (kbd "SPC ss") 'paredit-split-sexp) 
    (evil-define-key 'normal paredit-mode-map (kbd "D") 'paredit-kill) 
    (evil-define-key 'normal paredit-mode-map (kbd "C") 'paredit-kill-and-insert))


(provide 'init-paredit)
