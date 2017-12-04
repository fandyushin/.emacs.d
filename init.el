;;

(package-initialize)

(add-to-list 'load-path (concat user-emacs-directory "lisp"))

(require 'init-core)
(require 'init-ui)
(require 'init-extensions)
(require 'init-golang)
(require 'init-cxx)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (company-c-headers company-irony-c-headers company-irony irony yasnippet xah-fly-keys which-key use-package projectile markdown-mode kill-or-bury-alive hlinum go-errcheck go-add-tags flymd exec-path-from-shell dashboard company-go))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
