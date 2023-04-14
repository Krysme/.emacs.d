(straight-use-package 'f)

(defun safe-read-text (path)
    (condition-case err
	(f-read-text path)
	(error "")))


(defun read-proxy-list ()
    (thread-first "proxy-addr"
	(expand-file-name user-emacs-directory)
	safe-read-text
	split-string))


(let* ((addr (if (not (string-equal "windows-nt" system-type))
		 "127.0.0.1"
		 (let* ((old-proxy-list (read-proxy-list))
			   (addr-from-prompt (completing-read "Proxy Address:" old-proxy-list)))
		     (if (string-empty-p addr-from-prompt) "127.0.0.1" addr-from-prompt))))
	  (url (concat "http://" addr ":8123")))
    (setenv "https_proxy" url)
    (setenv "http_proxy" url))

(provide 'init-env-settings)
