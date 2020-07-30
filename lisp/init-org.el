;;; init-org.el --- org config
;;; Commentary:
;;; Code:

(require 'ob-plantuml)
(eval-after-load 'ob-plantuml
  (let ((jar-name "plantuml.jar")
        (url "http://jaist.dl.sourceforge.net/project/plantuml/plantuml.jar"))
    (setq org-plantuml-jar-path (expand-file-name jar-name (file-name-directory user-init-file)))
    (unless (file-exists-p org-plantuml-jar-path)
      (url-copy-file url org-plantuml-jar-path))))

(eval-after-load 'org
  (org-babel-do-load-languages
   'org-babel-load-languages
   `((ditaa . t)
     (emacs-lisp . t)
     (latex . t)
     (lua . t)
     (plantuml . t))))

(eval-after-load 'org
  '(require 'ox-gfm nil t))

(provide 'init-org)
;;; init-org.el ends here
