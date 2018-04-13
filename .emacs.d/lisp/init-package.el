(when (>= emacs-major-version 24)
    (require 'package)
    (package-initialize)
    (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                    ("melpa" . "http://elpa.emacs-china.org/melpa/"))))

(require 'cl)

;; 添加包
(defvar mars/packages '(
  ;; 自动补全
  company
  all-the-icons
  ;; web 开发
  js2-mode
  web-mode
  ;; 主题样式
  atom-one-dark-theme
  monokai-theme
) "Default Packages")

(setq package-selected-packages mars/packages)

(defun mars/packages-installed-p ()
     (loop for pkg in mars/packages
           when (not (package-installed-p pkg)) do (return nil)
           finally (return t)))

(unless (mars/packages-installed-p)
     (message "%s" "Refreshing package database...")
     (package-refresh-contents)
     (dolist (pkg mars/packages)
       (when (not (package-installed-p pkg))
         (package-install pkg))))

(provide 'init-package)
