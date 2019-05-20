

(ensure-package 'ccls)


(after-load 'lsp-mode
  (add-hook 'c-mode-hook 'lsp))

(after-load 'lsp-mode
  (add-hook 'c++-mode-hook 'lsp))

(add-hook 'c++-mode-hook 'smartparens-mode)
(add-hook 'c-mode-hook 'smartparens-mode)
