(global-set-key (kbd "C-x C-b") 'neotree-toggle)

;;(evil-mode 1)

;; 自定义启动界面
(dashboard-setup-startup-hook)
(setq dashboard-banner-logo-title "Welcome to Emacs")
(setq dashboard-items '((recents  . 5)
                        (bookmarks . 5)
                        (projects . 5)
                        (agenda . 5)
                        (registers . 5)))
(setq dashboard-startup-banner "~/.emacs.d/assets/logo.png")

(provide 'init-editor)
