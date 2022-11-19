;;; init-ffip.el --- ffip config
;;; Commentary:
;;; Code:

(require 'init-project)
(require 'find-file-in-project)

(setq ffip-use-rust-fd t)
(setq ffip-project-root-function 'get-git-top-level-recursive)

(provide 'init-ffip)
;;; init-ffip.el ends here