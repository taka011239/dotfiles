(autoload 'flymake-mode "flymake" "" t)

;; hllight, don't use underline
(custom-set-faces
  '(flymake-errline
     ((((class color))
          (:underline nil :background "red4"))))
  '(flymake-warnline
     ((((class color))
          (:underline nil :background "yellow4"))))
  '(flymake-) )

(defun my-flymake-show-next-error()
  (interactive)
  (flymake-goto-next-error)
  (flymake-display-err-menu-for-current-line))

(defun my-flymake-show-prev-error()
  (interactive)
  (flymake-goto-prev-error)
  (flymake-display-err-menu-for-current-line))

(global-set-key "\C-c\C-s" 'flymake-mode)
(global-set-key "\C-c\C-f" 'flymake-start-syntax-check)
(global-set-key "\C-c\C-p" 'my-flymake-show-prev-error)
(global-set-key "\C-c\C-n" 'my-flymake-show-next-error)
