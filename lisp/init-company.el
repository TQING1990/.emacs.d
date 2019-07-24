;;; init-company.el --- company mode config
;;; Commentary:
;;; Code:

(require 'company)
(require 'company-dabbrev)
(add-hook 'after-init-hook 'global-company-mode)

(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)

(setq-default company-idle-delay 0.1
              company-minimum-prefix-length 2
              company-show-numbers t
              company-dabbrev-downcase nil
              company-dabbrev-ignore-case nil
              company-selection-wrap-around t)

(require 'company-statistics)
(add-hook 'after-init-hook 'company-statistics-mode)
(company-statistics-mode)

(provide 'init-company)
;;; init-company.el ends here