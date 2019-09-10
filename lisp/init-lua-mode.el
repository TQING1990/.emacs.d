;;; init-lua-mode.el --- lua-mode config
;;; Commentary:
;;; Code:

(require 'lua-mode)
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))

(with-eval-after-load 'lua-mode
  (setq lua-indent-level 4))

(defun lua-send-string (str)
  "Load STR plus a newline into Lua subprocess.

If `lua-process' is nil or dead, start a new process first."
  (let ((tmp-file (make-temp-file "luamode" nil ".tmp"))
        (lua-process (lua-get-create-process)))
    ;; write data into temporary file
    (with-temp-buffer
      (insert (if (string-equal (substring str -1) "\n")
                  str
                (concat str "\n")))
      (write-file tmp-file))
    ;; evaluate data in the temporary file and then remove it
    (process-send-string
     lua-process
     (format (concat
              "\n"
              "local tmp = '%s';"
              "local res, e = pcall(function () "
              "  local do_loadstring = loadstring or load;"
              ""
              "  local f, e = io.open(tmp, 'r');" ; open temporary file
              "  if e then "
              "    os.remove(tmp);"
              "    error(e);"
              "    return;"
              "  end "
              ""
              "  local cont, e = f:read('*all');" ; read all data
              "  if e then "
              "    os.remove(tmp);"
              "    error(e);"
              "    return;"
              "  end "
              ""
              "  f:close(); f = nil;" ; close and remove file
              "  os.remove(tmp);"
              ""
              "  local f, e = do_loadstring(cont);" ; handle chunk
              "  if e then "
              "    error(e);"
              "    return;"
              "  end "
              ""
              "  return f();" ; execute chunk
              "end);"
              "if e then _, _ = os.remove(tmp); error(e); end" ; handle error, if any
              "\n") tmp-file))))


(define-key lua-mode-map (kbd "s-r") 'lua-restart-with-whole-file)

(provide 'init-lua-mode)
;;; init-lua-mode.el ends here