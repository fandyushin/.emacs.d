;; ag
(global-set-key (kbd "C-x c g") (lambda () (interactive) (call-interactively 'ag)))

(global-set-key (kbd "C-d") 'delete-region)

(provide 'init-keys)
