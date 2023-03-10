;; -*- lexical-binding: t -*-

(defface lsp-ui-sideline-code-action
    '((t :foreground "red"))
    "Face used to highlight code action text."
    :group 'lsp-ui-sideline)

(straight-use-package 'lsp-mode)
(straight-use-package 'lsp-ui)
(straight-use-package 'smartparens)
(straight-use-package 'flycheck)
(require 'dash)




(after-load 'lsp-mode
    (add-hook 'lsp-mode-hook (lambda () (flycheck-mode t))))


(after-load 'yasnippet
    (setq lsp-enable-snippet t)
    (add-hook 'lsp-mode-hook 'yas-minor-mode))

(setq lsp-ui-doc-show-with-cursor t)
(setq lsp-ui-doc-position 'at-point)
(setq lsp-ui-sideline-show-code-actions t)
(setq xref-prompt-for-identifier nil)

(defun init-lsp-set-keys () 
    (add-hook 'before-save-hook 'lsp-format-buffer nil t)
    (define-key lsp-mode-map (kbd "C-c C-f") 'lsp-format-buffer)
    (define-key lsp-mode-map (kbd "C-C C-c") 'lsp-ui-sideline-apply-code-actions)
    (define-key lsp-mode-map (kbd "C-C C-l") 'lsp-ui-imenu)
    (after-load 'evil 
	(evil-define-key 'normal lsp-mode-map (kbd "g r") 'xref-find-references)
	(evil-define-key 'normal lsp-mode-map (kbd "g t") 'lsp-find-type-definition)
	(evil-define-key 'normal lsp-mode-map (kbd "SPC o") 'lsp-rename)
	(evil-define-key 'visual lsp-mode-map (kbd "v") 'lsp-extend-selection)
	(after-load 'lsp-treemacs
	    (evil-define-key 'normal lsp-mode-map (kbd "C-c g") 'treemacs)
	    (evil-define-key 'normal lsp-mode-map (kbd "C-c l") 'lsp-treemacs-errors-list)
	    (evil-define-key 'normal lsp-mode-map (kbd "C-c k") 'lsp-treemacs-symbols))))
(after-load 'evil
    (add-hook 'evil-visual-state-exit-hook (lambda () (setq lsp--document-selection-range-cache nil))))
;; keys
(add-hook 'lsp-mode-hook 'init-lsp-set-keys)





(provide 'init-lsp)
