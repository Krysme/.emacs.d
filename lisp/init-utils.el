(defun utils-wrap-region (open close)
  "wrap region with OPEN and CLOSE"
  (interactive)
  (let ((begin (region-beginning))
        (end (region-end)))
    (goto-char (+ 1 end))
    (insert close)
    (goto-char begin)
    (insert open)))




(provide 'init-utils)
