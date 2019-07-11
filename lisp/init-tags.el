;;; init-tags.el --- tags config
;;; Commentary:
;;; Code:

(eval-after-load 'counsel-etags
  '(progn
     ;; counsel-etags-ignore-directories does NOT support wildcast
     ;; (add-to-list 'counsel-etags-ignore-directories "build_clang")
     ;; counsel-etags-ignore-filenames supports wildcast
     (add-to-list 'counsel-etags-ignore-filenames "TAGS")
     (add-to-list 'counsel-etags-ignore-filenames "*.json")))

;; Don't ask before rereading the TAGS files if they have changed
(setq tags-revert-without-query t)
;; Don't warn when TAGS files are large
(setq large-file-warning-threshold nil)
;; Setup auto update now
(add-hook 'prog-mode-hook
  (lambda ()
    (add-hook 'after-save-hook
              'counsel-etags-virtual-update-tags 'append 'local)))


(require 'counsel-gtags)
(add-hook 'c-mode-hook 'counsel-gtags-mode)
(add-hook 'c++-mode-hook 'counsel-gtags-mode)
(add-hook 'lua-mode-hook 'counsel-gtags-mode)

;; (with-eval-after-load 'counsel-gtags
;;   (define-key counsel-gtags-mode-map (kbd "M-t") 'counsel-gtags-find-definition)
;;   (define-key counsel-gtags-mode-map (kbd "M-r") 'counsel-gtags-find-reference)
;;   (define-key counsel-gtags-mode-map (kbd "M-s") 'counsel-gtags-find-symbol)
;;   (define-key counsel-gtags-mode-map (kbd "M-,") 'counsel-gtags-go-backward))

(provide 'init-tags)
;;; init-tags.el ends here
