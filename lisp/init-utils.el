(defun utils-wrap-region (open close)
  "wrap region with OPEN and CLOSE"
  (interactive)
  (let ((begin (region-beginning))
        (end (region-end)))
    (goto-char (+ 1 end))
    (insert close)
    (goto-char begin)
    (insert open)))

(defun utils-reverse-cdr (l)
  "reverse the list L starting from the second element"
  (let* ((first (car l))
	 (rest (cdr l))
	 (rev-rest (reverse rest)))
    (cons first rev-rest)))

(provide 'init-utils)
