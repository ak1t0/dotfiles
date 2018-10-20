;; Init
;;; package.el
(require 'package)
(package-initialize)
(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
	("melpa" . "http://melpa.org/packages/")
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
;;;; cutom
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

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
;;;; flycheck
(use-package flycheck
  :ensure t)
;;;; company
(use-package company
  :ensure t
  :config
  (custom-set-faces
   '(company-preview
     ((t (:foreground "darkgray" :underline t))))
   '(company-preview-common
     ((t (:inherit company-preview))))
   '(company-tooltip
     ((t (:background "lightgray" :foreground "black"))))
   '(company-tooltip-selection
     ((t (:background "steelblue" :foreground "white"))))
   '(company-tooltip-common
     ((((type x)) (:inherit company-tooltip :weight bold))
      (t (:inherit company-tooltip))))
   '(company-tooltip-common-selection
     ((((type x)) (:inherit company-tooltip-selection :weight bold))
            (t (:inherit company-tooltip-selection))))))

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

;;; Golang
;;;- go get -u github.com/rogpeppe/godef
;;;- go get -u github.com/nsf/gocode
;;;- go get -u github.com/alecthomas/gometalinter
;;;; go-mode
(use-package go-mode
  :ensure t
  :init
  (add-hook 'go-mode-hook 'flycheck-mode)
  (add-hook 'before-save-hook 'gofmt-before-save)
  :config
  (define-key go-mode-map (kbd "M-.") 'godef-jump)
  (define-key go-mode-map (kbd "M-,") 'pop-tag-mark))
;;;; gometalinter
(use-package flycheck-gometalinter
  :ensure t
  :config
  (flycheck-gometalinter-setup)
  (setq flycheck-gometalinter-fast t)
  (setq flycheck-gometalinter-test t))
;;;; company-go
(use-package company-go
  :ensure t
  :config
  (add-hook 'go-mode-hook 'company-mode)
  (add-hook 'go-mode-hook
	    (lambda ()
	      (set (make-local-variable 'company-backends) '(company-go))
	      (setq company-transformers '(company-sort-by-backend-importance))
	      (setq company-selection-wrap-around t)
	      (define-key company-active-map (kbd "C-n") 'company-select-next)
	      (define-key company-active-map (kbd "C-p") 'company-select-previous)
	      (define-key company-active-map (kbd "C-s") 'company-filter-candidates)
	      (define-key company-active-map (kbd "C-x") 'company-abort)
	      (define-key company-active-map (kbd "C-j") 'company-complete-selection))))

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
  (add-hook 'rust-mode-hook 'company-mode)
  (add-hook 'rust-mode-hook
	    (lambda ()
	      (define-key company-active-map (kbd "C-n") 'company-select-next)
	      (define-key company-active-map (kbd "C-p") 'company-select-previous)
	      (define-key company-active-map (kbd "C-s") 'company-filter-candidates)
	      (define-key company-active-map (kbd "C-x") 'company-abort)
	      (define-key company-active-map (kbd "C-j") 'company-complete-selection))))
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

;;; Ruby
;;;; ruby-mode
(use-package ruby-mode
  :ensure t)
;;;; ruby-electric
(use-package ruby-electric
  :ensure t
  :config
  (add-hook 'ruby-mode-hook
	    (lambda ()
	      (ruby-electric-mode t))))

;;; Clojure
;;;; clojure-mode
(use-package clojure-mode
  :ensure t)
;;;; cider
(use-package cider
  :ensure t)

;;; Docker
;;;; dockerfile-mode
(use-package dockerfile-mode
  :ensure t)

;;; Markdown
;;;; markdown-mode
(use-package markdown-mode
  :ensure t)
