;; HTML
;; ----------------------------------------------

(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

;; 自动关闭标签
(setq web-mode-enable-auto-closing 1)
(setq web-mode-enable-auto-pairing t)

(defun my-web-mode-indent-setup ()
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  )
(add-hook 'web-mode-hook 'my-web-mode-indent-setup)

(provide 'init-html)
