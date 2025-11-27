(straight-use-package 'treemacs)
(straight-use-package 'treemacs-evil)
(straight-use-package 'lsp-treemacs)



(after-load 'treemacs
        (if (display-grayscale-p) 
                (progn
	                (evil-define-key 'normal treemacs-mode-map (kbd "TAB") 'treemacs-TAB-action)
	                (evil-define-key 'normal treemacs-mode-map (kbd "RET") 'treemacs-RET-action))))

(provide 'init-treemacs)
