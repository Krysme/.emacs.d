;; -*- lexical-binding: t -*-
(defun indent-buffer ()
  "indent current buffer"
  (interactive)
  (save-excursion
    (indent-region (point-min) (point-max) nil)))




(setq evil-want-C-i-jump t)
(setq evil-want-C-u-scroll t)
(setq evil-want-keybinding nil)

(ensure-package 'evil)
(ensure-package 'evil-collection)
(ensure-package 'undo-tree)
(evil-collection-init)

(after-load 'undo-tree (global-undo-tree-mode))

(after-load 'evil
  (evil-mode))

(after-load 'evil
  (evil-set-undo-system 'undo-tree)
  (setq evil-insert-state-cursor 'bar)
  (setq evil-normal-state-cursor nil)
  (setq evil-move-cursor-back t))



(after-load 'evil
  (setq evil-goto-definition-functions
		'(evil-goto-definition-xref
		  evil-goto-definition-imenu
		  evil-goto-definition-semantic
		  evil-goto-definition-search)))

