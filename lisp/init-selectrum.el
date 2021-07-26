
(straight-use-package 'selectrum)

(selectrum-mode +1)
(straight-use-package 'prescient)
(straight-use-package 'selectrum-prescient)

(selectrum-prescient-mode +1)
(prescient-persist-mode +1)

(straight-use-package 'consult)




(after-load 'evil
  (define-key evil-normal-state-map (kbd "SPC r") 'consult-recent-file))

(provide 'init-selectrum)
