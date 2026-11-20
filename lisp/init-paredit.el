;; -*- lexical-binding: t -*-

(straight-use-package 'paredit)

(straight-use-package 'rainbow-delimiters)

(straight-use-package 'expand-region)

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

;; Shared Lisp editing commands belong to Paredit, not to the Elisp setup.
(defun mark-outer-sexp ()
       (interactive)
       (call-interactively 'backward-up-list)
       (call-interactively 'evil-exit-visual-state)
       (call-interactively 'evil-jump-item)
       (call-interactively 'evil-visual-char)
       (call-interactively 'evil-jump-item))

(defun my-expand-region ()
       (interactive)
       (when (= (- (region-end) (region-beginning)) 1)
             (call-interactively 'evil-exit-visual-state))
       (call-interactively 'er/expand-region))

(defun my-forward-sexp ()
       (interactive)
       (if (= (point) (region-beginning))
               (let ((origin-point (point)))
                    (goto-char (region-end))
                    (backward-sexp -1)
                    (let ((end-point (point)))
                         (set-mark origin-point)
                         (goto-char end-point)))
               (backward-sexp -1)))

(defun check-selected-text ()
       "Return non-nil if the selected text contains whitespace."
       (interactive)
       (if (string-match-p "[[:space:]\n]"
                           (buffer-substring-no-properties
                            (region-beginning) (region-end)))
               t
               nil))

(defun enter-after-sexp ()
       (interactive)
       (let ((region-end-evil (region-end)))
            (call-interactively 'evil-insert)
            (goto-char (region-end))
            (call-interactively 'paredit-RET)))

(defun lisp-expand-til-multiple-sexp ()
       (interactive)
       (while (not (check-selected-text))
              (call-interactively 'my-expand-region)))

(defun paredit-wrap-round-from-behind ()
       (interactive)
       (forward-sexp -1)
       (paredit-wrap-round)
       (forward-sexp 1)
       (insert " "))

;; Install as soon as both maps are available, including when reloading the
;; configuration after startup.  All Paredit buffers get the same Lisp keys.
(after-load 'paredit
        (after-load 'evil
                (evil-define-key 'normal paredit-mode-map
                        (kbd "SPC sw") 'transpose-sexps
                        (kbd "SPC sl") 'paredit-forward-slurp-sexp
                        (kbd "SPC sh") 'paredit-backward-slurp-sexp
                        (kbd "SPC ss") 'paredit-split-sexp
                        (kbd "SPC s;") 'lisp-comment-sexp
                        (kbd "SPC sr") 'paredit-raise-sexp
                        (kbd "SPC al") 'paredit-forward-barf-sexp
                        (kbd "SPC ah") 'paredit-backward-barf-sexp
                        (kbd "D") 'paredit-kill
                        (kbd "C") 'paredit-kill-and-insert)
                (evil-define-key 'visual paredit-mode-map
                        (kbd "v") 'my-expand-region
                        (kbd "V") 'lisp-expand-til-multiple-sexp
                        (kbd "C-<return>") 'enter-after-sexp
                        (kbd "C-l") 'my-forward-sexp
                        (kbd "C-h") 'backward-sexp)
                (evil-define-key 'insert paredit-mode-map
                        (kbd "C-9") 'paredit-wrap-round-from-behind)))


(provide 'init-paredit)
