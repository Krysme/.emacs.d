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

(setq krys-ui-doc-show t)
(setq lsp-ui-doc-show-with-cursor t)
(setq lsp-ui-doc-position 'at-point)
(setq lsp-ui-sideline-show-code-actions t)

;; keys
(add-hook
 'lsp-mode-hook
 (lambda () 
   (add-hook 'before-save-hook 'lsp-format-buffer)
   (define-key lsp-mode-map (kbd "C-c C-f") 'lsp-format-buffer)
   (define-key lsp-mode-map (kbd "C-C C-c") 'lsp-ui-sideline-apply-code-actions)
   (define-key lsp-mode-map (kbd "C-C r") 'lsp-find-references)
   (after-load 'evil 
     (define-key evil-normal-state-map (kbd "SPC o") 'lsp-rename)
     (define-key evil-visual-state-map (kbd "v") 'lsp-extend-selection)
     (define-key evil-normal-state-map (kbd "SPC i") (lambda () (interactive)
						       (if krys-ui-doc-show
							   (progn
							     (lsp-ui-doc-enable nil)
							     (lsp-ui-doc-hide)
							     (setq krys-ui-doc-show nil))
							 (progn
							   (lsp-ui-doc-enable t)
							   (lsp-ui-doc-show)
							   (setq krys-ui-doc-show t)))
						       )))))






(provide 'init-lsp)
