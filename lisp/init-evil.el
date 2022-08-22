;; -*- lexical-binding: t -*-
(setq evil-want-C-i-jump t)
(setq evil-want-C-u-scroll t)
(setq evil-want-keybinding nil)
;; init before evil

(straight-use-package 'evil)
(straight-use-package 'dash)
(straight-use-package 'evil-collection)
(straight-use-package 'undo-fu)
(evil-collection-init)
(require 'dash)

;; disable space
(after-load 'dired (define-key dired-mode-map (kbd "SPC") nil))

;; ensure some dired functions
(use-package 
  dired-x 
  :ensure nil)

(add-hook 'view-mode-hook 'evil-motion-state)

;; key redefinition
(after-load 'dired (global-set-key (kbd "C-x d") nil))

;; dired entry
(after-load 'evil (evil-global-set-key 'normal " d" 'dired-jump))


(fset 'evil-visual-update-x-selection 'ignore)

(after-load 'evil-collection
  (evil-collection-define-key
    'normal 'dired-mode-map
    " " nil
    "k" nil
    (kbd "<return>") 'dired-find-file
    [tab] 'dired-find-file
    (kbd "TAB")
    'dired-find-file " k"
    'kill-this-buffer (kbd "C-l")
    'dired-up-directory))

(evil-mode t)

(evil-set-undo-system 'undo-fu)

(after-load 'evil 
  (setq evil-goto-definition-functions '(evil-goto-definition-xref
					 evil-goto-definition-imenu
					 evil-goto-definition-semantic
					 evil-goto-definition-search)))

;; keys


(define-key key-translation-map (kbd "<ESC>") 
  (kbd "C-g"))


;; Normal mode
(evil-global-set-key 'normal (kbd "C-s") 'save-buffer)

;; Normal and Motion
(evil-define-motion 
  evil-move-5-lines-down
  () 
  (evil-next-visual-line 5))
(evil-define-motion 
  evil-move-5-lines-up
  () 
  (evil-previous-visual-line 5))

(defun ripgrep-search
  (&optional 
   d
   p) 
  (interactive "DSearch Directory:\nP") 
  (consult-ripgrep d p))


(defun after-init-set-evil-keymap()
  "set evil keymap"
  (-each (list 'normal 'motion 'visual) 'setup-normal-motion-visual-keys)
  (setup-visual-keys))

(add-hook 'emacs-startup-hook 'after-init-set-evil-keymap)



(defun setup-visual-keys ()
  (evil-global-set-key 'visual (kbd "(") 'sp-wrap-round) 
  (evil-global-set-key 'visual (kbd ")") 'sp-wrap-square) 
  (evil-global-set-key 'visual (kbd "{") 'sp-wrap-curly) 
  (evil-global-set-key 'visual (kbd "\"") (lambda () (interactive) (sp-wrap-with-pair "\""))))

(defun setup-normal-motion-visual-keys (mode)
  (evil-global-set-key mode (kbd "K") nil)
  (evil-global-set-key mode (kbd "SPC") nil)
  (evil-global-set-key mode (kbd "SPC hf") #'helpful-callable)
  (evil-global-set-key mode (kbd "SPC hv") #'helpful-variable)
  (evil-global-set-key mode (kbd "SPC hk") #'helpful-key)
  (evil-global-set-key mode (kbd "SPC ho") #'helpful-symbol)
  (evil-global-set-key mode (kbd "SPC hp") #'helpful-at-point)
  (evil-global-set-key mode (kbd "SPC k") 'kill-this-buffer)
  (evil-global-set-key mode (kbd "SPC x") #'execute-extended-command)
  (evil-global-set-key mode (kbd "SPC b") #'switch-to-buffer)
  (evil-global-set-key mode (kbd "C-h") 'evil-first-non-blank)
  (evil-global-set-key mode (kbd "C-l") 'evil-end-of-line)
  (evil-global-set-key mode (kbd "C-j") 'evil-move-5-lines-down)
  (evil-global-set-key mode (kbd "C-k") 'evil-move-5-lines-up)
  (evil-global-set-key mode (kbd "C-e") (lambda () (interactive) (evil-scroll-line-down 5)))
  (evil-global-set-key mode (kbd "C-y") (lambda () (interactive) (evil-scroll-line-up 5)))
  (evil-global-set-key mode (kbd "SPC k") 'kill-this-buffer)
  (evil-global-set-key mode (kbd "SPC wo") 'delete-other-windows)
  (evil-global-set-key mode (kbd "SPC wq") 'delete-window)
  (evil-global-set-key mode (kbd "SPC wv") 'evil-window-vsplit)
  (evil-global-set-key mode (kbd "SPC ws") 'evil-window-split)
  (evil-global-set-key mode (kbd "SPC wj") 'evil-window-down)
  (evil-global-set-key mode (kbd "SPC wk") 'evil-window-up)
  (evil-global-set-key mode (kbd "SPC wh") 'evil-window-left)
  (evil-global-set-key mode (kbd "SPC wl") 'evil-window-right)
  (evil-global-set-key mode (kbd "SPC ,r") 'ripgrep-search)
  (evil-global-set-key mode (kbd "SPC f") 'find-file)
  (evil-global-set-key mode (kbd "SPC /") (lambda () (interactive) (consult-line)))
  (evil-global-set-key mode (kbd "SPC #") (lambda () (interactive) (consult-line (word-at-point))))
  (evil-global-set-key mode (kbd "SPC *") (lambda () (interactive) (consult-line-reverse (word-at-point))))
  (evil-global-set-key mode (kbd "SPC r") 'consult-recent-file-no-action)
  (evil-global-set-key mode (kbd "SPC mg") 'magit))

;; insert mode

(evil-global-set-key 'insert (kbd "C-l") 'forward-char)
(evil-global-set-key 'insert (kbd "C-j") 'next-line)
(evil-global-set-key 'insert (kbd "C-k") 'previous-line)
(evil-global-set-key 'insert (kbd "C-h") 'backward-char)
(evil-global-set-key 'insert (kbd "C-s") 'save-buffer)

(evil-global-set-key 'insert (kbd "C-e") 
  (lambda () 
    (interactive) 
    (evil-scroll-line-down 5)))
(evil-global-set-key 'insert (kbd "C-y") 
  (lambda () 
    (interactive) 
    (evil-scroll-line-up 5)))


(provide 'init-evil)
