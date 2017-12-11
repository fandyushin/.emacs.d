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
    (py-isort py-autopep8 pip-requirements elpy f company-cmake company-c-headers company-irony-c-headers company-irony irony cmake-ide cmake-mode company-go go-add-tags go-errcheck go-mode helm-ext helm-flx helm-projectile swiper-helm helm diminish git-gutter-fringe magit protobuf-mode flymd markdown-mode yasnippet dashboard hlinum kill-or-bury-alive xah-fly-keys projectile company exec-path-from-shell which-key anzu ag buffer-move powerline tangotango-theme use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
