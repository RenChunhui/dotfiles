;; 初使化
(defun emacs/init ()
  (emacs/remove-gui-elements)
  (setq inhibit-startup-screen t)
  (load-theme 'atom-one-dark t))

;; 移除 GUI 元素
(defun emacs/remove-gui-elements ()
  (when (and (fboundp 'tool-bar-mode) (not (eq tool-bar-mode -1)))
    (tool-bar-mode -1))
  (when (and (fboundp 'scroll-bar-mode) (not (eq scroll-bar-mode -1)))
    (scroll-bar-mode -1))
  (when (and (fboundp 'menu-bar-mode) (not (eq menu-bar-mode -1)))
    (menu-bar-mode -1)))

(provide 'init-emacs)
