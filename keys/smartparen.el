
(after-load 'smartparens
  (add-hook
   'smartparens-mode-hook
   (lambda ()
     (define-key sp-pair-overlay-keymap (kbd "C-g") nil))))
