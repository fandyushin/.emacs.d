;; copied from github.com/purcell/emacs.d
(defun install-package (package &optional min-version no-refresh)
  "Install given PACKAGE, optionally requiring MIN-VERSION.
If NO-REFRESH is non-nil, the available package lists will not be
re-downloaded in order to locate PACKAGE."
  (message "%s" package)
  (if (package-installed-p package min-version)
      t
    (if (or (assoc package package-archive-contents) no-refresh)
        (package-install package)
      (progn
        (package-refresh-contents)
        (install-package package min-version t)))))

(defvar my-packages
  '(
    doom-themes
    nlinum
    autopair
    powerline
    all-the-icons
    popwin
    
    rtags
    company
    irony
    company-rtags
    company-irony
    company-irony-c-headers
    )
  "My packages!")

;; loop over package list and install them
(defun install-my-packages ()
  (interactive)
  (mapc 'install-package my-packages))

(install-my-packages)

(provide 'init-packages)
