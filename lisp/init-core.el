(require 'package)
(add-to-list
   'package-archives
   '("melpa" . "http://melpa.milkbox.net/packages/")
   t)

(add-to-list
   'package-archives
   '("marmalade" . "http://marmalade-repo.org/packages/")
   t)

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(defconst private-dir  (expand-file-name "private" user-emacs-directory))
(defconst temp-dir
  (format "%s/cache" private-dir)
  "Hostname-based elisp temp directories")

(blink-cursor-mode -1)
(set-cursor-color "#d54e53")

;; Core settings
;; UTF-8 please
(set-charset-priority 'unicode)
(setq locale-coding-system   'utf-8)   ; pretty
(set-terminal-coding-system  'utf-8)   ; pretty
(set-keyboard-coding-system  'utf-8)   ; pretty
(set-selection-coding-system 'utf-8)   ; please
(prefer-coding-system        'utf-8)   ; with sugar on top
(setq default-process-coding-system '(utf-8-unix . utf-8-unix))

(fset 'yes-or-no-p 'y-or-n-p)
(global-auto-revert-mode t)

(setq-default ring-bell-function 'ignore
              indent-tabs-mode nil)
(setq
 use-package-always-ensure    t
 history-length                     1000
 auto-save-default                  nil
 auto-save-list-file-name           (concat temp-dir "/autosave")
 make-backup-files                  nil)

;; Disable toolbar & menubar
(menu-bar-mode -1)
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

;; Delete trailing whitespace before save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(provide 'init-core)
