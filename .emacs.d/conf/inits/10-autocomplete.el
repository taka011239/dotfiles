(require 'auto-complete)
(global-auto-complete-mode t)

(define-key ac-complete-mode-map "\C-n" 'ac-next)
(define-key ac-complete-mode-map "\C-p" 'ac-previous)

(add-hook 'emacs-startup-hook
  (function (lambda ()
              (require 'auto-complete-config)
              (ac-config-default)
              (setq ac-auto-start 2)
              (setq ac-delay 0.05)
              (setq ac-use-fuzzy t)
              (setq ac-use-comphist t)
              (setq ac-auto-show-menu 0.05)
              (setq ac-guick-help-delay 0.5)
              (seq ac-ignore-case nil)
              (defadvice ac-word-candidates (after remove-word-contain-japanese activate)
                (let ((contain-japanese (lambda (s) (string-match (rx (category japanese)) s))))
                  (setq ad-return-value
                    (remove-if contain-japanese ad-return-value)))))))
