;; Init
;;; package.el
(require 'package)
(package-initialize)
(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
	("melpa" . "https://melpa.org/packages/")
	("org" . "http://orgmode.org/elpa/")))
(unless package-archive-contents
    (package-refresh-contents))

;;; use-package
(when (not (package-installed-p 'use-package))
  (package-install 'use-package))
(require 'use-package)


;; General
;;; system
;;;; message
(setq initial-scratch-message nil)
(setq inhibit-startup-message t)
;;;; custom
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
;;;; security
(use-package gnu-elpa-keyring-update :ensure t)

;;; UI/UX
;;;; final newline
(setq require-final-newline t)
;;;; paren
(show-paren-mode t)
(setq show-paren-style 'mixed)
;;;; bar mode
(tool-bar-mode 0)
(menu-bar-mode 0)

;;; key
(define-key key-translation-map (kbd "C-h") (kbd "<DEL>"))
(define-key key-translation-map (kbd "C-z") (kbd "C-g"))


;; Package
;;; General
;;;; xclip
(use-package xclip
  :ensure t
  :config
  (xclip-mode t)
  (xterm-mouse-mode t))

;;; Helm
;;;; helm
(use-package helm
  :ensure t
  :config
  (helm-mode t)
  (global-set-key (kbd "C-x b") 'helm-mini)
  (global-set-key (kbd "C-x C-f") 'helm-find-files)
  (global-set-key (kbd "M-x") 'helm-M-x)
  (global-set-key (kbd "M-y") 'helm-show-kill-ring)
  (setq helm-split-window-in-side-p           t
	helm-move-to-line-cycle-in-source     t
	helm-ff-search-library-in-sexp        t
	helm-scroll-amount                    8
	helm-ff-file-name-history-use-recentf t
	helm-echo-input-in-header-line t
	helm-autoresize-mode t)
  (setq helm-buffers-fuzzy-matching t
	helm-recentf-fuzzy-match    t))

;;; LSP
;;;; lsp-mode
(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred)
  :hook
  (go-mode . lsp-deferred)
  :config
  (global-set-key (kbd "M-,") 'xref-pop-marker-stack)
  (global-set-key (kbd "M-.") 'xref-find-definitions))
;;;; company
(use-package company
  :ensure t
  :config
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 1)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous)
  (define-key company-active-map (kbd "C-s") 'company-abort)
  (define-key company-active-map (kbd "C-j") 'company-complete-selection))
;;;; company-lsp
(use-package company-lsp
  :ensure t
  :commands company-lsp)
;;;; lsp-ui
(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)

;;; Go
;;;- go get golang.org/x/tools/gopls@latest
;;;; go-mode
(use-package go-mode
  :ensure t
  :commands go-mode
  :config
  (add-hook 'go-mode-hook #'lsp)
  (add-hook 'before-save-hook 'lsp-format-buffer))

;;; Rust
;;;; rust-mode
(use-package rust-mode
  :ensure t
  :config
  (add-hook 'rust-mode-hook 'flycheck-mode))
;;;; racer
(use-package racer
  :ensure t
  :config
  (add-hook 'rust-mode-hook 'racer-mode)
  (add-hook 'rust-mode-hook 'company-mode))
;;;; flycheck-rust
(use-package flycheck-rust
  :ensure t
  :config
  (add-hook 'rust-mode-hook 'flycheck-rust-setup))

;;; Haskell
;;;; haskell-mode
(use-package haskell-mode
  :ensure t)
;;;; intero
(use-package intero
  :ensure t
  :config
  (add-hook 'haskell-mode-hook 'intero-mode))

;;; Clojure
;;;; clojure-mode
(use-package clojure-mode
  :ensure t)
;;;; cider
(use-package cider
  :ensure t)

;;; Ruby
;;;; ruby-mode
(use-package ruby-mode
  :ensure t)

;;; Docker
;;;; dockerfile-mode
(use-package dockerfile-mode
  :ensure t)

;;; Markdown
;;;; markdown-mode
(use-package markdown-mode
  :ensure t)

;;; Kotlin
;;;; kotlin-mode
(use-package kotlin-mode
  :ensure t)

;;; YAML
;;;; yaml-mode
(use-package yaml-mode
    :ensure t)
