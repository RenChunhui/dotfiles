;;
;;                ╔════════════════════════════════════════════╗
;;                ║       ⎋ PERSONAL EMACS CONFIG FILE ⎋       ║
;;                ╚════════════════════════════════════════════╝
;;
;; Author    : Ren Chunhui
;; Website   : https://renchunhui.github.io
;; Repo      : https://github.com/renchunhui/dotfile
;;

(package-initialize)

(add-to-list 'load-path (expand-file-name "core" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "editor" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "lang" user-emacs-directory))

;; core
(require 'core-init)
(require 'core-packages)
(require 'core-keymap)

(emacs/init)

;; editor
(require 'file-tree)

;; lang
(require 'init-auto-complete)
(require 'init-html)
(require 'init-js)

(provide 'init)
