;;; init-lua-mode.el --- lua-mode config
;;; Commentary:
;;; Code:

(require 'lua-mode)
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))

(setq lua-indent-level 4)

(provide 'init-lua-mode)
;;; init-lua-mode.el ends here
