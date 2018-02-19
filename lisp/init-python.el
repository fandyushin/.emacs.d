(use-package f)

(use-package python
  :mode ("\\.py" . python-mode)
  :config
  (setq python-indent-offset 4))

(use-package pip-requirements
  :config
  (add-hook 'pip-requirements-mode-hook #'pip-requirements-auto-complete-setup))

(use-package py-autopep8)

(use-package py-isort
  :config
  (add-hook 'before-save-hook 'py-isort-before-save))

(provide 'init-python)
