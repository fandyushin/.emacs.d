;; init-extensions

(use-package buffer-move
  :bind
  ("C-` <up>" . buf-move-up)
  ("C-` <down>" . buf-move-down)
  ("C-` <right>" . buf-move-right)
  ("C-` <left>" . buf-move-left))

(use-package ag)

(use-package anzu
  :config
  (global-anzu-mode +1)
  (global-set-key [remap query-replace] 'anzu-query-replace)
  (global-set-key [remap query-replace-regexp] 'anzu-query-replace-regexp))

(use-package which-key
  :config
  (which-key-mode))

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
        projectile-known-projects-file (expand-file-name "projectile-bookmarks.eld" temp-dir)
        projectile-indexing-method 'git)
  (projectile-global-mode)
  :bind
  ("C-x c a" . projectile-ag))

(use-package recentf
  :config
  (setq recentf-exclude '("/elpa/" ;; ignore all files in elpa directory
                          ".*?autoloads.el$"
                          "/tmp/" ;; ignore temporary files
                          "*/.elfeed/index"
                          )
        recentf-save-file (recentf-expand-file-name "~/.emacs.d/private/cache/recentf"))
  (recentf-mode 1))

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

(use-package yasnippet
  :bind
  ("C-c y s" . yas-insert-snippet)
  ("C-c y v" . yas-visit-snippet-file)
  :config
  (use-package yasnippet-snippets)
  (yas-global-mode 1)
  (setq yas-snippet-dirs (append yas-snippet-dirs
                                 '("~/.emacs.d/snippets"))))

(use-package markdown-mode
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

(use-package flymd
  :config
  (defun my-flymd-browser-function (url)
   (let ((browse-url-browser-function 'browse-url-firefox))
     (browse-url url)))
  (setq flymd-browser-open-function 'my-flymd-browser-function)
  (setq flymd-output-directory "/tmp"))

(use-package protobuf-mode)

(use-package magit
  :commands magit-status
  :bind ("C-x g" . magit-status))

(use-package git-gutter-fringe
  :config
  (global-git-gutter-mode t)
  :diminish git-gutter-mode)

(use-package diminish
  :config
  (defmacro diminish-minor-mode (filename mode &optional abbrev)
    `(eval-after-load (symbol-name ,filename)
       '(diminish ,mode ,abbrev)))

  (defmacro diminish-major-mode (mode-hook abbrev)
    `(add-hook ,mode-hook
               (lambda () (setq mode-name ,abbrev))))

  (diminish-minor-mode 'company 'company-mode)
  (diminish-minor-mode 'projectile 'projectile-mode)
  (diminish-minor-mode 'elpy 'elpy-mode)
  (diminish-major-mode 'python-mode-hook "Py")
  (diminish-minor-mode 'yasnippet 'yas-minor-mode)
  (diminish-minor-mode 'Which-Key 'which-key-mode)
  (diminish-minor-mode 'markdown 'markdown-mode)
  (diminish-minor-mode 'protobuf 'protobuf-mode))

(provide 'init-extensions)
