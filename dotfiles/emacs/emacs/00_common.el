;; General
;;; system
;;;; message
(setq initial-scratch-message nil)
(setq inhibit-startup-message t)
;;;; custom
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
;;;; final newline
(setq require-final-newline t)

;;; UI
;;;; paren
(show-paren-mode t)
(setq show-paren-style 'mixed)
;;;; bar mode
(tool-bar-mode 0)
(menu-bar-mode 0)

;;; security
;;;; gpg
(use-package gnu-elpa-keyring-update
  :ensure t)
