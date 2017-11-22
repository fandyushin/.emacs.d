;; init-extensions

(use-package exec-path-from-shell
  :config
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))

(use-package company
  :bind
  ("M-TAB" . company-complete)
  ("M-;" . company-yasnippet)
  :config
  (add-hook 'after-init-hook 'global-company-mode))

(use-package projectile
  :config
  (setq projectile-enable-caching t
        projectile-cache-file (expand-file-name "projectile.cache" temp-dir)
        projectile-known-projects-file (expand-file-name "projectile-bookmarks.eld" temp-dir))
  (projectile-global-mode)
  :bind
  ("C-x c a" . projectile-ag))

(use-package kill-or-bury-alive
  :bind
  ("C-x k" . kill-or-bury-alive)
  ("C-c C-k" . kill-buffer))

(use-package hlinum
  :config
  (hlinum-activate))

(use-package linum
  :config
  (setq linum-format " %3d ")
  (global-linum-mode nil))

(use-package dashboard
  :config
  (setq dashboard-items '((recents  . 5)
			  (projects . 5)))
  (dashboard-setup-startup-hook))

(use-package diminish
  :config
  (defmacro diminish-minor-mode (filename mode &optional abbrev)
    `(eval-after-load (symbol-name ,filename)
       '(diminish ,mode ,abbrev)))

  (defmacro diminish-major-mode (mode-hook abbrev)
    `(add-hook ,mode-hook
               (lambda () (setq mode-name ,abbrev))))

  (diminish-minor-mode 'company 'company-mode)
  (diminish-minor-mode 'projectile 'projectile-mode))

(provide 'init-extensions)

