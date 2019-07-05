;;; init-flycheck.el --- flycheck config
;;; Commentary:
;;; Code:

(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)
(setq-default flycheck-checker-error-threshold 1000)

(provide 'init-flycheck)
;;; init-flycheck.el ends here
