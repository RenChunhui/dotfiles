;; 自动补全

;; 开启全局 Company 补全
(global-company-mode 1)

;; 自动括号匹配
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

(provide 'init-auto-completion)
