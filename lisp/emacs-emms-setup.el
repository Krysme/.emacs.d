(ensure-package 'emms)
(require 'emms-setup)
(emms-all)
(emms-default-players)


(after-load 'emms
  (define-key emms-playlist-mode-map (kbd "SPC") 'emms-pause)
  (define-key emms-playlist-mode-map (kbd "P") 'emms-pause))

(provide 'emacs-emms-setup)
