
;; disable space
(after-load 'dired
  (define-key dired-mode-map (kbd "SPC") nil))

;; key redefinition
(after-load 'dired
  (define-key dired-mode-map (kbd "C-l") 'dired-up-directory)
  (define-key dired-mode-map (kbd "TAB") 'dired-find-file))
