(use-package which-key
        :ensure t
        :straight t
        :config
        (which-key-mode)
        :init
        (setq which-key-idle-delay 0.3))

(provide 'init-which-key)
