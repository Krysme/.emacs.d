
(defun google-search ()
  "start google search"
  (interactive)
(browse-url-xdg-open
 (concat "https://www.google.com/search?q="
		 (buffer-substring-no-properties (region-beginning) (region-end)))
 (call-process "i3-msg" nil 0 nil "workspace 10")))
