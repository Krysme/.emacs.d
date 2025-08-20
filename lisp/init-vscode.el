;; -*- lexical-binding: t -*-

(straight-use-package 'f)
(require 'f)

(defun find-vscode-task-file (path)
       "Search upward from PATH for a '.vscode/tasks.json' file.

If found, return the absolute path to the file.
If not found, return nil.

PATH can be any file or directory path; the search will start
from that location and traverse upward toward the filesystem root."
       (let* ((task-file ".vscode/tasks.json")
              (project-root (f-traverse-upwards
                             (lambda (p) (f-file-p (f-expand task-file p)))
                             path)))
             (when project-root
                   (f-expand task-file project-root))))


(defun parse-task-json (path)
       "Parse the VS Code tasks.json file at PATH into a Lisp object.

Returns an alist representation of the JSON, with arrays as lists,
JSON null as nil, and JSON false as the symbol :false."
       (json-parse-string (f-read path)
                          :object-type 'alist
                          :array-type 'list
                          :null-object nil
                          :false-object :false))

(defun load-vscode-tasks-from-dir (dir)
       "Search upward from DIR for a VS Code tasks.json file and parse it.

Returns the parsed tasks.json as an alist, or nil if no file was found."
       (--> (find-vscode-task-file dir)
            (when it
                  (parse-task-json it))))



(provide 'init-vscode)
