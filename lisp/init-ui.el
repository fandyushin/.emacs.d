(set-face-attribute 'default nil :family "Iosevka" :height 147 :weight 'light :width 'normal :slant 'normal)

(use-package moe-theme
  :config
  (moe-dark)
  (moe-theme-set-color 'green)
  (powerline-moe-theme))

(use-package dashboard
  :config
  (setq dashboard-items '((recents  . 5)
			  (projects . 5)))
  (dashboard-setup-startup-hook))

(use-package hlinum
  :config
  (hlinum-activate))

(use-package linum
  :config
  (setq linum-format " %3d ")
  (global-linum-mode nil))

(use-package neotree
  :config
  (setq neo-theme 'ascii)
  (setq neo-click-changes-root t)
  :bind
  ("<f8>" . neotree-toggle))

(use-package smooth-scroll
  :if (display-graphic-p)
  :delight
  :custom (smooth-scroll/vscroll-step-size 8)
  :config (smooth-scroll-mode))

(use-package spaceline-config
  :ensure spaceline
  :config
  (set-face-attribute 'mode-line nil :underline nil :box nil :overline nil)
  (set-face-attribute 'mode-line-inactive nil :underline nil :box nil :overline nil)
  (setq-default powerline-default-separator 'nil
                powerline-height 30
                spaceline-highlight-face-func 'spaceline-highlight-face-modified)
  (spaceline-toggle-buffer-encoding-abbrev-off)
  (spaceline-toggle-buffer-position-off)
  (spaceline-toggle-buffer-size-off)
  (spaceline-toggle-hud-off)
  (spaceline-toggle-line-column-on)
  (spaceline-toggle-major-mode-off)
  (spaceline-toggle-minor-modes-off)
  (spaceline-toggle-version-control-off)
  (spaceline-emacs-theme))

(provide 'init-ui)
