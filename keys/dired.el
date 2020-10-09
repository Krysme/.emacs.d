
;; disable space
(after-load 'dired
  (define-key dired-mode-map (kbd "SPC") nil))

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
