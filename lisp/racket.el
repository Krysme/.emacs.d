;; -*- lexical-binding: t -*-

(ensure-package 'racket-mode)

(after-load 'racket-mode
(add-hook 'racket-mode-hook
	  (lambda ()
	    (define-key racket-mode-map (kbd "C-c C-l") 'racket-run))))

(add-hook 'racket-mode-hook #'racket-unicode-input-method-enable)

(add-hook 'racket-repl-mode-hook
	  (lambda ()
	    (define-key racket-repl-mode-map (kbd "C-l")
	      (lambda ()
		(interactive)
		(if (= (point) (line-end-position))
		    (comint-clear-buffer)
		  (forward-char))))
	    (define-key racket-repl-mode-map (kbd "C-p") 'comint-previous-input)
	    (define-key racket-repl-mode-map (kbd "C-n") 'comint-next-input)
	    (define-key racket-repl-mode-map (kbd "C-w") nil)))


(after-load 'racket-mode
  (add-hook 'racket-mode-hook 'paredit-mode)
  (add-hook 'racket-repl-mode-hook 'paredit-mode))
