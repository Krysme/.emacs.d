
(after-load 'evil
  (define-key evil-visual-state-map (kbd "C-j") 'evil-move-5-lines-down)
  (define-key evil-visual-state-map (kbd "C-k") 'evil-move-5-lines-up)
  (define-key evil-motion-state-map (kbd "C-j") 'evil-move-5-lines-down)
  (define-key evil-motion-state-map (kbd "C-k") 'evil-move-5-lines-up)
  (define-key evil-motion-state-map (kbd "C-e") (lambda () (interactive) (evil-scroll-line-down 5)))
  (define-key evil-visual-state-map (kbd "C-e") (lambda () (interactive) (evil-scroll-line-down 5)))
  (define-key evil-motion-state-map (kbd "C-y") (lambda () (interactive) (evil-scroll-line-up 5)))
  (define-key evil-visual-state-map (kbd "C-y") (lambda () (interactive) (evil-scroll-line-up 5)))
  (define-key evil-motion-state-map (kbd "SPC") nil)
  (define-key evil-visual-state-map (kbd "SPC g") 'google-search)
  (define-key evil-motion-state-map (kbd "SPC g") 'google-search)
  )

(after-load 'smartparens
  (add-hook 'smartparens-mode-hook (lambda) ()
			(define-key evil-visual-state-map (kbd "{") 'sp-wrap-curly)))
