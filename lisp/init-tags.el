;;; init-tags.el --- tags config
;;; Commentary:
;;; Code:

(with-eval-after-load 'counsel-etags
  ;; counsel-etags-ignore-directories does NOT support wildcast
  ;; (push "build_clang" counsel-etags-ignore-directories)
  ;; (push "build_clang" counsel-etags-ignore-directories)
  ;; counsel-etags-ignore-filenames supports wildcast
  (push "TAGS" counsel-etags-ignore-filenames)
  (push "*.json" counsel-etags-ignore-filenames))

;; Don't ask before rereading the TAGS files if they have changed
(setq tags-revert-without-query t)
;; Don't warn when TAGS files are large
(setq large-file-warning-threshold nil)
;; Setup auto update now
(add-hook 'prog-mode-hook
  (lambda ()
    (add-hook 'after-save-hook
              'counsel-etags-virtual-update-tags 'append 'local)))

(setq counsel-etags-update-tags-backend (lambda (src-dir) (shell-command (format "cd %s;/opt/local/bin/uctags -e -R" src-dir))))

;; (require 'counsel-gtags)
;; (add-hook 'c-mode-hook 'counsel-gtags-mode)
;; (add-hook 'c++-mode-hook 'counsel-gtags-mode)
;; (add-hook 'lua-mode-hook 'counsel-gtags-mode)

;; (with-eval-after-load 'counsel-gtags
;;   (define-key counsel-gtags-mode-map (kbd "M-t") 'counsel-gtags-find-definition)
;;   (define-key counsel-gtags-mode-map (kbd "M-r") 'counsel-gtags-find-reference)
;;   (define-key counsel-gtags-mode-map (kbd "M-s") 'counsel-gtags-find-symbol)
;;   (define-key counsel-gtags-mode-map (kbd "M-,") 'counsel-gtags-go-backward))

(provide 'init-tags)
;;; init-tags.el ends here
