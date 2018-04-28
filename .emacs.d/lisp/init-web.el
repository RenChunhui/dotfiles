;; web 前端开发

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'company-backends 'company-tern)
;; 空格设置
(defun my-web-mode-indent-setup ()
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  )
(add-hook 'web-mode-hook 'my-web-mode-indent-setup)

;; tern
(add-to-list 'load-path "~/.config/yarn/global/node_modules/tern/emacs/")
(autoload 'tern-mode "tern.el" nil t)

(add-hook 'js2-mode-hook (lambda ()
			   (tern-mode)
			   (company-mode)))

(eval-after-load 'tern
   '(progn
      (require 'tern-auto-complete)
      (tern-ac-setup)))

(provide 'init-web)
