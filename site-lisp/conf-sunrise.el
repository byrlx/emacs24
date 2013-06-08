;;------------------------------------------------------------------------------
;;; Provide a powerful file explorer
(add-to-list 'load-path
				 "~/.emacs.d/site-lisp/sunrise-commander")
(require 'sunrise-commander)
(require 'sunrise-x-popviewer)
(require 'sunrise-x-tree)

(global-set-key (kbd "C-c e") 'sunrise-cd)
