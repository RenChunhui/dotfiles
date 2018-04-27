;; UI 界面
;; ----------------------------------------------

;; 禁用工具栏
(if window-system
    (tool-bar-mode nil))

;; 禁用滚动条
(scroll-bar-mode -1)

;; 显示行号
(global-linum-mode t)

;; 高亮当前行
(global-hl-line-mode t)

;; 主题选择
(load-theme 'atom-one-dark t)

;; 启用时间显示
(display-time-mode t)

;; 24小时制
(setq display-time-24hr-format t)

;; 启用邮件设置
(setq display-time-use-mail-icon t)

(provide 'init-ui)
