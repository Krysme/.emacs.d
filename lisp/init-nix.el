
(use-package nix-mode
  :straight t
  :hook (nix-mode . lsp-deferred)
  :mode "\\.nix\\'")

(setq lsp-nix-nil-formatter ["nixfmt"])
(provide 'init-nix)
