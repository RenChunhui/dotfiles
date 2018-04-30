;;
;;                ╔════════════════════════════╗
;;                ║       ⎋ ECMAScript ⎋       ║
;;                ╚════════════════════════════╝
;;
;; Author    : Ren Chunhui
;; Website   : https://renchunhui.github.io
;; Repo      : https://github.com/renchunhui/dotfile
;;

;; js2-mode
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; tern
(add-to-list 'load-path "~/.config/yarn/global/node_modules/tern/emacs/")
(autoload 'tern-mode "tern.el" nil t)
(add-to-list 'company-backends 'company-tern)
(add-hook 'js2-mode-hook (lambda ()
			   (tern-mode)
			   (company-mode)))

(provide 'init-js)
