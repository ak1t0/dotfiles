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
  :ensure t
  :defer t)

;;; LSP
;;;; lsp-mode
(use-package lsp-mode
  :ensure t
  :defer t
  :commands (lsp lsp-deferred)
  :hook
  (go-mode . lsp-deferred)
  (rust-mode . lsp-deferred)
  :config
  (global-set-key (kbd "M-,") 'xref-pop-marker-stack)
  (global-set-key (kbd "M-.") 'xref-find-definitions))
;;;; company
(use-package company
  :ensure t
  :defer t
  :config
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 1)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous)
  (define-key company-active-map (kbd "C-s") 'company-abort)
  (define-key company-active-map (kbd "C-j") 'company-complete-selection))
;;;; lsp-ui
(use-package lsp-ui
  :ensure t
  :defer t
  :commands lsp-ui-mode)
