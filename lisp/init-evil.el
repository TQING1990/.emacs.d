;;; init-evil.el --- evil config
;;; Commentary:
;;; Code:

(global-evil-leader-mode)
(evil-leader/set-leader ",")

(require 'evil)

(evil-mode 1)
(evilnc-default-hotkeys t)

;; You may delete this setup to use Evil NORMAL state always.
(dolist (p '((neotree-mode . emacs)
             (dired-mode . emacs)))
(evil-set-initial-state (car p) (cdr p)))

(global-evil-visualstar-mode)

(setq evil-emacs-state-cursor '("red" box)
     evil-normal-state-cursor '("green" box)
    evil-visual-state-cursor '("orange" box)
    evil-insert-state-cursor '("red" bar)
    evil-replace-state-cursor '("red" (hbar . 2))
    evil-operator-state-cursor '("red" hollow))

(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)

(define-key evil-normal-state-map (kbd "C-k") (lambda ()
                                                (interactive)
                                                (evil-scroll-up nil)))
(define-key evil-normal-state-map (kbd "C-j") (lambda ()
                                                (interactive)
                                                (evil-scroll-down nil)))

(evil-leader/set-key "o" (lambda () ; <leader>o open line below
                           (interactive)
                           (evil-open-below 1)
                           (evil-normal-state)))
(evil-leader/set-key "O" (lambda () ; <leader>o open line above
                           (interactive)
                           (evil-open-above 1)
                           (evil-normal-state)))

(define-key evil-insert-state-map (kbd "C-a") 'move-beginning-of-line)
(define-key evil-insert-state-map (kbd "C-e") 'move-end-of-line)

;; elscreen kill
;; (define-key evil-normal-state-map (kbd "C-w d") 'elscreen-kill)

;; c+ c- to increase/decrease number like Vim's C-a C-x
;; (define-key evil-normal-state-map (kbd "C-+") 'evil-numbers/inc-at-pt)
;; (define-key evil-normal-state-map (kbd "C--") 'evil-numbers/dec-at-pt)

(require 'evil-surround)
(global-evil-surround-mode 1)
(defun evil-surround-prog-mode-hook-setup ()
  "编程模式使用."
  (push '(47 . ("/" . "/")) evil-surround-pairs-alist)
  (push '(40 . ("(" . ")")) evil-surround-pairs-alist)
  (push '(41 . ("(" . ")")) evil-surround-pairs-alist)
  (push '(91 . ("[" . "]")) evil-surround-pairs-alist)
  (push '(93 . ("[" . "]")) evil-surround-pairs-alist))
(add-hook 'prog-mode-hook 'evil-surround-prog-mode-hook-setup)
(defun evil-surround-emacs-lisp-mode-hook-setup ()
  "Emacs-lisp-mode使用."
  (push '(?` . ("`" . "'")) evil-surround-pairs-alist))
(add-hook 'emacs-lisp-mode-hook 'evil-surround-emacs-lisp-mode-hook-setup)

;; Emacs key bindings
(global-set-key (kbd "M-;") 'evilnc-comment-or-uncomment-lines)
(global-set-key (kbd "C-c l") 'evilnc-quick-comment-or-uncomment-to-the-line)
(global-set-key (kbd "C-c c") 'evilnc-copy-and-comment-lines)
(global-set-key (kbd "C-c p") 'evilnc-comment-or-uncomment-paragraphs)

;; Vim key bindings
(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-key
  ;; clipboard
  "yc" 'copy-to-clipboard
  "yn" 'cp-filename-of-current-buffer
  "yf" 'cp-fullpath-of-current-buffer
  "ck" 'clipboard-to-kill-ring

  ;; neotree
  "ntt" 'neotree-toggle
  "ntf" 'neotree-find

  ;; comment
  "ci" 'evilnc-comment-or-uncomment-lines
  "cl" 'evilnc-quick-comment-or-uncomment-to-the-line
  "ll" 'evilnc-quick-comment-or-uncomment-to-the-line
  "cc" 'evilnc-copy-and-comment-lines
  "cp" 'evilnc-comment-or-uncomment-paragraphs
  "cr" 'comment-or-uncomment-region
  "cv" 'evilnc-toggle-invert-comment-line-by-line
  "."  'evilnc-copy-and-comment-operator

  ;; other
  "v"  'exchange-point-and-mark
  "bf" 'beginning-of-defun
  "ef" 'end-of-defun
  "ff" 'counsel-find-file
  "rf" 'counsel-recentf
  "kb" 'kill-current-buffer
  "bb" 'evil-buffer
  "im" 'counsel-imenu
  "ib" 'counsel-ibuffer
  "fg" 'counsel-git
  "ag" 'counsel-ag
)

(provide 'init-evil)
;;; init-evil.el ends here
