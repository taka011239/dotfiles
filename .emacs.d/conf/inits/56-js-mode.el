(defun js-indent-hook ()
  ;; indent width 2
  (setq js-indent-level 2
	js-expr-indent-offset 2
	indent-tabs-mode nil)
  ;; switch case indent
  (defun my-js-indent-line ()
    (interactive)
    (let* ((parse-status (save-excursion (syntax-ppss (point-at-bol))))
	   (offset (- (current-column) (current-indentation)))
	   (indentation (js--proper-indentation parse-status)))
      (back-to-indentation)
      (if (looking-at "case\\s-")
	  (indent-line-to (+ indentation 2))
	(js-indent-line))
      (when (> offset 0) (forward-char offset))))
  (set (make-local-variable 'indent-line-function) 'my-js-indent-line)
)

(add-hook 'js-mode-hook 'js-indent-hook)
(add-hook 'js-mode-hook (lambda ()
                          (require 'flymake-jshint)
                          (flymake-jshint-load)))
