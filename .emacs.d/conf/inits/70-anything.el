(when (require 'anything nil t)
  (setq
    ;; 候補を表示するまでの時間 default=0.5
    anything-idle-delay 0.3
    ;; タイプして再描写するまでの時間 defalut=0.1
    anything-input-idle-delay 0.2
    ;; 候補の最大表示数 default=50
    anything-candidate-number-limit 100
    ;; 候補が多いときに体感速度を早くする
    anything-quick-update t
    ;; 候補選択ショートカットをalphabetに
    anything-enable-shortcuts 'alphabet)

  (when (require 'anything-config nil t)
    ;; root権限でアクションを実行するときのコマンド
    ;; default=su
    (setq anything-su-or-sudo "sudo"))

  (require 'anything-match-plugin nil t)

  (when (and (executable-find "cmigemo")
             (require 'migemo nil t))
    (require 'anything-migemo nil t))

  (when (require 'anything-complete nil t)
    ;; lispシンボルの補完候補の再検索時間
    (anything-lisp-complete-symbol-set-timer 150))

  (require 'anything-show-completion nil t)

;;  (when (require 'auto-install nil t)
;;    (require 'anything-auto-install nil t))

  (when (require 'descbinds-anything nil t)
    ;; describe-bindingsをanythingに置き換える
    (descbinds-anything-install))

  (global-set-key (kbd "M-y") 'anything-show-kill-ring)
  (global-set-key (kbd "C-x C-b") 'anything-for-files)

  (when (require 'anything-c-moccur nil t)
    (setq
     anything-c-moccur-anything-idle-delay 0.1
     anything-c-moccur-higligt-info-line-flag t
     anything-c-moccur-enable-auto-look-flag t
     anything-c-moccur-enable-initial-pattern t)
    (global-set-key (kbd "C-M-o") 'anything-c-moccur-occur-by-moccur)))
