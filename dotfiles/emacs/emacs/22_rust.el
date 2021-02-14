(use-package rust-mode
  :ensure t
  :custom rust-format-on-save t
  :defer t)

(use-package cargo
  :ensure t
  :defer t
  :config
  (add-hook 'rust-mode-hook 'cargo-minor-mode))
