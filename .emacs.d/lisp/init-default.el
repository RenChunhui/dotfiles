;; 关闭启动界面
(setq inhibit-splash-screen 1)

;; 启动全屏
(setq initial-frame-alist (quote ((fullscreen . maximized))))

;; 不产生备份文件
(setq make-backup-files nil)

;; 不生成临时文件
(setq-default make-backup-files 0)


(provide 'init-default)
