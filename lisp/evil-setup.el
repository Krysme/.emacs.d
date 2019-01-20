(defun indent-buffer ()
  "indent current buffer"
  (interactive)
  (save-excursion
    (indent-region (point-min) (point-max) nil)))




(setq evil-want-C-i-jump t)
(setq evil-want-C-u-scroll t)

(ensure-package 'evil)

(after-load 'evil
  (evil-mode t))

(after-load 'evil
  (setq evil-insert-state-cursor nil)
  (setq evil-normal-state-cursor nil)
  (setq evil-move-cursor-back nil))

(provide 'evil-setup)


