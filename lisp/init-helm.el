(use-package helm
  :config
  (require 'helm-config)
  (require 'helm)
  ;; Activate Helm.
  (helm-mode 1)
  ;; Tell Helm to resize the selector as needed.
  (helm-autoresize-mode 1)
  (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to do persistent action
  (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
  (define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z
  ;; Make Helm look nice.
  (setq-default helm-display-header-line nil
                helm-autoresize-min-height 10
                helm-autoresize-max-height 35
                helm-split-window-in-side-p t

                helm-M-x-fuzzy-match t
                helm-buffers-fuzzy-matching t
                helm-recentf-fuzzy-match t
                helm-apropos-fuzzy-match t)
  (set-face-attribute 'helm-source-header nil :height 0.75)
  ;; Replace common selectors with Helm versions.
  :bind (("M-x" . helm-M-x)
         ("C-x C-f" . helm-find-files)
         ("C-x C-g" . helm-do-grep)
         ("C-x b" . helm-buffers-list)
         ("C-x c g" . helm-google-suggest)
         ("C-t" . helm-imenu)
         ("M-y" . helm-show-kill-ring)))

;; Enrich isearch with Helm using the `C-S-s' binding.
;; swiper-helm behaves subtly different from isearch, so let's not
;; override the default binding.
(use-package swiper-helm
  :bind (("C-S-s" . swiper-helm)))

;; Enable fuzzy matching in Helm navigation.
(use-package helm-flx
  :config
  (with-eval-after-load "helm"
    (require 'helm-flx)
    (helm-flx-mode 1)))

;; Set up a couple of tweaks from helm-ext.
(use-package helm-ext
  :config
  (helm-ext-ff-enable-skipping-dots t)
  (helm-ext-ff-enable-auto-path-expansion t))


(provide 'init-helm)
