;;; Ivy
;;;; ivy
(use-package ivy
  :ensure t
  :config
  (ivy-mode 1)
  ;; general
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  ;; binding
  (global-set-key "\C-s" 'swiper)
  (global-set-key (kbd "M-x") 'counsel-M-x)
  (global-set-key (kbd "C-x b") 'counsel-buffer-or-recentf))


;;;; swiper
(use-package swiper
  :ensure t)

;;;; counsel
(use-package counsel
  :ensure t)
