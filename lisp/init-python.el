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


(add-hook 'python-mode-hook 'smartparens-mode)

(setq lsp-pylsp-plugins-flake8-ignore '("E303"))

(provide 'init-python)
