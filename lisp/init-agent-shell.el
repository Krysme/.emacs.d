;; -*- lexical-binding: t -*-

(use-package agent-shell
  :straight t
  :commands (agent-shell agent-shell-opencode-start-agent)
  :init
  (setq agent-shell-preferred-agent-config 'opencode))

(provide 'init-agent-shell)
