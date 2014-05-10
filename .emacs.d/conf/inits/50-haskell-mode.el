;; http://www.haskell.org/haskellwiki/Emacs
(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-debug "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init) (flymake-mode)))

(add-hook 'haskell-mode-hook '(lambda ()
  (ghc-init)
    (local-set-key "\C-j" (lambda () (interactive) (insert " -> ")))
    (local-set-key "\M-j" (lambda () (interactive) (insert " => ")))
    (local-set-key "\C-l" (lambda () (interactive) (insert " <- ")))
    (local-set-key (kbd "=") (smartchr '(" = " " /= " " == " "=")))
    (local-set-key (kbd "$") (smartchr '(" $ " " <$> " "$")))
    (local-set-key (kbd "+") (smartchr '(" + " " ++ " "+")))
    (local-set-key (kbd "-") (smartchr '(" - " "-")))
    (local-set-key (kbd "*") (smartchr '(" * " "*" "<*>")))
    (local-set-key (kbd ".") (smartchr '("." " . ")))
    (local-set-key (kbd "|") (smartchr '("|" " | ")))
    (local-set-key (kbd ":") (smartchr '(":" " :: " " : ")))
))

(defadvice inferior-haskell-load-file (after change-focus-after-load)
  "Change focus to GHCi window after C-c C-l command"
  (other-window 1))
(ad-activate 'inferior-haskell-load-file)

(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)

(autoload 'haskell-mode "haskell-mode" nil t)

;; haskell-cmd associate haskell-mode
(add-to-list 'interpreter-mode-alist '("runghc" . haskell-mode))
(add-to-list 'interpreter-mode-alist '("runhaskell" . haskell-mode))
