
(after-load 'company
  (define-key company-mode-map [remap indent-for-tab-command] #'company-indent-or-complete-common))

(after-load 'company
  (define-key company-active-map [tab] 'company-complete-selection)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous)
  (define-key company-active-map (kbd "C-w") nil))
