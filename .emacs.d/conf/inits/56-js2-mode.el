(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'interpreter-mode-alist '("node" . js2-mode))
;; (add-to-list 'auto-mode-alist '("\\.jsx\\'" . js2-jsx-mode))
;; (flycheck-add-mode 'javascript-eslint 'js2-jsx-mode)
;; (add-hook 'js2-jsx-mode-hook 'flycheck-mode)
(add-hook 'js2-mode-hook
          (lambda ()
            (setq js2-basic-offset 2)
            (set (make-local-variable 'js2-indent-switch-body) t)
            ))

(add-hook 'js2-mode-hook 'ac-js2-mode)
