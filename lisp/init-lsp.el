;; -*- lexical-binding: t -*-

(defface lsp-ui-sideline-code-action '((t :foreground "red")) "Face used to highlight code action text."
    :group 'lsp-ui-sideline)

(straight-use-package 'lsp-mode)
(straight-use-package 'lsp-ui)
(straight-use-package 'smartparens)
(straight-use-package 'flycheck)
(setq lsp-file-watch-threshold 10000)
(require 'dash)

(after-load 'lsp-mode
    (add-hook 'lsp-mode-hook (lambda () (flycheck-mode t))))

(setq lsp-idle-delay 0.2
      lsp-log-io nil)

(after-load 'lsp-mode
  (setq lsp-session-file
        (expand-file-name (format ".lsp-session-%s" (or (getenv "MSYSTEM") "")) user-emacs-directory)))

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
    (define-key lsp-mode-map (kbd "C-c g") 'treemacs)
    (define-key evil-normal-state-map (kbd "C-c k") 'lsp-treemacs-symbols)
    (define-key evil-normal-state-map (kbd "K") 'lsp-ui-doc-focus-frame)
    (define-key lsp-mode-map (kbd "C-C l") 'lsp-treemacs-errors-list))

(defun lsp-mode-evil-key-binding ()
       (define-key evil-normal-state-map (kbd "g r") 'xref-find-references)
       (define-key evil-normal-state-map (kbd "g t") 'lsp-find-type-definition)
       (define-key evil-normal-state-map (kbd "SPC o") 'lsp-rename)
       (define-key evil-visual-state-map (kbd "v") 'lsp-extend-selection)
       (define-key evil-normal-state-map lsp-ui-doc-frame-mode-map (kbd "q") #'lsp-ui-doc-unfocus-frame))

(add-hook 'lsp-mode-hook 'lsp-mode-evil-key-binding)


(after-load 'evil
    (add-hook 'evil-visual-state-exit-hook (lambda () (setq lsp--document-selection-range-cache nil))))

(defun lsp-ui-doc-turn-off-advice (orig-fun &rest args)
    (if (fboundp 'lsp-ui-doc-mode)
	(lsp-ui-doc-mode -1))
    (condition-case err
	(progn 
	    (apply orig-fun args)
	    (if (fboundp 'lsp-ui-doc-mode)
		(progn  (lsp-ui-doc-mode 1))))
	(error
	    (if (fboundp 'lsp-ui-doc-mode)
		(progn  (lsp-ui-doc-mode 1)))
	    (signal (car err) (cdr err)))))

(defun lsp-ui-doc-turn-on-advice (orig-fun &rest args)
    (apply orig-fun args)
    (lsp-ui-doc-mode 1))


(after-load 'evil
    (advice-add 'evil-search-forward :around #'lsp-ui-doc-turn-off-advice)
    (advice-add 'evil-search-backward :around #'lsp-ui-doc-turn-off-advice)
    (evil-set-initial-state 'lsp-mode 'normal)
    )

;; keys
(add-hook 'lsp-mode-hook 'init-lsp-set-keys)





(provide 'init-lsp)
