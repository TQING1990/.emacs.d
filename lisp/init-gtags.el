;;; init-gtags.el --- gtags config
;;; Commentary:
;;; Code:

(require 'counsel-gtags)
(add-hook 'c-mode-hook 'counsel-gtags-mode)
(add-hook 'c++-mode-hook 'counsel-gtags-mode)
(add-hook 'lua-mode-hook 'counsel-gtags-mode)

(with-eval-after-load 'counsel-gtags
  (define-key counsel-gtags-mode-map (kbd "M-t") 'counsel-gtags-find-definition)
  (define-key counsel-gtags-mode-map (kbd "M-r") 'counsel-gtags-find-reference)
  (define-key counsel-gtags-mode-map (kbd "M-s") 'counsel-gtags-find-symbol)
  (define-key counsel-gtags-mode-map (kbd "M-,") 'counsel-gtags-go-backward))

;; (require 'gtags)
;; (autoload 'gtags-mode "gtags" "" t)
;; (add-hook 'gtags-mode-hook
;;   '(lambda ()
;;         ; Local customization (overwrite key mapping)
;;         (define-key gtags-mode-map "\C-f" 'scroll-up)
;;         (define-key gtags-mode-map "\C-b" 'scroll-down)
;; ))

;; (add-hook 'gtags-select-mode-hook
;;   '(lambda ()
;;         (setq hl-line-face 'underline)
;;         (hl-line-mode 1)
;; ))

;; (add-hook 'lua-mode-hook
;;   '(lambda ()
;;         (gtags-mode 1)))
;; ; Customization
;; (setq gtags-suggested-key-mapping t)
;; (setq gtags-auto-update t)
(provide 'init-gtags)
;;; init-gtags.el ends here
