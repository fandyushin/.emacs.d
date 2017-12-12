;;

(package-initialize)

(add-to-list 'load-path (concat user-emacs-directory "lisp"))

(require 'init-core)
(require 'init-ui)
(require 'init-extensions)
(require 'init-helm)
(require 'init-golang)
(require 'init-cxx)
(require 'init-python)
(require 'init-keys)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (helm-ag yasnippet-snippets xah-fly-keys which-key use-package tangotango-theme swiper-helm rtags py-isort py-autopep8 protobuf-mode powerline pip-requirements markdown-mode magit kill-or-bury-alive hlinum helm-projectile helm-flx helm-ext go-errcheck go-add-tags git-gutter-fringe flymd f exec-path-from-shell elpy diminish dashboard company-irony-c-headers company-irony company-go company-c-headers cmake-mode cmake-ide buffer-move anzu all-the-icons ag))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
