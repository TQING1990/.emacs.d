;;; init-ivy.el --- ivy mode config
;;; Commentary:
;;; Code:

(require 'ivy)
(require 'counsel)
(require 'init-project)

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq ivy-count-format "(%d/%d) ")
;;(setq enable-recursive-minibuffers t)
(global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)

;;;###autoload
(defun my-counsel-git (dir &optional initial-input)
  "Find file in the DIR or current Git repository.
INITIAL-INPUT can be given as the initial minibuffer input."
  (interactive)
  (counsel-require-program counsel-git-cmd)
  (let ((default-directory (or dir (counsel-locate-git-root))))
    (ivy-read "Find file: " (counsel-git-cands default-directory)
              :initial-input initial-input
              :action #'counsel-git-action
              :history 'counsel-git-history
              :caller 'counsel-git)))

(defun my-counsel-git-project ()
  "My counsel git."
  (interactive)
  (my-counsel-git (get-git-top-level-recursive))
)

(provide 'init-ivy)
;;; init-ivy.el ends here
