
(ensure-package 'which-key)

(after-load 'evil 
  (after-load 'which-key
	(which-key-mode)
	(setq which-key-idle-delay 0.3)))

