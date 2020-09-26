;;; Go
;;;- go get golang.org/x/tools/gopls
;;;; go-mode
(use-package go-mode
  :ensure t
  :commands go-mode
  :config
  (add-hook 'go-mode-hook #'lsp)
  (add-hook 'before-save-hook #'lsp-format-buffer)
  (add-hook 'before-save-hook #'lsp-organize-imports))

