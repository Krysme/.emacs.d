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


(setq private-c-cpp-project-search-text nil)

(defun set-last-cpp-project-search-text ()
    (setq private-c-cpp-project-search-text (trim-prefix  (minibuffer-contents-no-properties) ?#)))

(defun primius-cpp-project-search-impl (dir)
    (let* ((project-dir (expand-file-name
			    "src"
			    (or (locate-dominating-file dir "CMakeLists.txt")
				(user-error "cannot find CMakeLists.txt")))))
	(progn 
	    (add-hook 'minibuffer-exit-hook 'set-last-cpp-project-search-text)
	    (unwind-protect
		(consult-ripgrep project-dir (or private-c-cpp-project-search-text ""))
		(remove-hook 'minibuffer-exit-hook 'set-last-cpp-project-search-text)))))

(defun primius-cpp-project-search ()
    (interactive)
    "find CMakeLists.txt and search the corresponding `src` folder"
    (primius-cpp-project-search-impl default-directory))



(defun compile-cmake-project ()
    (interactive)
    (let* (
	      (cmake-dir (locate-dominating-file default-directory "CMakeLists.txt"))
	      (cmake-build-dir (expand-file-name "build" cmake-dir))
	      (command (format "cmake -G Ninja -H%s -B %s && cmake --build %s" cmake-dir cmake-build-dir cmake-build-dir)))
	
	(unless (file-directory-p cmake-build-dir)
	    (make-directory cmake-build-dir))
	(setenv "CMAKE_EXPORT_COMPILER_COMMANDS" "1")
	(compile command))) 

(add-hook 'compilation-filter-hook 'ansi-color-compilation-filter)

(setq c-default-style "linux" c-basic-offset 4)




(after-load 'evil
    (evil-define-key 'normal c++-mode-map (kbd "SPC ,r") 'primius-cpp-project-search)
    (after-load 'smartparens 
	(evil-define-key 'visual c++-mode-map (kbd "(") 'sp-wrap-round)
	(evil-define-key 'visual c++-mode-map (kbd ")") 'sp-wrap-square)
	(evil-define-key 'visual c++-mode-map (kbd "{") 'sp-wrap-curly)))

(region-beginning)
(define-key c++-mode-map (kbd "C-c C-b") 'compile-cmake-project)
(provide 'init-c-cpp)
