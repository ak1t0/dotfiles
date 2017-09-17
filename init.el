;;;; 基本設定

;; ウィンドウの初期設定 
(setq package--init-file-ensured t)
(setq initial-scratch-message nil)
(setq inhibit-startup-message t)
(tool-bar-mode 0)

;; テーマを設定
(load-theme 'misterioso t)

;; 読み込んだ設定ファイルのディレクトリを変数に設定
(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))

;;;; El-Getの設定

;; EmacsのPATHに$PATH/el-get/el-getを追加 
(add-to-list 'load-path (locate-user-emacs-file "el-get/el-get"))

;; El-Getが存在しないときインストールする
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

;;; General
(el-get-bundle dash)
(el-get-bundle flycheck)
(el-get-bundle company-mode)

(ffap-bindings)
(show-paren-mode 1)
(setq frame-title-format
      (format "%%f"))
(setq require-final-newline t)
(set-language-environment "UTF-8")

;; key-binding
(define-key key-translation-map (kbd "C-h") (kbd "<DEL>"))

;; for Custom warning
(load (setq custom-file (expand-file-name "custom.el" user-emacs-directory)))

;;; Helm
(el-get-bundle helm)
;; change key
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-c h o") 'helm-occur)

(setq helm-split-window-in-side-p           t
      helm-move-to-line-cycle-in-source     t
      helm-ff-search-library-in-sexp        t
      helm-scroll-amount                    8
      helm-ff-file-name-history-use-recentf t
      helm-echo-input-in-header-line t
      helm-autoresize-mode t)
(setq helm-buffers-fuzzy-matching t
      helm-recentf-fuzzy-match    t)
(helm-mode 1)

;;; Go
;; go get -u github.com/rogpeppe/godef
;; go get -u github.com/golang/lint/
;; go get -u github.com/nsf/gocode
(el-get-bundle go-mode)
(el-get-bundle go-lint)
(el-get-bundle company-go)

(add-to-list 'exec-path (expand-file-name "~/go/bin"))

(add-hook 'go-mode-hook
	  (lambda ()
	    (set (make-local-variable 'company-backends) '(company-go))
	    (company-mode)))
(add-hook 'go-mode-hook
	  (lambda ()
	    (local-set-key (kbd "C-.") 'godef-jump)
	    (local-set-key (kbd "C-,") 'pop-tag-mark)))
(add-hook 'go-mode-hook #'flycheck-mode)
(add-hook 'before-save-hook 'gofmt-before-save)

;;; Rust
(el-get-bundle rust-mode)
(el-get-bundle flycheck-rust)
(el-get-bundle racer)

(add-to-list 'exec-path (expand-file-name "~/.cargo/bin/"))

(add-hook 'rust-mode-hook #'flycheck-mode)
(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'company-mode)

;;; Markdown
(el-get-bundle markdown-mode)

;;; Ruby
(el-get-bundle ruby-mode)
(el-get-bundle ruby-electric)

(add-hook 'ruby-mode-hook '(lambda () (ruby-electric-mode t)))

;;; Docker
(el-get-bundle dockerfile-mode)

;;; Clojure
(el-get-bundle clojure-mode)
(el-get-bundle cider)

(add-hook 'cider-mode-hook #'company-mode)
