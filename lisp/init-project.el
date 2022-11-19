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
      (shell-command-success (shell-command (format "cd %s;git rev-parse --is-inside-work-tree 2>/dev/null;" dir)))
      (shell-command-success (shell-command "git rev-parse --is-inside-work-tree 2>/dev/null;"))))

(defun get-git-top-level (&optional dir)
  "Get DIR place is in work tree."
  (if dir
      (string-trim-final-newline (shell-command-to-string (format "cd %s;git rev-parse --show-toplevel 2>/dev/null;" dir)))
      (string-trim-final-newline (shell-command-to-string "git rev-parse --show-toplevel; 2>/dev/null"))))

(defun get-git-top-level-recursive (&optional root)
  "Get git top level recursive of ROOT dir."
  (if root
    (if (is-in-git-work-tree (get-pre-dir root))
          (get-git-top-level-recursive (get-git-top-level (get-pre-dir root)))
          (get-git-top-level root))
    (if (is-in-git-work-tree (file-name-directory buffer-file-name))
          (get-git-top-level-recursive (get-git-top-level))
          (message "not found project root"))))

(provide 'init-project)
;;; init-project.el ends here