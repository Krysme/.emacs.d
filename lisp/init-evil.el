;; -*- lexical-binding: t -*-
(setq evil-want-C-i-jump t)
(setq evil-want-C-u-scroll t)
(setq evil-want-keybinding nil)
;; init before evil

(straight-use-package 'evil)
(straight-use-package 'evil-collection)
(straight-use-package 'undo-fu)
(evil-collection-init)

;; disable space
(after-load 'dired (define-key dired-mode-map (kbd "SPC") nil))

;; ensure some dired functions
(use-package 
  dired-x 
  :ensure nil)

;; key redefinition
(after-load 'dired (global-set-key (kbd "C-x d") nil))

;; dired entry
(after-load 'evil (evil-global-set-key 'normal " d" 'dired-jump))


(fset 'evil-visual-update-x-selection 'ignore)

(after-load 'evil-collection (evil-collection-define-key 'normal 'dired-mode-map " " nil "k" nil
			       (kbd "<return>") 'dired-find-file [tab] 'dired-find-file (kbd "TAB")
			       'dired-find-file " k" 'kill-this-buffer (kbd "C-l")
			       'dired-up-directory))

(evil-mode t)

(evil-set-undo-system 'undo-fu)

(after-load 'evil 
  (setq evil-goto-definition-functions '(evil-goto-definition-xref evil-goto-definition-imenu
								   evil-goto-definition-semantic
								   evil-goto-definition-search)))

;; keys

;; (add-hook 'view-mode-hook
;; 	  (lambda ()
;; 	    (interactive)
;; 	    (define-key view-mode-map (kbd "SPC") nil)))

(define-key key-translation-map (kbd "<ESC>") 
  (kbd "C-g"))

;; Normal mode
(define-key evil-normal-state-map (kbd "SPC hf") #'helpful-callable)
(define-key evil-normal-state-map (kbd "SPC hv") #'helpful-variable)
(define-key evil-normal-state-map (kbd "SPC hk") #'helpful-key)
(define-key evil-normal-state-map (kbd "SPC ho") #'helpful-symbol)
(define-key evil-normal-state-map (kbd "SPC hp") #'helpful-at-point)


(define-key evil-normal-state-map (kbd "SPC k") 'kill-this-buffer)
(define-key evil-normal-state-map (kbd "SPC x") #'execute-extended-command)
(define-key evil-normal-state-map (kbd "SPC b") #'switch-to-buffer)

(define-key evil-normal-state-map (kbd "SPC ,r") 
  (lambda 
    (&optional 
     d
     p) 
    (interactive "DSearch Directory:\nP") 
    (consult-ripgrep d p)))

(define-key evil-normal-state-map (kbd "C-s") 'save-buffer)
(define-key evil-normal-state-map (kbd "C-h") 'evil-first-non-blank)
(define-key evil-normal-state-map (kbd "C-l") 'evil-end-of-line)
(define-key evil-normal-state-map (kbd "C-j") 
  (lambda () 
    (interactive) 
    (evil-next-line 5)))
(define-key evil-normal-state-map (kbd "C-k") 
  (lambda () 
    (interactive) 
    (evil-previous-line 5)))
(define-key evil-normal-state-map (kbd "C-e") 
  (lambda () 
    (interactive) 
    (evil-scroll-line-down 5)))
(define-key evil-normal-state-map (kbd "C-y") 
  (lambda () 
    (interactive) 
    (evil-scroll-line-up 5)))
(define-key evil-normal-state-map (kbd "SPC k") 'kill-this-buffer)

(define-key evil-normal-state-map (kbd "SPC wo") 'delete-other-windows)
(define-key evil-normal-state-map (kbd "SPC wq") 'kill-emacs)
(define-key evil-normal-state-map (kbd "SPC wv") 'evil-window-vsplit)
(define-key evil-normal-state-map (kbd "SPC ws") 'evil-window-split)
(define-key evil-normal-state-map (kbd "SPC wj") 'evil-window-down)
(define-key evil-normal-state-map (kbd "SPC wk") 'evil-window-up)
(define-key evil-normal-state-map (kbd "SPC wh") 'evil-window-left)
(define-key evil-normal-state-map (kbd "SPC wl") 'evil-window-right)

;; File

(define-key evil-normal-state-map (kbd "SPC f") 'find-file)



;; insert mode


(define-key evil-insert-state-map (kbd "C-l") 'forward-char)
(define-key evil-insert-state-map (kbd "C-j") 'next-line)
(define-key evil-insert-state-map (kbd "C-k") 'previous-line)
(define-key evil-insert-state-map (kbd "C-h") 'backward-char)
(define-key evil-insert-state-map (kbd "C-s") 'save-buffer)
(define-key evil-insert-state-map (kbd "C-e") 
  (lambda () 
    (interactive) 
    (evil-scroll-line-down 5)))
(define-key evil-insert-state-map (kbd "C-y") 
  (lambda () 
    (interactive) 
    (evil-scroll-line-up 5)))

;; visual mode
(evil-define-motion 
  evil-move-5-lines-down
  () 
  (evil-next-visual-line 5))
(evil-define-motion 
  evil-move-5-lines-up
  () 
  (evil-previous-visual-line 5))

(define-key evil-visual-state-map (kbd "C-j") 'evil-move-5-lines-down)
(define-key evil-visual-state-map (kbd "C-k") 'evil-move-5-lines-up)

(define-key evil-motion-state-map (kbd "C-e") 
  (lambda () 
    (interactive) 
    (evil-scroll-line-down 5)))
(define-key evil-motion-state-map (kbd "C-y") 
  (lambda () 
    (interactive) 
    (evil-scroll-line-up 5)))


(provide 'init-evil)
