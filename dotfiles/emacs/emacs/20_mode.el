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
