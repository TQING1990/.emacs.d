;;; init-citre.el --- citre config
;;; Commentary:
;;; Code:

(require 'citre)
(require 'citre-config)

(setq citre-readtags-program "/opt/local/bin/ureadtags")
(setq citre-ctags-program "/opt/local/bin/uctags")
(setq citre-project-root-function #'get-git-top-level-recursive)
(setq citre-use-project-root-when-creating-tags t)

(provide 'init-citre)
;;; init-citre.el ends here