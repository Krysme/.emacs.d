(straight-use-package 'cmake-mode)
(require 'cc-mode)

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(setq-default cmake-tab-width 8)
(add-hook 'c-mode-hook 'lsp-deferred)
(add-hook 'c++-mode-hook 'lsp-deferred)

(setq init-c-cpp-modes '(c-mode c++-mode cc-mode))

(after-load 'smartparens (dolist (m init-c-cpp-modes)
			   (sp-local-pair m "'" "'")))

(setq c-default-style "linux" c-basic-offset 4)

(add-hook 'c-mode-hook 'smartparens-mode)
(add-hook 'c++-mode-hook 'smartparens-mode)

(after-load 'yasnippet-snippets (add-hook 'c++-mode-hook 'yas-minor-mode-on)
	    (add-hook 'c-mode-hook 'yas-minor-mode-on))


(defun trim-prefix (str ch)
  "in a string STR, if there is a prefix that maches CH, trim it"
  (if (and (stringp str) (> (length str) 0) (char-equal (aref str 0) ch))
    (substring str 1)
    str))



(defun locate-last-dominating-file (directory file-name)
  "find the topmost directory where the file: 
FILE-NAME exists starting at DIRECTORY"
  (let* ((dir directory)
         result)
    (while (not (string= dir (directory-file-name dir)))
      (let* ((file-path (expand-file-name file-name dir)))
        (when (file-exists-p file-path)
          (setq result dir))
        (setq dir (file-name-directory (directory-file-name dir)))))
    result))

(setq private-c-cpp-project-search-text nil)

(defun set-last-cpp-project-search-text (&rest args)
  (unless private-c-cpp-project-search-text
    (setq private-c-cpp-project-search-text (trim-prefix  (minibuffer-contents-no-properties) ?#))))

(defun cpp-project-search-impl (dir)
  (let* ((project-dir (or (locate-dominating-file dir "CMakeLists.txt")
			  (user-error "cannot find CMakeLists.txt"))))
    (progn 
      (add-hook 'minibuffer-exit-hook 'set-last-cpp-project-search-text)
      (advice-add 'vertico-exit :before 'set-last-cpp-project-search-text)
      (advice-add 'vertico-super-tab :before 'set-last-cpp-project-search-text)
      (let* ((initial-text private-c-cpp-project-search-text))
	(setq private-c-cpp-project-search-text nil)
	(unwind-protect
	    (consult-ripgrep project-dir (or initial-text ""))
	  (progn
	    (remove-hook 'minibuffer-exit-hook 'set-last-cpp-project-search-text)
	    (advice-remove 'vertico-exit 'set-last-cpp-project-search-text)
	    (advice-remove 'vertico-super-tab 'set-last-cpp-project-search-text)))))))

(defun cpp-project-search ()
  "find CMakeLists.txt and search the corresponding `src` folder"
  (interactive)
  (cpp-project-search-impl default-directory))


(defun compile-cmake-project ()
    (interactive)
    (let* (
	      (cmake-dir (locate-last-dominating-file default-directory "CMakeLists.txt"))
	      (cmake-build-dir (expand-file-name "build" cmake-dir))
	      (command (format
                        "cmake -S %s -B %s && cmake --build %s && bash -c 'find %s -name \"*_test.exe\" -exec {} \\;' "
                        cmake-dir
                        cmake-build-dir
                        cmake-build-dir
                        cmake-build-dir)))
	(setenv "CMAKE_EXPORT_COMPILE_COMMANDS" "1")
	(compile command))) 

(add-hook 'compilation-filter-hook 'ansi-color-compilation-filter)

(setq c-default-style "linux" c-basic-offset 4)



(defun re-compile-cmake-project ()
  (interactive)
  (clean-cmake-project)
  (compile-cmake-project))

(defun clean-cmake-project ()
  (interactive)
  (let*  ((cmake-dir (locate-last-dominating-file default-directory "CMakeLists.txt"))
	  (cmake-build-dir (expand-file-name "build" cmake-dir)))
    (delete-directory cmake-build-dir t)))


(defun qt-open-designer ()
    "open qt designer for current UI class"
    (interactive)
    (let* ((ui-file (replace-regexp-in-string "\\.[^.]*$" ".ui" (buffer-file-name))))
      (when (file-exists-p ui-file)
	(shell-command (format  "designer-qt6 %s" ui-file)))))

(setq cpp-project-actions
      '(("designer" . qt-open-designer)
        ("build" . compile-cmake-project)
        ("re-build" . re-compile-cmake-project)
        ("clean" . clean-cmake-project)))

(defun cmake-project-action-menu ()
  (interactive)
  (let* ((action-name (completing-read "Action:" cpp-project-actions))
         (action (cdr (assoc action-name cpp-project-actions))))
    (funcall action)))



(after-load 'evil
  (evil-define-key 'normal c++-mode-map (kbd "SPC ,r") 'cpp-project-search)
  (after-load 'smartparens 
    (evil-define-key 'visual c++-mode-map (kbd "(") 'sp-wrap-round)
    (evil-define-key 'visual c++-mode-map (kbd ")") 'sp-wrap-square)
    (evil-define-key 'visual c++-mode-map (kbd "{") 'sp-wrap-curly)))

(define-key c++-mode-map (kbd "C-c C-b") 'compile-cmake-project)

(after-load 'cmake-mode 
  (define-key cmake-mode-map (kbd "C-c C-b") 'compile-cmake-project)
  (define-key cmake-mode-map (kbd "C-c b") 'cmake-project-action-menu))

(define-key c-mode-map (kbd "C-c C-b") 'compile-cmake-project)

(define-key c++-mode-map (kbd "C-c b") 'cmake-project-action-menu)
(define-key c-mode-map (kbd "C-c b") 'cmake-project-action-menu)

(define-key c-mode-map (kbd "C-3") 'lsp-clangd-find-other-file)
(define-key c++-mode-map (kbd "C-3") 'lsp-clangd-find-other-file)



(require 'dash)

(defun obtain-cpu-count-on-windows-nt ()
  "obtain the core count on windows"
  (condition-case err
      (--> 
       (process-lines "wmic" "cpu" "get" "NumberOfLogicalProcessors" "/format:List")
       (-filter (lambda (s) (not (string-blank-p s))) it)
       (-map 'string-trim it)
       (car it)
       (string-split it "=")
       (nth 1 it)
       (string-to-number it))
    (error 8)))

(defun obtain-cpu-count-on-linux ()
  "obtain the core count on linux"
  (condition-case err
      (-->
       (process-lines "nproc")
       (-filter (lambda (s) (not (string-blank-p s))) it)
       (-map 'string-trim it)
       (car it)
       (string-to-number it))
    (error 8)))

(setq core-count (cond
                  ((string= system-type "gnu/linux") (obtain-cpu-count-on-linux))
                  ((string= system-type "windows-nt") (obtain-cpu-count-on-windows-nt))))

(add-hook 'lsp-mode-hook
          (lambda ()
            (setq lsp-clients-clangd-args
                  (list "--clang-tidy"
                        "--clang-tidy-checks=performance-*,bugprone-*"
                        "--all-scopes-completion"
                        "--header-insertion=iwyu"
                        (format "-j=%d" core-count)))))



(provide 'init-c-cpp)
