;; set fullscreen
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; set frame title to file name
(setq frame-title-format "%b")

;; turn off splash screen
(setq inhibit-startup-message t)

;; turn off initial scratch buffer message
(setq initial-scratch-message "")

;; turn off auto-save
(setq
 make-backup-files nil
 auto-save-default nil
 auto-save-list-file-name nil
 )

;; setup time
(display-time-mode 1)
(setq
 display-time-interval 1
 display-time-format "%H:%M"
)

;; turn off unnecessary UI
(menu-bar-mode 0)
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'set-scroll-bar-mode)
  (set-scroll-bar-mode nil))

;;
(let ((no-border '(internal-border-width . 0)))
  (add-to-list 'default-frame-alist no-border)
  (add-to-list 'initial-frame-alist no-border))

;; set y-or-no insead yes-or-no
(fset 'yes-or-no-p 'y-or-n-p)

;; auto creating missing parent dir when visiting new file
(defun my-create-non-existent-directory ()
      (let ((parent-directory (file-name-directory buffer-file-name)))
        (when (and (not (file-exists-p parent-directory))
                   (y-or-n-p (format "Directory `%s' does not exist! Create it?" parent-directory)))
          (make-directory parent-directory t))))
(add-to-list 'find-file-not-found-functions #'my-create-non-existent-directory)

(require 'nlinum)
;; show line numbers (use nlinum-mode; linum-mode is slow)
(global-nlinum-mode)
;; show column number in mode-line
(column-number-mode)
;; highlight line number
(setq nlinum-highlight-current-line t)

;; icons
(require 'all-the-icons)

;; Theme
(require 'doom-themes)
(load-theme 'doom-one t)
;; Corrects (and improves) org-mode's native fontification.
(doom-themes-org-config)

;; Font
(set-frame-font "Hack" nil t)
;; powerline
(require 'powerline)
(powerline-default-theme)
(setq ns-use-srgb-colorspace nil)

;; popwin
(require 'popwin)
(popwin-mode 1)
(global-set-key (kbd "C-z") popwin:keymap)
;; rtags win
;(push '("*RTags*" :noselect t) popwin:special-display-config)

;; indent
(setq-default indent-tabs-mode nil)
(setq tab-width 4)

(provide 'init-ui)
