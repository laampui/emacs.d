;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(setq gc-cons-threshold (* 128 1024 1024 ))
(require 'package)
(setq package-enable-at-startup nil)
;;(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
;;                          ("org" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
;;                         ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")
                         ))

(package-initialize)
;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
	(package-refresh-contents)
	(package-install 'use-package))
(org-babel-load-file (expand-file-name "~/.emacs.d/myinit.org"))
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq inhibit-splash-screen t)
(setq make-backup-files nil)
(setq er--show-expansion-message t)
(setq create-lockfiles nil)
;;高亮括号
;;(show-paren-mode t)
;;proxy
(setq url-proxy-services
      '(("no_proxy" . "^\\(localhost\\|10.*\\)")
       ("http" . "127.0.0.1:12333")
       ("https" . "127.0.0.1:12333")
        ))
;(setq url-gateway-method 'socks)
;(setq socks-server '("Default server" "127.0.0.1" 1080 5))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#1B2229" "#ff6c6b" "#98be65" "#ECBE7B" "#51afef" "#c678dd" "#46D9FF" "#DFDFDF"])
 '(case-fold-search nil)
 '(custom-safe-themes
   (quote
    ("6b289bab28a7e511f9c54496be647dc60f5bd8f9917c9495978762b99d8c96a0" "ecba61c2239fbef776a72b65295b88e5534e458dfe3e6d7d9f9cb353448a569e" "cd736a63aa586be066d5a1f0e51179239fe70e16a9f18991f6f5d99732cabb32" "6b2636879127bf6124ce541b1b2824800afc49c6ccd65439d6eb987dbf200c36" "fe666e5ac37c2dfcf80074e88b9252c71a22b6f5d2f566df9a7aa4f9bea55ef8" "d2e9c7e31e574bf38f4b0fb927aaff20c1e5f92f72001102758005e53d77b8c9" "b54826e5d9978d59f9e0a169bbd4739dd927eead3ef65f56786621b53c031a7c" default)))
 '(fci-rule-color "#5B6268")
 '(jdee-db-active-breakpoint-face-colors (cons "#1B2229" "#51afef"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#1B2229" "#98be65"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#1B2229" "#3f444a"))
 '(magit-diff-section-arguments (quote ("--no-ext-diff")))
 '(magit-diff-use-overlays nil)
 '(markdown-command "/usr/bin/pandoc")
 '(org-agenda-files (quote ("~/Documents/TODO.org")))
 '(package-selected-packages
   (quote
    (vue-mode company-lsp lsp-ui lsp-mode carbon-now-sh ng2-mode twittering-mode indium alarm-clock react-snippets rjsx-mode web-mode spaceline ein markdown-preview-mode expand-region which-key flycheck-inline-mode elpy rg yasnippet-snippets pyim pyim-cangjie5dict posframe doom-modeline js2-mode yasnippet symbol-overlay company-quickhelp tern-mode tern-auto-complete company-tern beacon undo-tree spaceline-config company treemacs-projectile treemacs helm-ag swiper auto-complete dumb-jump counsel projectile use-package solaire-mode doom-themes org highlight-parentheses winum smartparens multiple-cursors emmet-mode smex rainbow-delimiters magit json-mode flycheck all-the-icons markdown-mode)))
 '(vc-annotate-background "#282c34")
 '(vc-annotate-color-map
   (list
    (cons 20 "#98be65")
    (cons 40 "#b4be6c")
    (cons 60 "#d0be73")
    (cons 80 "#ECBE7B")
    (cons 100 "#e6ab6a")
    (cons 120 "#e09859")
    (cons 140 "#da8548")
    (cons 160 "#d38079")
    (cons 180 "#cc7cab")
    (cons 200 "#c678dd")
    (cons 220 "#d974b7")
    (cons 240 "#ec7091")
    (cons 260 "#ff6c6b")
    (cons 280 "#cf6162")
    (cons 300 "#9f585a")
    (cons 320 "#6f4e52")
    (cons 340 "#5B6268")
    (cons 360 "#5B6268")))
 '(vc-annotate-very-old-color nil)
 '(winner-mode t))
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
                           :font "Fira Mono-11")
       (dolist (charset '(kana han symbol cjk-misc bopomofo))
         (set-fontset-font (frame-parameter nil 'font)
                           charset
                           (font-spec :family "Noto Serif CJK SC Medium"))) )
      (t 0))
;; 配置 emacsclient -c 启动下的字体
;; (setq default-frame-alist '((font . "Fira Mono-11")))
