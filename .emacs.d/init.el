(package-initialize)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; Package Management
;; -----------------------------------------------------------------
(require 'init-package)
(require 'init-themes)
(require 'init-ui)

(require 'init-html)
(require 'init-css)
(require 'init-javascript)

(provide 'init)
