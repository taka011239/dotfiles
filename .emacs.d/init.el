;; Prior to Emacs 23, user-emacs-directory is not defined
(when (< emacs-major-version 23)
  (defvar user-emacs-directory "~/.emacs.d/"))

;; LOADPATH
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory (expand-file-name (concat user-emacs-directory path))))
        (add-to-list 'load-path default-directory)
          (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
              (normal-top-level-add-subdirs-to-load-path))))))

(add-to-load-path "public" "el-get")

;; ELISP PACKAGE
;; configure package.el (emacs < 24 require package.el)

(when (require 'package nil t)

;; MELPA
;; (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
;; Marmalade
;; (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)

;; Only MELPA
  (setq package-archives (list '("melpa" . "http://melpa.milkbox.net/packages/")))

  (package-initialize)

;; note: if installed pkg using package.el, then describ here
  (setq my-packages
    '(auto-complete
      gh
      ghc
      gist
      git-commit-mode
      git-rebase-mode
      go-autocomplete
      go-mode
      haskell-mode
      helm
      init-loader
      logito
      magit
      migemo
      pcache
      popup
      redo+
      ))
  (require 'cl)
  (mapcar (lambda (x)
            (when (not (package-installed-p x))
              (package-install x)))
            my-packages)
)

;; configure el-get
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
    (url-retrieve-synchronously
      "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch)
      (goto-char (point-max))
      (eval-print-last-sexp))))

(el-get 'sync)

(add-to-list 'el-get-recipe-path
             (concat (file-name-directory load-file-name) "/el-get/recipes"))
(add-to-list 'el-get-recipe-path "~/.emacs.d/conf/el-get/local-recipes")

;; INIT-LOADER
(require 'init-loader)
(setq init-loader-show-log-after-init nil)
(init-loader-load "~/.emacs.d/conf/inits")
