;;; init-ivy.el --- ivy mode config
;;; Commentary:
;;; Code:

(require 'ivy)

(ivy-mode 1)
(global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-git)

(provide 'init-ivy)
;;; init-ivy.el ends here
