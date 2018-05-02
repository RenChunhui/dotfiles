;;
;;                ╔════════════════════════════════════════════╗
;;                ║            ⎋ PACKAGES INSTALL ⎋            ║
;;                ╚════════════════════════════════════════════╝
;;
;; Author    : Ren Chunhui
;; Website   : https://renchunhui.github.io
;; Repo      : https://github.com/renchunhui/dotfile
;;

(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives '("popkit" . "http://elpa.popkit.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))

(package-initialize)
(require 'cl)

(defvar emacs/packages nil)
(add-to-list 'emacs/packages 'company)
(add-to-list 'emacs/packages 'company-tern)

(add-to-list 'emacs/packages 'web-mode)
(add-to-list 'emacs/packages 'js2-mode)
(add-to-list 'emacs/packages 'atom-one-dark-theme)

(defun emacs/packages-installed-p ()
  (loop for pkg in emacs/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

(unless (emacs/packages-installed-p)
  ;; check for new packages (package versions)
  (message "%s" "Emacs Prelude is now refreshing its package database...")
  (package-refresh-contents)
  (message "%s" "done.")

  ;; install the missing packages
  (dolist (pkg emacs/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

(provide 'core-packages)
