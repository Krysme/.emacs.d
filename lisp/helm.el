;; -*- lexical-binding: t -*-

(ensure-package 'helm)
(ensure-package 'helm-ag)
(ensure-package 'swiper-helm)

(after-load 'helm
  (helm-mode))

(after-load 'helm
    (setq helm-mode-fuzzy-match t)
    (setq helm-completion-in-region-fuzzy-match t)
    (setq helm-M-x-fuzzy-match t))

(after-load 'helm-ag
  (custom-set-variables
   '(helm-ag-base-command "rg --no-heading")))






