;;
;;                ╔════════════════════════════════════════════╗
;;                ║         ⎋ INITIAL CONFIGURATION ⎋          ║
;;                ╚════════════════════════════════════════════╝
;;
;; Author    : Ren Chunhui
;; Website   : https://renchunhui.github.io
;; Repo      : https://github.com/renchunhui/dotfile

(defun emacs/init ()
  (emacs/remove-gui-elements)
  (emacs/user-info)
  (emacs/basic)
  (emacs/time)
  (emacs/mode-line)
  (load-theme 'atom-one-dark t))

;; 移除 GUI 元素
(defun emacs/remove-gui-elements ()
  (when (and (fboundp 'tool-bar-mode) (not (eq tool-bar-mode -1)))
    (tool-bar-mode -1))
  (when (and (fboundp 'scroll-bar-mode) (not (eq scroll-bar-mode -1)))
    (scroll-bar-mode -1))
  (when (and (fboundp 'menu-bar-mode) (not (eq menu-bar-mode -1)))
    (menu-bar-mode -1)))

;; 个人信息
(defun emacs/user-info ()
  (setq user-full-name "Ren Chunhui")
  (setq user-mail-address "renchunhui2008@gmail.com"))

;; 基本设置
(defun emacs/basic ()
  ;; 中文语言环境
  (set-language-environment 'Chinese-GB)

  ;; 文件编码
  (set-buffer-file-coding-system 'utf-8)

  ;; 显示行列
  (global-linum-mode t)

  ;; 高亮当前行
  (global-hl-line-mode t)

  ;; 以 y/n 取代 yes/no
  (fset 'yes-or-no-p 'y-or-n-p)

  ;; 显示 buffer 名
  (setq frame-title-format "%b@emacs")

  ;; 关闭启动画面
  (setq inhibit-startup-screen t)

  ;; 环境变量设置
  (setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
  (setq exec-path (append exec-path '("/usr/local/bin")))

  ;; 不生成临时文件
  (setq auto-save-mode nil)

  ;; 字体设置
  (set-default-font "DroidSansMono Nerd Font-13")

  ;; 滚动感觉
  (setq scroll-step 1
	scroll-margin 3
	scroll-conservatively 10000))

;; 时间设置
(defun emacs/time ()
  ;; 启用时间显示
  (display-time-mode 1)

  ;; 24 小时制
  (setq display-time-24hr-format t)

  ;; 显示日期和具体时间
  (setq display-time-day-and-date t)

  ;; 时间变化频率
  (setq display-time-interval 60))

;; custom mode line
(defun emacs/mode-line ()
  ;; enable the current line number
  (line-number-mode t)

  ;; enable battery infofation
  (setq display-battery-mode t))

(provide 'core-init)
