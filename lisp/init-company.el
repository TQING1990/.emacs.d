;;; init-company.el --- company mode config
;;; Commentary:
;;; Code:

(require 'company)

(global-company-mode 1)
(setq-default company-idle-delay 0.1)
(setq-default company-minimum-prefix-length 2)

(provide 'init-company)
;;; init-company.el ends here
