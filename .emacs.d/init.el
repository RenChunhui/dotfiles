(package-initialize)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; Package Management
;; -----------------------------------------------------------------
(require 'init-default)
(require 'init-package)
(require 'init-themes)
(require 'init-ui)
(require 'init-keymap)
(require 'init-complete)
(require 'init-editor)

(require 'init-html)
(require 'init-css)
(require 'init-javascript)

(provide  'init)
