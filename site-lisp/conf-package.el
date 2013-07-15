;(require 'package)
;(package-initialize)
;(add-to-list 'package-archives 
;				 '("melpa" . "http://melpa.milkbox.net/packages/")
;				 'APPEND)

(require 'package)
(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

(setq package-archives '(("ELPA" . "http://tromey.com/elpa/") 
								 ("gnu" . "http://elpa.gnu.org/packages/")
								 ("marmalade" . "http://marmalade-repo.org/packages/")))
(load "~/.emacs.d/site-lisp/icicles-install")
(add-to-list 'load-path "~/.emacs.d/site-lisp/icicles")
													 ;(require 'icicles)
													 ;(icicle-mode 1)
