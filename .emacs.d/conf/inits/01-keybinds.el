;; C-h -> DEL
(keyboard-translate ?\C-h ?\C-?)

;; C-x C-p -> previous buffer
(global-set-key "\C-x\C-p" 'previous-buffer)

;; C-x C-n -> next buffer
(global-set-key "\C-x\C-n" 'next-buffer)

;; C-t -> change window
(global-set-key "\C-t" 'other-window)

;; M-g -> goto-line
(global-set-key "\M-g" 'goto-line)

;; M-down -> comment, M-up -> uncomment
;;(global-set-key [M-up] 'uncomment-region)
;;(global-set-key [M-down] 'comment-region)

;; auto-insert (, {, [, ", '
(global-set-key (kbd "(") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "{") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "[") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "\"") 'skeleton-pair-insert-maybe)
(setq skeleton-pair t)
