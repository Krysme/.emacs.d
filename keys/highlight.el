
(after-load 'evil
  (after-load 'evil-search-highlight-persist
    (progn
      (global-evil-search-highlight-persist t)
      (set-face-background 'evil-ex-lazy-highlight "gold")
      (setq evil-ex-search-highlight-persist-all-windows t)
      (evil-define-motion evil-nohl () (evil-search-highlight-persist-remove-all))
      (define-key evil-normal-state-map (kbd "SPC SPC") 'evil-nohl))))

