;;; init-packages --- packages config
;;; Commentary:
;;; Code:

(require 'cl)

(package-initialize)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("melpa-stable" . "https://stable.melpa.org/packages/")))

;; Add Packages
(defvar tqing/packages '(
			 company
			 magit
			 ;;swiper
			 ;;counsel
			 ivy
			 smartparens
			 ;; --- Major Mode ---
			 lua-mode
			 ;; --- Minor Mode ---
			 exec-path-from-shell
			 flycheck
			 yasnippet
			 evil
			 evil-leader
			 evil-surround
			 evil-nerd-commenter
			 ;; --- Themes ---
			 monokai-theme
			 ) "Default packages.")

(setq package-selected-packages tqing/packages)

(defun tqing/packages-installed-p ()
  "判断包是否安装."
  (loop for pkg in tqing/packages
        when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

(unless (tqing/packages-installed-p)
     (message "%s" "Refreshing package database...")
     (package-refresh-contents)
     (dolist (pkg tqing/packages)
       (when (not (package-installed-p pkg))
	 (package-install pkg))))

(provide 'init-packages)
;;; init-packages.el ends here
