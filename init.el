;;; Vuong Nguyen ;;;

;; Are we running XEmacs or Emacs?
(defvar running-xemacs (string-match "XEmacs\\|Lucid" emacs-version))

;; Some simple macros to more easily tell if we're running GNUEmacs or XEmacs
;; taken from the .emacs of sukria@online.fr | http://sukria.online.fr
(defmacro GNUEmacs (&rest x)
  (list 'if (not running-xemacs) (cons 'progn x)))
(defmacro XEmacs (&rest x)
  (list 'if running-xemacs (cons 'progn x)))
(defmacro Xlaunch (&rest x)
  (list 'if (eq window-system 'x) (cons 'progn x)))

;;; My location for external packages.
(add-to-list 'load-path "~/.emacs.d/site-lisp")
;; Setup for keybinding
(load-file "~/.emacs.d/site-lisp/conf-kbd.el")
(load-file "~/.emacs.d/site-lisp/conf-emacs-stuff.el")
(load-file "~/.emacs.d/site-lisp/conf-emacs.el")

;;------------------------------------------------------------------------------
;;; Configuration:
;;; - Auto-complete & Auto-complete-clang
;;; - openwith.el --- Open files in file explorer-mode with external programs
;;; - Org-mode is a personal information management and outlining tool for Emacs
;;; - phpunil.el -- Interact with PHPUnit
;;; - ido-ubiquitous.el --- Use ido (nearly) everywhere.
;;; - anything.el
;;; - Autopair
;;; - recentf package
(load-file "~/.emacs.d/site-lisp/conf-utilities.el")

;;------------------------------------------------------------------------------
;;; Setup google-search
(load-file "~/.emacs.d/site-lisp/conf-google.el")

;;------------------------------------------------------------------------------
;;; ECB for loading speedbar
(load-file "~/.emacs.d/site-lisp/conf-ecb.el")

;;------------------------------------------------------------------------------
;;; Configure Outbound Mail
(load-file "~/.emacs.d/site-lisp/conf-mail.el")

;;------------------------------------------------------------------------------
;; Revive.el  saves current editing  status including  the window
;; splitting   configuration,   which   can't   be   recovered   by
;; `desktop.el' nor by `saveconf.el', into a file  and reconstructs
;; that status correctly.
(load-file "~/.emacs.d/site-lisp/conf-revive.el")

;;------------------------------------------------------------------------------
;;; Configuration for git in emacs
(load-file "~/.emacs.d/site-lisp/conf-git.el")

;;------------------------------------------------------------------------------
;;; Configuration package for emacs
(load-file "~/.emacs.d/site-lisp/conf-package.el")

;;------------------------------------------------------------------------------
;; Provide fast and easy way to access folder and buffers
;; (add-to-list 'load-path "~/.emacs.d/site-lisp/lusty-explorer")
;; (require 'lusty-explorer)
;; (global-set-key (kbd "C-c l f") 'lusty-file-explorer)
;; (global-set-key (kbd "C-c l b") 'lusty-buffer-explorer)



;;------------------------------------------------------------------------------
;;; Provide a powerful file explorer
(load-file "~/.emacs.d/site-lisp/conf-sunrise.el")

;;------------------------------------------------------------------------------
;;; Add different color for different delimiter ()))
(when (require 'rainbow-delimiters nil 'noerror) 
  (add-hook 'scheme-mode-hook 'rainbow-delimiters-mode))
(global-set-key (kbd "C-c M-r") 'rainbow-delimiters-mode)

;;-----------------------------------------------------------------------------
;;; Bongo is a flexible and usable media player for GNU Emacs.
(add-to-list 'load-path "~/.emacs.d/site-lisp/bongo")
(autoload 'bongo "bongo"
  "Start Bongo by switching to a Bongo buffer." t)

;;-----------------------------------------------------------------------------
;;; nXHTML - Emacs Utilities for Web 
;; (load "~/.emacs.d/site-lisp/nxhtml/autostart.el")
;; (setq mumamo-background-colors nil)

;;-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;; web-mode.el --- Web-mode environment for web development on emacs
(load-file "~/.emacs.d/site-lisp/conf-web-mode.el")
