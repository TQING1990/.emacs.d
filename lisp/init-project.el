;;; init-project.el --- project config
;;; Commentary:
;;; Code:

(defun string-trim-final-newline (string)
  "Get rid of \n in STRING."
  (let ((len (length string)))
    (cond
      ((and (> len 0) (eql (aref string (- len 1)) ?\n))
       (substring string 0 (- len 1)))
      (t string))))

(defun shell-command-success (ret)
  "Return t or nil.check execute result RET."
  (eq 0 ret))

(defun get-pre-dir (&optional dir)
  "Get dir of pre DIR."
  (if dir
      (string-trim-final-newline (shell-command-to-string (format "cd %s;cd ..;pwd;" dir)))
      (string-trim-final-newline (shell-command-to-string "cd ..;pwd;"))))

(defun is-in-git-work-tree (&optional dir)
  "Check DIR is in work tree."
  (if dir
      (shell-command-success (shell-command (format "cd %s;git rev-parse --is-inside-work-tree;" dir)))
      (shell-command-success (shell-command "git rev-parse --is-inside-work-tree;"))))

(defun get-git-top-level (&optional dir)
  "Get DIR place is in work tree."
  (if dir
      (string-trim-final-newline (shell-command-to-string (format "cd %s;git rev-parse --show-toplevel;" dir)))
      (string-trim-final-newline (shell-command-to-string "git rev-parse --show-toplevel;"))))

(defun get-git-top-level-recursive (&optional root)
  "Get git top level recursive of ROOT dir."
  (if root
    (if (is-in-git-work-tree (get-pre-dir root))
          (get-git-top-level-recursive (get-git-top-level (get-pre-dir root)))
          (get-git-top-level root))
    (if (is-in-git-work-tree (file-name-directory buffer-file-name))
          (get-git-top-level-recursive (get-git-top-level))
          (message "not found project root"))))

(defun my-find-file-in-project ()
  "My find file in project."
  (interactive)
  (setq ffip-project-root (get-git-top-level-recursive))
  (find-file-in-project)
)

(defun my-find-file-in-project-at-point (&optional open-another-window)
  "My find file in project at point.Parameter OPEN-ANOTHER-WINDOW."
  (interactive)
  (setq ffip-project-root (get-git-top-level-recursive))
  (find-file-in-project-at-point open-another-window)
)

(defun my-find-file-in-project-by-selected (&optional open-another-window)
  "My find file in project at point.Parameter OPEN-ANOTHER-WINDOW."
  (interactive)
  (setq ffip-project-root (get-git-top-level-recursive))
  (find-file-in-project-by-selected)
)

(defun my-counsel-git-project ()
  "My counsel git."
  (interactive)
  (my-counsel-git (get-git-top-level-recursive))
)

(provide 'init-project)
;;; init-project.el ends here