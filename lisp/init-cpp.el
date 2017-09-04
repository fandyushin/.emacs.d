(require 'autopair)
(add-hook 'c++-mode-hook 'autopair-mode)
(add-hook 'c-mode-hook 'autopair-mode)
(add-hook 'objc-mode-hook 'autopair-mode)

;; highlight brackets
(setq show-paren-style 'parenthesis)
(add-hook 'c++-mode-hook 'show-paren-mode)
(add-hook 'c-mode-hook 'show-paren-mode)
(add-hook 'objc-mode-hook 'show-paren-mode)

(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

(require 'rtags)
(require 'company-rtags)

(setq rtags-completions-enabled t)
(eval-after-load 'company
  '(add-to-list
    'company-backends 'company-rtags))
(setq rtags-autostart-diagnostics t)
(rtags-enable-standard-keybindings)

(require 'irony)
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

(defun my-irony-mode-hook ()
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async))

(add-hook 'irony-mode-hook 'my-irony-mode-hook)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

(add-hook 'irony-mode-hook 'company-irony-setup-begin-commands)
(setq company-backends (delete 'company-semantic company-backends))

(require 'company-irony)
(require 'company-irony-c-headers)
(eval-after-load 'company
  '(add-to-list
    'company-backends '(company-irony-c-headers company-irony)))

;; indent, not company on new line
;(defun indent-or-complete ()
;    (interactive)
;    (if (looking-at "\\_>")
;        (company-complete-common)
;      (indent-according-to-mode)))

(setq tab-always-indent 'complete)

;; intend
(setq-default c-basic-offset 4)

(require 'cc-mode)
(setq company-idle-delay 0)
(define-key c-mode-map [(tab)] 'company-complete)
(define-key c++-mode-map [(tab)] 'company-complete)

(provide 'init-cpp)
