(use-package treemacs :ensure t)
(use-package treemacs-evil :ensure t)
(use-package lsp-treemacs :ensure t)



(after-load 'treemacs
  (if (display-grayscale-p) 
      (progn
	(evil-define-key 'normal treemacs-mode-map (kbd "TAB") 'treemacs-TAB-action)
	(evil-define-key 'normal treemacs-mode-map (kbd "RET") 'treemacs-RET-action))))

(provide 'init-treemacs)
