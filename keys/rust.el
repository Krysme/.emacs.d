
(after-load 'rust-mode
  (define-key rust-mode-map (kbd "C-c C-f") nil))

(after-load 'cargo
  (define-key rust-mode-map (kbd "C-c C-b") 'cargo-process-build)
  (define-key rust-mode-map (kbd "C-c C-r") 'cargo-process-run))
