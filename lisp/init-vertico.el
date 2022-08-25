(use-package vertico
  :straight t
  :ensure t
  :init
  (vertico-mode) 
  (setq vertico-count 10)
  (setq vertico-resize nil)
  (setq vertico-cycle t))

(straight-use-package 'savehist
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


(defun consult-line-reverse (&optional initial start)
  "This is a reversed version of `consult-line'"
  (interactive (list nil (not (not current-prefix-arg))))
  (let ((curr-line (line-number-at-pos (point) consult-line-numbers-widen))
	(top (not (eq start consult-line-start-from-top))))
    (consult--line
     (or (consult--with-increased-gc
	  (utils-reverse-cdr (consult--line-candidates top curr-line)))
	 (user-error "No lines"))
     :curr-line (and (not top) curr-line)
     :prompt (if top "Go to line from top: " "Go to line: ")
     :initial initial)))

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


(defun vertico-up-directory ()
  "go up one directory"
  (interactive)
  (let ((directory (minibuffer-contents-no-properties)))
    (delete-minibuffer-contents)
    (insert (string-trim-right (if (string= directory "~/") (expand-file-name "~/") directory) "[^/]+/?"))))



(setq sudo-prefix "/sudo::")

(defun vertico-sudo ()
  "enable sudo functionality"
  (interactive)
  (let* ((buffer-content (minibuffer-contents-no-properties))
	 (is-sudo (string-prefix-p sudo-prefix buffer-content))
	 (changed-dir (if is-sudo
			  (substring buffer-content (length sudo-prefix))
			(concat sudo-prefix (expand-file-name buffer-content)))))
    (delete-minibuffer-contents)
    (insert changed-dir)))



(define-key vertico-map (kbd "C-l") 'vertico-up-directory)
(define-key vertico-map (kbd "C-s") 'vertico-sudo)
(define-key vertico-map (kbd "TAB") 'vertico-super-tab)

(defun vertico-super-tab ()
  "if the minibuffer contents stay the same after tab, then select it"
  (interactive)
  (let ((content (minibuffer-contents-no-properties)))
    (vertico-insert)
    (when (string-equal content (minibuffer-contents-no-properties))
	(vertico-exit))))

(provide 'init-vertico)
