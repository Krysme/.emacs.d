;;; define motion
(after-load 'evil
  (evil-define-motion evil-move-5-lines-down () (evil-next-visual-line 5))
  (evil-define-motion evil-move-5-lines-up () (evil-previous-visual-line 5)))

(after-load 'evil
  (after-load 'smartparens
    (define-key evil-visual-state-map (kbd "(") 'sp-wrap-round)))



;; normal mode navigation

(after-load 'evil
  (after-load 'swiper-helm
	(define-key evil-normal-state-map (kbd "C-j") (lambda () (interactive) (evil-next-line 5)))
	(define-key evil-normal-state-map (kbd "C-k") (lambda () (interactive) (evil-previous-line 5)))
	(define-key evil-normal-state-map (kbd "C-l") 'evil-end-of-line)
	(define-key evil-normal-state-map (kbd "C-h") 'evil-first-non-blank)
	(define-key evil-normal-state-map (kbd "C-e") (lambda () (interactive) (evil-scroll-line-down 5)))
	(define-key evil-normal-state-map (kbd "SPC /") 'swiper-helm)
	(define-key evil-normal-state-map (kbd "C-y") (lambda () (interactive) (evil-scroll-line-up 5)))))


;; nullified keys
(after-load 'evil
  (define-key evil-normal-state-map (kbd "q") nil)
  (define-key evil-normal-state-map (kbd "s") nil)
  (define-key evil-normal-state-map (kbd "C-f") nil)
  (define-key evil-normal-state-map (kbd "C-4") nil))

;; space keys
(after-load 'evil
  (define-key evil-normal-state-map (kbd "C-s") 'save-buffer)
  (define-key evil-normal-state-map (kbd "SPC w o") 'delete-other-windows)
  (define-key evil-normal-state-map (kbd "SPC w q") 'kill-emacs)
  (define-key evil-normal-state-map (kbd "SPC k") 'kill-this-buffer)
  (define-key evil-normal-state-map (kbd "SPC l") 'indent-buffer)
  (define-key evil-normal-state-map (kbd "SPC h") 'help-command)

  (define-key evil-normal-state-map (kbd "SPC c") 'helm-M-x)
  (define-key evil-normal-state-map (kbd "SPC f") 'helm-find-files)
  (define-key evil-normal-state-map (kbd "SPC r") 'helm-recentf)
  (define-key evil-normal-state-map (kbd "SPC b") 'helm-buffers-list)



  (define-key evil-normal-state-map (kbd "C-n") 'evil-next-line)
  (define-key evil-normal-state-map (kbd "C-p") 'evil-previous-line)


  ;; multi window operations
  (define-key evil-normal-state-map (kbd "SPC w v") 'evil-window-vsplit)
  (define-key evil-normal-state-map (kbd "SPC w s") 'evil-window-split)
  (define-key evil-normal-state-map (kbd "SPC w j") 'evil-window-down)
  (define-key evil-normal-state-map (kbd "SPC w k") 'evil-window-up)
  (define-key evil-normal-state-map (kbd "SPC w h") 'evil-window-left)
  (define-key evil-normal-state-map (kbd "SPC w l") 'evil-window-right))
