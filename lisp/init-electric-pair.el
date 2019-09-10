;;; init-electric-pair.el --- electric-pair mode config
;;; Commentary:
;;; Code:

(electric-pair-mode t)

(defun electric-pair ()
      "If at end of line, insert character pair without surrounding spaces.
Otherwise, just insert the typed character."
      (interactive)
      (if (eolp) (let (parens-require-spaces) (insert-pair)) (self-insert-command 1)))

(require 'lua-mode)
(add-hook 'lua-mode-hook
              (lambda ()
                (define-key lua-mode-map "\"" 'electric-pair)
                (define-key lua-mode-map "\'" 'electric-pair)
                (define-key lua-mode-map "(" 'electric-pair)
                (define-key lua-mode-map "[" 'electric-pair)
                (define-key lua-mode-map "{" 'electric-pair)))

(provide 'init-electric-pair)
;;; init-electric-pair.el ends here
