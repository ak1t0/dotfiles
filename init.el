;;;; Basic Settings

;; Window Settings
(setq package--init-file-ensured t)
(setq initial-scratch-message nil)
(setq inhibit-startup-message t)
(tool-bar-mode -1)
(menu-bar-mode -1)

(load-theme 'misterioso t)

;; set config file directory to var
(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))

;;;; El-Get

;; add $PATH/el-get/el-get to PATH
(add-to-list 'load-path (locate-user-emacs-file "el-get/el-get"))

;; El-Get install
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

;;; General
(el-get-bundle use-package)
(el-get-bundle dash)
(el-get-bundle flycheck)
(el-get-bundle auto-complete)
(el-get-bundle company)

(ffap-bindings)
(show-paren-mode 1)
(setq require-final-newline t)
(set-language-environment "UTF-8")
(bind-key* "C-h" 'delete-backward-char)

(setq alpha-flag nil)
(defun alpha-toggle ()
  (interactive)
  (if (equal alpha-flag t)
      (progn
	(set-frame-parameter nil 'alpha 100)
	(setq alpha-flag nil)
	(message "alpha off"))
      (progn
	(set-frame-parameter nil 'alpha 70)
	(setq alpha-flag t)
	(message "alpha on"))))
(bind-key* "C-x t" 'alpha-toggle)

;; for Custom warning
(load (setq custom-file (expand-file-name "custom.el" user-emacs-directory)))

;;; Helm
(el-get-bundle helm)

(use-package helm
  :init
  (setq helm-split-window-in-side-p t)
  (setq helm-move-to-line-cycle-in-source t)
  (setq helm-ff-search-library-in-sexp t)
  (setq helm-scroll-amount 8)
  (setq helm-ff-file-name-history-use-recentf t)
  (setq helm-echo-input-in-header-line t)
  (setq helm-autoresize-mode t)
  (setq helm-buffers-fuzzy-matching t)
  (setq helm-recentf-fuzzy-match t)
  :bind
  (("C-c h" . helm-command-prefix)
   ("M-x" . helm-M-x)
   ("C-x C-f" . helm-find-files)
   ("C-x b" .  helm-mini)
   ("C-c o" . helm-occur))
  :config
  (helm-mode 1))

;;; Go

;; go get -u github.com/rogpeppe/godef
;; go get -u github.com/golang/lint/
;; go get -u github.com/nsf/gocode

(el-get-bundle go-mode)
(el-get-bundle go-lint)
(el-get-bundle go-eldoc)
(el-get-bundle go-autocomplete)
(el-get-bundle flycheck-gometalinter)

(use-package go-mode
  :init
  (add-to-list 'exec-path (expand-file-name "~/go/bin"))
  :config
  (bind-keys :map go-mode-map
         ("C-." . godef-jump)
         ("C-," . pop-tag-mark))
  (add-hook 'go-mode-hook 'flycheck-mode)
  (add-hook 'go-mode-hook 'go-eldoc-setup)
  (add-hook 'before-save-hook 'gofmt-before-save))

(use-package flycheck-gometalinter
  :init
  (setq flycheck-gometalinter-fast t)
  (setq flycheck-gometalinter-test t)
  :config
  (flycheck-gometalinter-setup))

;;; Rust
(el-get-bundle rust-mode)
(el-get-bundle flycheck-rust)
(el-get-bundle racer)

(use-package rust-mode
  :init
  (add-to-list 'exec-path (expand-file-name "~/.cargo/bin/"))
  :config
  (add-hook 'rust-mode-hook #'flycheck-mode)
  (add-hook 'rust-mode-hook #'racer-mode)
  (add-hook 'racer-mode-hook #'company-mode))

;;; Markdown
(el-get-bundle markdown-mode)

;;; Ruby
(el-get-bundle ruby-mode)

;;; Docker
(el-get-bundle dockerfile-mode)

;;; Clojure
(el-get-bundle clojure-mode)
(el-get-bundle cider)

(use-package cider
  :config
  (add-hook 'cider-mode-hook #'company-mode))

;; Python
(el-get-bundle jedi)

(use-package jedi
  :init
  (setq jedi:complete-on-dot t)
  :config
  (add-hook 'python-mode-hook #'jedi:setup)
  (jedi:install-server))
