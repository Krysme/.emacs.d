
(setq krys-ui-doc-show t)
(after-load 'lsp-mode
  (add-hook
   'lsp-mode-hook
   (lambda () (interactive)
	 (define-key evil-normal-state-map (kbd "SPC a") 'lsp-ui-sideline-apply-code-actions)
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
