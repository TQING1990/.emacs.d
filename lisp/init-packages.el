;;; init-packages --- packages config
;;; Commentary:
;;; Code:

(require 'cl-lib)

(package-initialize)

(setq package-archives '(("elpa" . "https://elpa.gnu.org/packages/")
             ("melpa" . "https://melpa.org/packages/")
			 ("melpa-stable" . "https://stable.melpa.org/packages/")))

;; Add Packages
(defvar tqing/packages '(
             xclip
			 company
             company-statistics
			 magit
             git-gutter
			 ivy
			 swiper
			 counsel
			 counsel-etags
             wgrep
             ox-gfm
             citre
			 ;; --- Major Mode ---
			 lua-mode
             markdown-mode
			 ;; --- Minor Mode ---
			 exec-path-from-shell
			 flycheck
			 yasnippet
			 evil
			 evil-leader
			 evil-surround
			 evil-nerd-commenter
			 evil-visualstar
             evil-numbers
             evil-matchit
             evil-escape

             find-file-in-project
             neotree

             htmlize
			 ;; --- Themes ---
			 monokai-theme
			 ) "Default packages.")

(setq package-selected-packages tqing/packages)

(defun tqing/packages-installed-p ()
  "判断包是否安装."
  (cl-loop for pkg in tqing/packages
        when (not (package-installed-p pkg)) do (cl-return nil)
	finally (cl-return t)))

(unless (tqing/packages-installed-p)
     (message "%s" "Refreshing package database...")
     (package-refresh-contents)
     (dolist (pkg tqing/packages)
       (when (not (package-installed-p pkg))
	 (package-install pkg))))

(provide 'init-packages)
;;; init-packages.el ends here
