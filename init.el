;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(setq gc-cons-threshold (* 128 1024 1024 ))
(require 'package)
(package-initialize)
(setq package-enable-at-startup nil)
  (setq package-archives '(("gnu"   . "https://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                          ("org" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
                         ("melpa" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
	(package-refresh-contents)
	(package-install 'use-package))
(org-babel-load-file (expand-file-name "~/.emacs.d/myinit.org"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (yasnippet-snippets winum which-key web-mode use-package undo-tree treemacs-projectile treemacs-icons-dired symbol-overlay solaire-mode smartparens rjsx-mode rg pyim posframe origami markdown-preview-mode magit lsp-ui indium highlight-parentheses helpful helm-ag flycheck expand-region emmet-mode elpy ein dumb-jump doom-themes doom-modeline default-text-scale counsel company-tern company-quickhelp company-lsp beacon))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(add-hook 'after-change-major-mode-hook (lambda() (electric-indent-mode -1)))
(setq not-to-kill-buffer-list '("*scratch*" "#emacs" "*Messages*" "*Warnings*"))
(defun kill-other-buffers ()
  "Kill all other buffers."
  (interactive)
  (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))
(add-hook 'kill-emacs-hook 'kill-other-buffers)
;;字体设置
(cond ((display-graphic-p)       
       (set-face-attribute 'default nil
                           :font "fira code-11")
       (dolist (charset '(kana han symbol cjk-misc bopomofo))
         (set-fontset-font (frame-parameter nil 'font)
                           charset
                           (font-spec :family "Noto Serif CJK SC Medium"))) )
      (t 0))
