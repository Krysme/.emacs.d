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
     )))



(defun paredit-custom-leader-keys()
  (define-key evil-normal-state-map (kbd "<leader>sw") 'transpose-sexps)
  (define-key evil-normal-state-map (kbd "<leader>sl") 'paredit-forward-slurp-sexp)
  (define-key evil-normal-state-map (kbd "<leader>al") 'paredit-forward-barf-sexp)
  (define-key evil-normal-state-map (kbd "<leader>sf") 'paredit-forward-barf-sexp)
  (define-key evil-normal-state-map (kbd "<leader>sr") 'paredit-raise-sexp)
  (define-key evil-normal-state-map (kbd "<leader>s;") 'lisp-comment-sexp)
  (define-key evil-normal-state-map (kbd "<leader>sh") 'paredit-backward-barf-sexp)
  (define-key evil-normal-state-map (kbd "<leader>ss") 'paredit-split-sexp))

(provide 'init-paredit)
