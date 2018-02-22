;; init-extensions

(use-package move-text
  :config
  (move-text-default-bindings))

 (use-package ag)

(use-package anzu
  :config
  (global-anzu-mode +1)
  (global-set-key [remap query-replace] 'anzu-query-replace)
  (global-set-key [remap query-replace-regexp] 'anzu-query-replace-regexp))

(use-package company
  :bind
  ("M-TAB" . company-complete)
  ("M-;" . company-yasnippet)
  :config
  (add-hook 'after-init-hook 'global-company-mode))

(use-package recentf
  :config
  (setq recentf-exclude '("/elpa/" ;; ignore all files in elpa directory
                          ".*?autoloads.el$"
                          "/tmp/" ;; ignore temporary files
                          "*/.elfeed/index"
                          )
        recentf-save-file (recentf-expand-file-name "~/.emacs.d/private/cache/recentf"))
  (recentf-mode 1))

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

(provide 'init-extensions)
