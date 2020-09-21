
;; (after-load 'company
;;   (define-key company-mode-map [remap indent-for-tab-command] #'company-indent-or-complete-common))


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
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "C-w") nil))
