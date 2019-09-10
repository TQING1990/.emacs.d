;;; init.el --- emacs initialize config
;;; Commentary:

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

;;; Code:


;; (add-to-list 'load-path "~/.emacs.d/lisp/")
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;;(defconst *is-a-mac* (eq system-type 'darwin))

(defun open-my-init-file()
  "快捷打开配置文件."
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(global-set-key (kbd "<f1>") 'open-my-init-file)


(defun open-my-org-file()
  "快捷打开ORG."
  (interactive)
  (find-file "~/org/README.org"))
(global-set-key (kbd "<f2>") 'open-my-org-file)

;; Package

(require 'init-packages)
(require 'init-default)
(require 'init-org)
(require 'init-clipboard)
(require 'init-company)
(require 'init-lua-mode)
(require 'init-ivy)
(require 'init-tags)
(require 'init-flycheck)
(require 'init-yasnippet)
(require 'init-exec-path)
(require 'init-electric-pair)
(require 'init-evil)
(require 'init-git)
(require 'init-neotree)
(require 'init-theme)

(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))
(load-file custom-file)

(provide 'init)
;;; init.el ends here
