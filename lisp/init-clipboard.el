;;; init-clipboard.el --- clipboard config
;;; Commentary:
;;; Code:

;; (xclip-mode t)

(require 'xclip)

(setq select-enable-primary t
      select-enable-clipboard t)

;; kill-ring and clipboard are same? No, it's annoying!
(setq save-interprogram-paste-before-kill nil)

(defun copy-yank-str (msg &optional clipboard-only)
  "Copy msg to clipboard and kill ring.
MSG message.
CLIPBOARD-ONLY only copy to clipboard."
  (unless clipboard-only (kill-new msg))
  (xclip-set-selection 'clipboard msg)
  msg)

(defun clipboard-to-kill-ring ()
  "Copy from clipboard to 'kill-ring."
  (interactive)
  (kill-new (xclip-get-selection 'clipboard)))

(defun copy-to-clipboard ()
  "Copy region to clipboard."
  (interactive)
  (when (region-active-p)
    (let ((select-str (buffer-substring-no-properties (region-beginning) (region-end))))
      (copy-yank-str select-str t)
      (deactivate-mark))))

(defun cp-filename-of-current-buffer (&optional n)
  "Copy file name (NOT full path) into the yank ring and OS clipboard.
If N is not nil, copy file name and line number."
  (interactive "P")
  (when buffer-file-name
    (let* ((filename (file-name-nondirectory buffer-file-name))
           (s (if n (format "%s:%s" filename (line-number-at-pos)) filename)))
      (copy-yank-str s)
      (message "%s => clipboard&kill-ring" s))))

(defun cp-fullpath-of-current-buffer ()
  "Copy full path into the yank ring and OS clipboard."
  (interactive)
  (when buffer-file-name
    (copy-yank-str (file-truename buffer-file-name))
    (message "file full path => clipboard & yank ring")))

(provide 'init-clipboard)
;;; init-clipboard.el ends here