;;; init-git --- git
;;; Commentary:
;;; Code:

;; NOTE: run (global-git-gutter-mode t) AFTER (global-display-line-numbers-mode t)
;; OR  the left margin of the window will increase for whatever keystroke pressed.
(global-git-gutter-mode t)
(add-hook 'lua-mode-hook 'git-gutter-mode)

(provide 'init-git)
;;; init-git.el ends here
