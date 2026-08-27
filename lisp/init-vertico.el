;; -*- lexical-binding: t; -*-
(use-package vertico
        :straight t
        :ensure t
        :init
        (vertico-mode) 
        (setq vertico-count 10)
        (setq vertico-resize nil)
        (setq vertico-cycle t))


(let ((msystem-postfix (or (getenv "MSYSTEM") "")))
     (setq savehist-file (expand-file-name (format "history-%s" msystem-postfix) user-emacs-directory)))

(use-package savehist
        :straight (:type built-in)
        :init
        (savehist-mode))

(use-package orderless
        :ensure t
        :straight t
        :init
        (progn 
                (setq completion-styles '(basic orderless))
                (setq completion-category-overrides '((file (styles partial-completion))))))

(use-package consult
        :straight t
        :ensure t)


(defun consult-recent-file-no-action ()
       "Find recent file using `completing-read'."
       (interactive)
       (find-file
	(consult--read
	 (or (mapcar #'abbreviate-file-name recentf-list)
	     (user-error "No recent files, `recentf-mode' is %s"
		         (if recentf-mode "on" "off")))
	 :prompt "Find recent file: "
	 :sort nil
	 :require-match t
	 :category 'file
	 :state nil
	 :history 'file-name-history)))

(use-package marginalia
        :straight t
        :ensure t
        :config
        (marginalia-mode))



(setq sudo-prefix "/sudo::")

(defun vertico-sudo ()
       "enable sudo functionality"
       (interactive)
       (let* ((buffer-content (minibuffer-contents-no-properties))
	      (is-sudo (string-prefix-p sudo-prefix buffer-content))
	      (toggled-dir (if is-sudo
			           (abbreviate-file-name (substring buffer-content (length sudo-prefix)))
			           (concat sudo-prefix (expand-file-name buffer-content)))))
	     (delete-minibuffer-contents)
	     (insert toggled-dir)))



(define-key vertico-map (kbd "C-l") 'vertico-directory-up)
(define-key vertico-map (kbd "C-s") 'vertico-sudo)
(define-key vertico-map (kbd "TAB") 'vertico-super-tab)

(defun vertico-super-tab ()
       "if the minibuffer contents stay the same after tab, then select it"
       (interactive)
       (let ((content (minibuffer-contents-no-properties)))
	    (vertico-insert)
	    (when (string-equal content (minibuffer-contents-no-properties))
	          (vertico-exit))))



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
(use-package embark-consult
        :ensure t
        :straight t
        :after (embark consult)
        :demand t ; only necessary if you have the hook below
        ;; if you want to have consult previews as you move around an
        ;; auto-updating embark collect buffer
        :hook
        (embark-collect-mode . consult-preview-at-point-mode))



(straight-use-package 'async-completing-read)
(require 'async-completing-read)

(setq acr-refresh-completion-ui 'consult-vertico--refresh)


(provide 'init-vertico)
