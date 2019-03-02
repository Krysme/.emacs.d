
;; insert mode navigation
(after-load 'evil
  (define-key evil-insert-state-map (kbd "C-l") 'forward-char)
  (define-key evil-insert-state-map (kbd "C-j") 'next-line)
  (define-key evil-insert-state-map (kbd "C-k") 'previous-line)
  (define-key evil-insert-state-map (kbd "C-h") 'backward-char)
  (define-key evil-insert-state-map (kbd "C-e") (lambda () (interactive) (evil-scroll-line-down 5)))
  (define-key evil-insert-state-map (kbd "C-y") (lambda () (interactive) (evil-scroll-line-up 5))))
