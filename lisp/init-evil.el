(setq evil-want-C-i-jump t)
(setq evil-want-C-u-scroll t)
(setq evil-want-keybinding nil)
;; init before evil

(straight-use-package 'evil)
(straight-use-package 'evil-collection)
(straight-use-package 'undo-tree)
(evil-collection-init)

;; disable space
(after-load 'dired
  (define-key dired-mode-map (kbd "SPC") nil))

;; ensure some dired functions
(use-package dired-x
  :ensure nil)

;; key redefinition
(after-load 'dired
  (global-set-key (kbd "C-x d") nil))

;; dired entry
(after-load 'evil
  (evil-global-set-key 'normal " d" 'dired-jump))

(after-load 'evil-collection
  (evil-collection-define-key 'normal 'dired-mode-map
    " " nil
    "k" nil
    (kbd "<return>") 'dired-find-file
    [tab] 'dired-find-file
    (kbd "TAB") 'dired-find-file
    " k" 'kill-this-buffer
    (kbd "C-l") 'dired-up-directory))

(evil-mode t)

(global-undo-tree-mode)
(evil-set-undo-system 'undo-tree)

(after-load 'evil
  (setq evil-goto-definition-functions
	'(evil-goto-definition-xref
	  evil-goto-definition-imenu
	  evil-goto-definition-semantic
	  evil-goto-definition-search)))

;; keys

(define-key key-translation-map (kbd "<ESC>") (kbd "C-g"))

;; Normal mode
(define-key evil-normal-state-map (kbd "C-s") 'save-buffer)
(define-key evil-normal-state-map (kbd "SPC k") 'kill-this-buffer)
(define-key evil-normal-state-map (kbd "C-h") 'evil-first-non-blank)
(define-key evil-normal-state-map (kbd "C-l") 'evil-end-of-line)
(define-key evil-normal-state-map (kbd "C-j") (lambda () (interactive) (evil-next-line 5)))
(define-key evil-normal-state-map (kbd "C-k") (lambda () (interactive) (evil-previous-line 5)))
(define-key evil-normal-state-map (kbd "C-e") (lambda () (interactive) (evil-scroll-line-down 5)))
(define-key evil-normal-state-map (kbd "C-y") (lambda () (interactive) (evil-scroll-line-up 5)))
(define-key evil-normal-state-map (kbd "SPC k") 'kill-this-buffer)

(define-key evil-normal-state-map (kbd "SPC w o") 'delete-other-windows)
(define-key evil-normal-state-map (kbd "SPC w q") 'kill-emacs)
(define-key evil-normal-state-map (kbd "SPC w v") 'evil-window-vsplit)
(define-key evil-normal-state-map (kbd "SPC w s") 'evil-window-split)
(define-key evil-normal-state-map (kbd "SPC w j") 'evil-window-down)
(define-key evil-normal-state-map (kbd "SPC w k") 'evil-window-up)
(define-key evil-normal-state-map (kbd "SPC w h") 'evil-window-left)
(define-key evil-normal-state-map (kbd "SPC w l") 'evil-window-right)

;; File

(define-key evil-normal-state-map (kbd "SPC f") 'find-file)



;; insert mode


(define-key evil-insert-state-map (kbd "C-l") 'forward-char)
(define-key evil-insert-state-map (kbd "C-j") 'next-line)
(define-key evil-insert-state-map (kbd "C-k") 'previous-line)
(define-key evil-insert-state-map (kbd "C-h") 'backward-char)
(define-key evil-insert-state-map (kbd "C-s") 'save-buffer)
(define-key evil-insert-state-map (kbd "C-e") (lambda () (interactive) (evil-scroll-line-down 5)))
(define-key evil-insert-state-map (kbd "C-y") (lambda () (interactive) (evil-scroll-line-up 5)))


;; visual mode
(evil-define-motion evil-move-5-lines-down () (evil-next-visual-line 5))
(evil-define-motion evil-move-5-lines-up () (evil-previous-visual-line 5))

(define-key evil-visual-state-map (kbd "C-j") 'evil-move-5-lines-down)
(define-key evil-visual-state-map (kbd "C-k") 'evil-move-5-lines-up)

(define-key evil-motion-state-map (kbd "C-e") (lambda () (interactive) (evil-scroll-line-down 5)))
(define-key evil-motion-state-map (kbd "C-y") (lambda () (interactive) (evil-scroll-line-up 5)))
(define-key evil-motion-state-map (kbd "SPC") nil)

(provide 'init-evil)
