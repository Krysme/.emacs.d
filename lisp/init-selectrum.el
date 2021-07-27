
(straight-use-package 'selectrum)

(selectrum-mode +1)
(straight-use-package 'prescient)
(straight-use-package 'selectrum-prescient)

(selectrum-prescient-mode +1)
(prescient-persist-mode +1)

(straight-use-package 'consult)


(use-package marginalia
  :straight t
  :ensure t
  :config
  (marginalia-mode))


(use-package embark
  :ensure t
  :straight t

  :bind
  (("C-." . embark-act)         ;; pick some comfortable binding
   ("C-," . embark-dwim)        ;; good alternative: M-.
   ("C-h B" . embark-bindings)) ;; alternative for `describe-bindings'

  :init

  ;; Optionally replace the key help with a completing-read interface
  (setq prefix-help-command #'embark-prefix-help-command)

  :config

  ;; Hide the mode line of the Embark live/completions buffers
  (add-to-list 'display-buffer-alist
               '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
                 nil
                 (window-parameters (mode-line-format . none)))))

;; Consult users will also want the embark-consult package.
(use-package embark-consult
  :ensure t
  :straight t
  :after (embark consult)
  :demand t ; only necessary if you have the hook below
  ;; if you want to have consult previews as you move around an
  ;; auto-updating embark collect buffer
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))



(after-load 'evil
  (define-key evil-normal-state-map (kbd "SPC r") 'consult-recent-file))

(provide 'init-selectrum)
