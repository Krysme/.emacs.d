;; -*- lexical-binding: t -*-
(straight-use-package 'rust-mode)
(straight-use-package 'cargo)
(straight-use-package 'toml-mode)

(setq lsp-rust-server 'rust-analyzer)
(setq lsp-rust-analyzer-server-display-inlay-hints nil)
(setq lsp-rust-analyzer-display-chaining-hints t)
(setq lsp-rust-analyzer-cargo-watch-command "clippy")
(setq lsp-rust-analyzer-cargo-load-out-dirs-from-check t)
(setq lsp-rust-features [])
(setq lsp-rust-analyzer-proc-macro-enable t)
(setq lsp-rust-analyzer-experimental-proc-attr-macros t)

(setq lsp-response-timeout 100)

(add-hook 'rust-mode-hook 'lsp-deferred)

(add-hook 'rust-mode-hook 'smartparens-mode)
(add-hook 'rust-mode-hook 'show-paren-mode)
(add-hook 'rust-mode-hook 
	  (lambda () 
	    (setq tab-width 4)))


(add-hook 'toml-mode-hook 'smartparens-mode)

(add-hook 'toml-mode-hook 
	  (lambda () 
	    (define-key evil-visual-state-map (kbd "(") 'sp-wrap-round) 
	    (define-key evil-visual-state-map (kbd ")") 'sp-wrap-square) 
	    (define-key evil-visual-state-map (kbd "{") 'sp-wrap-curly) 
	    (define-key evil-visual-state-map (kbd "\"") 
	      (lambda () 
		(interactive) 
		(sp-wrap-with-pair "\"")))))


(after-load 'smartparens (sp-local-pair 'rust-mode "'" nil 
					:actions nil) 
	    (sp-local-pair 'rust-mode "<" ">") 
	    (sp-local-pair 'toml-mode "\"" "\"") 
	    (sp-local-pair 'rust-mode "\"" "\""))


(add-hook 'rust-mode-hook 
	  (lambda () 
	    (define-key rust-mode-map (kbd "C-c C-b") 'cargo-process-build) 
	    (define-key rust-mode-map (kbd "C-c C-r") 'cargo-process-run)
	    (define-key evil-visual-state-map (kbd "(") 'sp-wrap-round) 
	    (define-key evil-visual-state-map (kbd ")") 'sp-wrap-square) 
	    (define-key evil-visual-state-map (kbd "{") 'sp-wrap-curly) 
	    (define-key evil-visual-state-map (kbd "<") 
	      (lambda () 
		(interactive) 
		(sp-wrap-with-pair "<")))))


(setq cargo-process--command-run "run --release")
(setq cargo-process--command-build "build --release")
(setq cargo-process--command-clippy "clippy")

(after-load 'rust-mode (rust-enable-format-on-save))


(provide 'init-rust)
