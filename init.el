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
(add-hook 'go-mode-hook #'flycheck-mode)

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

