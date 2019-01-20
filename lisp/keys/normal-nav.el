;;; define motion
(after-load 'evil
  (evil-define-motion evil-move-5-lines-down () (evil-next-visual-line 5))
  (evil-define-motion evil-move-5-lines-up () (evil-previous-visual-line 5)))

;; normal mode navigation
(after-load 'evil
  (define-key evil-normal-state-map (kbd "C-j") (lambda () (interactive) (evil-next-line 5)))
  (define-key evil-normal-state-map (kbd "C-k") (lambda () (interactive) (evil-previous-line 5)))
  (define-key evil-visual-state-map (kbd "C-j") 'evil-move-5-lines-down)
  (define-key evil-visual-state-map (kbd "C-k") 'evil-move-5-lines-up)
  (define-key evil-normal-state-map (kbd "C-l") 'evil-end-of-line)
  (define-key evil-normal-state-map (kbd "C-h") 'evil-first-non-blank)
  (define-key evil-normal-state-map (kbd "SPC e") (lambda () (interactive) (evil-scroll-line-down 5)))
  (define-key evil-normal-state-map (kbd "SPC y") (lambda () (interactive) (evil-scroll-line-up 5)))
  (define-key evil-normal-state-map (kbd "C-e") (lambda () (interactive) (evil-scroll-line-down 5)))
  (define-key evil-normal-state-map (kbd "C-y") (lambda () (interactive) (evil-scroll-line-up 5)))
  (define-key evil-normal-state-map (kbd "C-4") 'evil-switch-to-windows-last-buffer))

;; nullified keys
(after-load 'evil
  (define-key evil-normal-state-map (kbd "q") nil)
  (define-key evil-normal-state-map (kbd "s") nil)
  (define-key evil-normal-state-map (kbd "C-f") nil)
  (define-key evil-insert-state-map (kbd "C-f") nil))
