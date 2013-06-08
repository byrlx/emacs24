;;------------------------------------------------------------------------------
;;; Configuration for git in emacs
(add-to-list 'load-path "~/.emacs.d/git")
(require 'git-emacs)
(require 'dash)
(global-set-key (kbd "C-c m s") 'magit-status)
(global-set-key (kbd "C-c m l") 'magit-log)
