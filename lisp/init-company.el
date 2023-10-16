
(straight-use-package 'company)



(add-hook 'after-init-hook 'global-company-mode)




(defun lisp-select-only-one-or-select-current()
  "How tab should behave when completing code"
  (interactive)
  (unless  (> company-candidates-length 1)
    (call-interactively 'company-select-next)
    (call-interactively 'company-complete-selection))
  (if company-selection
      (call-interactively 'company-complete-selection)
    (call-interactively 'company-select-next)))


(after-load 'company
  (define-key company-active-map [tab] 'lisp-select-only-one-or-select-current)
  (define-key company-active-map (kbd "TAB") 'lisp-select-only-one-or-select-current)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "C-w") nil))
(setq company-minimum-prefix-length 1)



(provide 'init-company)
