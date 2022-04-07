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

(use-package 
  dap-mode
  ;; Uncomment the config below if you want all UI panes to be hidden by default!
  ;; :custom
  ;; (lsp-enable-dap-auto-configure nil)
  :config (dap-ui-mode 1) 
  :straight t 
  :config
  ;; Set up Node debugging
  (require 'dap-node) 
  (dap-node-setup) ;; Automatically installs Node debug adapter if needed

  ;; Bind `C-c l d` to `dap-hydra` for easy access
  )

;; (add-hook 'python-mode-hook 'smartparens-mode)

(setq lsp-pylsp-plugins-flake8-ignore '("E303"))

(provide 'init-python)
