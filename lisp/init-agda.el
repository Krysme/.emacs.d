

(defun my/agda-locate-from-command (cmd)
        "Run CMD and return a readable file path, or nil."
        (let* ((coding-system-for-read 'utf-8)
               (output (shell-command-to-string cmd))
               (file   (string-trim output)))
          (when (and (not (string-empty-p file))
                     (file-readable-p file))
                file)))

(defun my/agda-locate-emacs-mode ()
        "Try to locate Agda's Emacs mode file in a version-agnostic way."
        (or (my/agda-locate-from-command "agda --emacs-mode locate")
            (my/agda-locate-from-command "agda-mode locate")))



(when-let* ((agda-emacs-file (my/agda-locate-emacs-mode)))
        (load-file agda-emacs-file))


(provide 'init-agda)
