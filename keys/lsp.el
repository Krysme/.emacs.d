
(setq krys-ui-doc-show t)
(after-load 'lsp-mode
  (add-hook
   'lsp-mode-hook
   (lambda () (interactive)
	 (define-key lsp-mode-map (kbd "C-c C-f") 'lsp-format-buffer)
	 (define-key lsp-mode-map (kbd "C-C C-c") 'lsp-ui-sideline-apply-code-actions)
	 (define-key lsp-mode-map (kbd "C-C r") 'lsp-find-references)
	 (define-key evil-normal-state-map (kbd "SPC o") 'lsp-rename)
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
