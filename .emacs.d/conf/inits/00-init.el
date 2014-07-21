;; do not disp opening message
(setq inhibit-splash-screen t)

;; disp full-path in title bar
(setq frame-title-format "%f")

;; do not disp menuber
(menu-bar-mode t)

;; do not disp toolbar
(if window-system
  (tool-bar-mode 0))

;; カーソル点滅無し
(blink-cursor-mode 0)

;; do not wrap right edge
(set-default 'truncate-lines t)
(set-default 'truncate-partial-width-windows nil)

;; do not use dialog box
(setq use-dialog-box nil)
(defalias 'message-box 'message)

;; disp date in modeline
(setq display-time-string-forms '(year "/" month "/" day "(" dayname ")" 24-hours ":" minutes))
(display-time)

;; set color theme
(load-theme 'zenburn t)

;; default, disable indent-tabs
(setq-default indent-tabs-mode nil)

;; tab width = 4
(setq-default tab-width 4)

;; disp column and line number in modeline
(column-number-mode t)
(line-number-mode t)

;; disp line number
(require 'linum)
(global-linum-mode t)
(global-set-key [f5] 'linum-mode)

;; set underline in cursor line
(defface hlline-face
  '((((class color)
      (background dark))
     (:background "dark slate gray"))
    (((class color)
      (background light))
     (:background "#98FB98"))
    (t (:bold t)))
  "*Face used by hl-line.")
(setq hl-line-face 'hlline-face)
(global-hl-line-mode t)

;; set transient-mark-mode
(setq transient-mark-mode t)

;; iswitchb-mode
(iswitchb-mode t)
;; buffer読み取り関数をiswitchbにする
(setq read-buffer-function 'iswitchb-read-buffer)
;; 正規表現を使う場合はt
(setq iswitchb-regexp nil)
;; 新規にbufferを作成するとき、確認しない
(setq iswitchb-prompt-newbuffer nil)

;; save history
(savehist-mode 1)

;; save curor position in file
(setq-default save-place t)

;; reduce GC Time
(setq gc-cons-threshold (* 10 gc-cons-threshold))

;; save log count
(setq message-log-max 10000)

;; call mini-buffer recursive
(setq enable-recursive-minibuffers t)

;; change history-length
(setq history-length 10000)

;; echo key stroke quickly
(setq echo-keystrokes 0.1)

;; max file size is 25M
(setq large-file-warning-threshold (* 25 1024 1024))

;; save input, if command is cancel
(defadvice abort-recursive-edit (before minibuffer-save activate)
  (when (eq (selected-window) (active-minibuffer-window))
    (add-to-history minibuffer-history-variable (minibuffer-contents))))

;; change backup file
(add-to-list 'backup-directory-alist
  (cons "." "~/.emacs.d/backups/"))
(setq auto-save-file-name-transforms
  `((".*", (expand-file-name "~/.emacs.d/backups/") t)))
(setq auto-save-list-file-prefix "~/.emacs.d/backups/.saves-")

;; disable backup
;;(setq make-backup-files nil)
;;(setq auto-save-default nil)

;; show pair paren
(show-paren-mode t)
(setq show-paren-delay 0)
;;(setq show-paren-style 'expression)
;;(set-face-attribute 'show-paren-match-face nil
;;                    :background nil :foreground nil
;;                    :underline "#ffff00" :weight 'extra-bold)

;; move pair paren
(global-set-key "]" 'match-paren)
(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
        (t (self-insert-command (or arg 1)))))

;; yes -> y
(defalias 'yes-or-no-p 'y-or-n-p)

;; uniquify buffer-name
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

;; remove beginning-of-buffer in message-buf
(defun previous-line (arg)
  (interactive "p")
  (condition-case nil
    (line-move (- arg))
    (beginning-of-buffer)))

;; remove end-of-buffer in message-buf
(defun next-line (arg)
  (interactive "p")
  (condition-case nil
    (line-move arg)
    (end-of-buffer)))

;; tramp config
(eval-after-load 'tramp
  '(vagrant-tramp-enable))
