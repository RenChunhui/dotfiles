
;; 插件包
;; ----------------------------------------------

(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives '("popkit" . "http://elpa.popkit.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))

(package-initialize)
(require 'cl)

(defvar init-package nil)
(add-to-list 'init-package 'dashboard)
(add-to-list 'init-package 'company)
(add-to-list 'init-package 'neotree)
(add-to-list 'init-package 'js2-mode)
(add-to-list 'init-package 'nodejs-repl)
(add-to-list 'init-package 'web-mode)
(add-to-list 'init-package 'atom-one-dark-theme)
(add-to-list 'init-package 'monokai-theme)

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
