;;; init-yasnippet.el --- yasnippet config
;;; Commentary:
;;; Code:

(require 'yasnippet)
(yas-global-mode 1)
(yas-reload-all)
(setq yas-also-auto-indent-first-line t)
(add-hook 'prog-mode-hook #'yas-minor-mode)

(provide 'init-yasnippet)
;;; init-yasnippet.el ends here
