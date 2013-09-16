(require 'whitespace)
(setq whitespace-style '(face
                         trailing
                         tab-mark
                         spaces
                         space-mark))

(setq whitespace-display-mappings
  '((space-mark ?\u3000 [?\u25a1] [?_ ?_])
    ;; WARNING: the mapping below has a problem.
    ;; When a TAB occupies exactly one column, it will display the
    ;; character ?\xBB at that column followed by a TAB which goes to
    ;; the next TAB column.
    ;; If this is a problem for you, please, comment the line below.
    (tab-mark ?\t [?\xBB ?\t] [?\\ ?\t])))

(setq whitespace-space-regexp "\\(\u3000+\\)")
(set-face-foreground 'whitespace-space "cyan")
(set-face-background 'whitespace-space 'nil)
(setq whitespace-action '(auto-cleanup))
(set-default 'global-whitespace-mode 0)
(global-set-key (kbd "C-x w") 'global-whitespace-mode)
