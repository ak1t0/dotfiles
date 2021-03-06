;;; Ivy
;;;; ivy
(use-package ivy
  :ensure t
  :config
  (ivy-mode 1)
  ;; general
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  (setq ivy-wrap t)
  (setq ivy-use-virtual-buffers t)
  ;; binding
  (global-set-key "\C-s" 'swiper)
  (global-set-key (kbd "M-x") 'counsel-M-x)
  (global-set-key (kbd "C-x b") 'counsel-buffer-or-recentf)
  (define-key ivy-minibuffer-map (kbd "C-q") 'minibuffer-keyboard-quit))

;;;; swiper
(use-package swiper
  :ensure t
  :defer t)

;;;; counsel
(use-package counsel
  :ensure t
  :defer t)
