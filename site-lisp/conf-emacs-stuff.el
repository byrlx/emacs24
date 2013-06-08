;;; First load personal-funcs.el with custum functions set
;;; and personal parameters.
;;; You can find this file if necessary at address:
;;; http://wttools.sourceforge.net/emacs-stuff/personal-funcs.html
;;; or download emacs lisp file from CVS repository:
;;; http://cvs.sourceforge.net/cgi-bin/viewcvs.cgi/*checkout*/wttools/wttools/emacs-stuff/personal-funcs.el?rev=HEAD&content-type=text/plain

(load-file "~/.emacs.d/site-lisp/personal-funcs.el")


;;; Display Time
(setq display-time-format "%H:%M")
(display-time)
(setq message-log-max t)
(defalias 'yes-or-no-p 'y-or-n-p)
(global-linum-mode 1) 
(scroll-bar-mode 0) ; Disable scroll bar mode

;; Save from the last session
(desktop-save-mode 1)
(setq large-file-warning-threshold nil) ; Disable message "File XXX is really big, really wants to open it"

;;------------------------------------------------------------------------------
;;; Set tab width
(require 'cc-mode)
(setq-default c-basic-offset 3
				  tab-width 3
				  indent-tabs-mode t
				  c-default-style "linux") ;;;automatic indentation


;;------------------------------------------------------------------------------
;;;; Parens ;;;;
;;; mic-paren.el is available at:
;;; http://www.docs.uu.se/~mic/emacs.shtml
(require 'mic-paren) ; loading 
(paren-activate)    ; activating
;;; cparen.el is available at:
;;; http://www.hut.fi/u/rsaikkon/software/elisp/cparen.el
(require 'cparen)
(cparen-activate)
(show-paren-mode t)
;;;; /Parens ;;;;

;;;; Libraries ;;;;
;;; Last found version of htmlize.el 
;;; http://fly.srk.fer.hr/~hniksic/emacs/htmlize.el
(require 'htmlize)
