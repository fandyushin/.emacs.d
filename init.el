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
