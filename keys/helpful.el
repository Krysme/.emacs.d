
(after-load 'helpful
  (global-set-key (kbd "<f1> f") #'helpful-callable)
  (global-set-key (kbd "<f1> v") #'helpful-variable)
  (global-set-key (kbd "<f1> k") #'helpful-key))
