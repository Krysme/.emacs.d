
(ensure-package 'rust-mode)
(ensure-package 'flycheck)
(ensure-package 'eglot)

(after-load 'eglot
  (add-hook 'rust-mode-hook 'eglot-ensure)
  (add-hook 'c-mode-hook 'eglot-ensure)
  (add-to-list 'eglot-server-programs '((c++-mode c-mode) . (eglot-cquery "cquery"))))






(provide 'lsp-setup)
