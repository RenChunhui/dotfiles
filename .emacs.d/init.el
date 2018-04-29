(package-initialize)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; core
(require 'init-emacs)
(require 'init-packages)
(require 'init-auto-completion)
(require 'init-editor)
(require 'init-keymap)

;; dev
(require 'dev-html)
(require 'dev-css)
(require 'dev-scss)
(require 'dev-es)
(require 'dev-ts)
(require 'dev-shell)
(require 'dev-yaml)

(emacs/init)

(provide 'init)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (company-tern neotree web-mode js2-mode atom-one-dark-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
