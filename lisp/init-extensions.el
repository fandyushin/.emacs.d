;; init-extensions

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
        projectile-known-projects-file (expand-file-name "projectile-bookmarks.eld" temp-dir))
  (projectile-global-mode)
  :bind
  ("C-x c a" . projectile-ag))


(use-package xah-fly-keys
  :config
  (xah-fly-keys-set-layout "qwerty")
  (xah-fly-keys 1))

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
  (diminish-minor-mode 'yasnippet 'yas-minor-mode)
  (diminish-minor-mode 'Which-Key 'which-key-mode)
  (diminish-minor-mode 'markdown 'markdown-mode))

(provide 'init-extensions)

