(require 'ucs-normalize)
(setq file-name-coding-system 'utf-8-hfs)
(setq locale-coding-system 'utf-8-hfs)

;; if emacs is cocoa, must set $PATH
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize)
  (global-whitespace-mode t))

;; change font Ritcy
(set-frame-font "Ritcy-15")

(if window-system
      (set-frame-size (selected-frame) 140 50))

;; ascii font
;;(set-face-attribute 'default nil
;;                               :family "ritcy"
;;                               :height 160)

;; japanese font
(set-fontset-font
  nil 'japanese-jisx0208
  (font-spec :family "Hiragino Mincho Pro"))

;; En : Em = 1 : 2
;;(setq face-font-rescale-alist
;;  '((".*Hiragino_Mincho_pro.*" . 1.2)))
