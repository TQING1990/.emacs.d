;;; init-exec-path.el --- exec-path config
;;; Commentary:
;;; Code:

;; Find Executable Path on OS X
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(provide 'init-exec-path)
;;; init-exec-path.el ends here
