(use-package 
        python-mode 
        :straight t 
        :ensure t 
        :hook (python-mode . lsp-deferred) 
        :custom (dap-python-debugger 'debugpy) 
        :config (require 'dap-python))

(use-package 
        pyvenv 
        :straight t 
        :config (pyvenv-mode 1))

(use-package lsp-pyright
        :straight t
        :ensure t
        :hook (python-mode . (lambda ()
                                     (require 'lsp-pyright)
                                     (lsp))))
(use-package python-black
        :straight t
        :demand t
        :after python
        :hook (python-mode . python-black-on-save-mode-enable-dwim))

(add-hook 'python-mode-hook 'smartparens-mode)


(provide 'init-python)
