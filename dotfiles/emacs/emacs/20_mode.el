;;; Haskell
;;;; haskell-mode
(use-package haskell-mode
  :ensure t
  :defer t)
;;;; intero
(use-package intero
  :ensure t
  :defer t
  :config
  (add-hook 'haskell-mode-hook 'intero-mode))

;;; Clojure
;;;; clojure-mode
(use-package clojure-mode
  :ensure t
  :defer t)
;;;; cider
(use-package cider
  :ensure t
  :defer t)

;;; Ruby
;;;; ruby-mode
(use-package ruby-mode
  :ensure t
  :defer t)

;;; Docker
;;;; dockerfile-mode
(use-package dockerfile-mode
  :ensure t
  :defer t)

;;; Markdown
;;;; markdown-mode
(use-package markdown-mode
  :ensure t
  :defer t)

;;; Kotlin
;;;; kotlin-mode
(use-package kotlin-mode
  :ensure t
  :defer t)

;;; YAML
;;;; yaml-mode
(use-package yaml-mode
  :ensure t
  :defer t)
