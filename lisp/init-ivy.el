;;; init-ivy.el --- ivy mode config
;;; Commentary:
;;; Code:

(require 'ivy)

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq ivy-count-format "(%d/%d) ")
;;(setq enable-recursive-minibuffers t)
(global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)

(provide 'init-ivy)
;;; init-ivy.el ends here
