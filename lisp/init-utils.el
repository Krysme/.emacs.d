;; -*- lexical-binding: t -*-
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



(defun find-file-in-project ()
  (interactive)
  (-->
     (locate-dominating-file default-directory ".git")
       (or it (user-error "Not in a project"))
       (expand-file-name it)
       (shell-command-to-string  (concat  "fd . --type f " "\"" it "\""))
       (split-string it "[\r\n]+")
       (seq-filter (lambda (x) (-> x string-blank-p not)) it)
       (consult--read
	it
	:prompt "Find File in Project: "
	:sort nil
	:require-match t
	:category 'file
	:state nil
	:history 'file-name-history)
       (find-file it)))

(provide 'init-utils)
