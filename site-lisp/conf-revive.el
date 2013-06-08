;;------------------------------------------------------------------------------
;;;   Revive.el  saves current editing  status including  the window
;; splitting   configuration,   which   can't   be   recovered   by
;; `desktop.el' nor by `saveconf.el', into a file  and reconstructs
;; that status correctly.
(autoload 'save-current-configuration "revive" "Save status" t)
(autoload 'resume "revive" "Resume Emacs" t)
(autoload 'wipe "revive" "Wipe Emacs" t)
(global-set-key (kbd "C-c C-o") 'save-current-configuration)
(global-set-key (kbd "C-c C-p") 'resume)
