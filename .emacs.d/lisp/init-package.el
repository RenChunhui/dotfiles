;; 插件包
;; ----------------------------------------------

(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives '("popkit" . "http://elpa.popkit.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))

(package-initialize)
(require 'cl)

;; 在开始时安装包
(defvar init-package '(
		       company

		       atom-one-dark-theme
		       monokai-theme
		       )
  "List of packages needs to be installed at launch")

(defun init-package-installed-p ()
  (loop for pkg in init-package
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

(unless (init-package-installed-p)
  ;; check for new packages (package versions)
  (message "%s" "Emacs Prelude is now refreshing its package database...")
  (package-refresh-contents)
  (message "%s" "done.")

  ;; install the missing packages
  (dolist (pkg init-package)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

(provide 'init-package)
