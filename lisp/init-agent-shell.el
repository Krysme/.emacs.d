;; -*- lexical-binding: t -*-

(use-package agent-shell
  :straight t
  :commands (agent-shell my/agent-shell agent-shell-opencode-start-agent)
  :bind (:map agent-shell-mode-map
              ("C-c RET" . agent-shell-submit))
  :init
  (setq agent-shell-preferred-agent-config 'opencode)
  :config
  (defvar my/agent-shell-cwd nil
    "Directory selected by `my/agent-shell', while its shell starts.")
  (defun my/agent-shell--cwd ()
    "CWD for the current agent shell.
While a shell selected via `my/agent-shell' is starting, use
`my/agent-shell-cwd'.  Afterwards use the shell buffer's
`default-directory', which the shell froze at start time, so the
selected directory sticks for the whole session instead of being
re-derived as the project root."
    (or my/agent-shell-cwd
        (and (derived-mode-p 'agent-shell-mode) default-directory)))
  (setq agent-shell-cwd-function #'my/agent-shell--cwd)
  (defun my/agent-shell ()
    "Select a directory, then start an agent shell there."
    (interactive)
    (if (derived-mode-p 'agent-shell-mode)
        (agent-shell)
      (let ((my/agent-shell-cwd
             (file-name-as-directory
              (expand-file-name
               (read-directory-name "Agent shell directory: "
                                    (agent-shell-cwd) nil t)))))
        (agent-shell))))
  (defun my/agent-shell--restart-cwd (orig-fun &rest args)
    "Keep the shell's working directory across a restart.
Runs ORIG-FUN with `my/agent-shell-cwd' bound to the directory of the
shell being restarted, so `agent-shell-restart' does not fall back to
the project root."
    (let* ((buf (agent-shell--current-shell))
           (my/agent-shell-cwd (and buf
                                    (buffer-local-value 'default-directory buf))))
      (apply orig-fun args)))
  (advice-add 'agent-shell-restart :around #'my/agent-shell--restart-cwd))

(provide 'init-agent-shell)
