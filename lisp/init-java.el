(use-package lsp-java
  :straight t
  :config (add-hook 'java-mode-hook 'lsp))
(use-package dap-mode :straight t :after lsp-mode :config (dap-auto-configure-mode))


(provide 'init-java)
