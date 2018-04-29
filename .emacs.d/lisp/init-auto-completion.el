;; company 配置
;;

(setq company-idle-delay 0.1)
(setq company-tooltip-limit 10)
(setq company-minimum-prefix-length 1)

;; 开启全局 Company 补全
(global-company-mode 1)

;; 自动括号匹配
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

(provide 'init-auto-completion)
