;; -*- lexical-binding: t -*-
(straight-use-package 'selectrum)

(selectrum-mode +1)
(straight-use-package 'prescient)
(straight-use-package 'selectrum-prescient)

(selectrum-prescient-mode +1)
(prescient-persist-mode +1)

(use-package consult
  :straight t
  :ensure t)

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



(setq prescient-filter-method '(literal fuzzy))

(after-load 'evil
  (define-key evil-normal-state-map (kbd "/") (lambda () (interactive) (consult-line)))
  (define-key evil-normal-state-map (kbd "#") (lambda () (interactive) (consult-line (word-at-point))))
  (define-key evil-normal-state-map (kbd "*") (lambda () (interactive) (consult-line-reverse (word-at-point))))
  (define-key evil-normal-state-map (kbd "SPC r") 'consult-recent-file-no-action))

;; (advice--interactive-form)

;; ugly hack for cycling
(defun selectrum-previous-candidate-cycle (&optional arg)
  "Move selection ARG candidates up, cycle at the beginning."
  (interactive "p")
  (if (= selectrum--current-candidate-index
	  (if (string-match-p "consult-line" (format "%s" selectrum--last-command)) 0 -1))
      (selectrum-next-candidate 99999)
    (selectrum-previous-candidate)))

(defun selectrum-next-candidate-cycle (&optional arg)
  "Move selection ARG candidates up, cycle at the beginning."
  (interactive "p")
  (if (= selectrum--current-candidate-index (- (length selectrum--refined-candidates) 1))
      (progn 
	(selectrum-previous-candidate 99999)
	(when (string-match-p "consult-line" (format "%s" selectrum--last-command))
	  (selectrum-next-candidate)))
    (selectrum-next-candidate)))

(defun selectrum-super-tab ()
  "if the minibuffer contents stay the same after tab, then select it"
  (interactive)
  (let ((content (minibuffer-contents-no-properties)))
    (selectrum-insert-current-candidate)
    (when (string-equal content (minibuffer-contents-no-properties))
	(selectrum-select-current-candidate))))

(define-key selectrum-minibuffer-map (kbd "TAB") 'selectrum-super-tab)
(define-key selectrum-minibuffer-map (kbd "C-p") 'selectrum-previous-candidate-cycle)
(define-key selectrum-minibuffer-map (kbd "C-n") 'selectrum-next-candidate-cycle)

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

(defun selectrum-up-directory ()
  "go up one directory"
  (interactive)
  (let ((directory (minibuffer-contents-no-properties)))
    (delete-minibuffer-contents)
    (insert (string-trim-right (if (string= directory "~/") (expand-file-name "~/") directory) "[^/]+/?"))))


(define-key minibuffer-local-map (kbd "C-l") #'selectrum-up-directory)

(provide 'init-selectrum)
