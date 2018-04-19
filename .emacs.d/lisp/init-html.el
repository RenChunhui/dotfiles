;; HTML
;; ----------------------------------------------

(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

;; 自动关闭标签
(setq web-mode-enable-auto-closing 1)
(setq web-mode-enable-auto-pairing t)

(provide 'init-html)
