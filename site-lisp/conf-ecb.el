;;------------------------------------------------------------------------------------------------------------------------------------------------------------
;; Load CEDET.
(load-file "~/.emacs.d/cedet-1.1/common/cedet.el")
(global-ede-mode 1)
(semantic-load-enable-minimum-features)
(semantic-load-enable-code-helpers)

;;------------------------------------------------------------------------------
;;; ECB for loading speedbar
(add-to-list 'load-path "~/.emacs.d/ecb")													 
(require 'ecb)
;(require 'ecb-autoloads)
(setq stack-trace-on-error t)
(global-set-key (kbd "C-'") 'ecb-hide-ecb-windows)
(global-set-key (kbd "C-;") 'ecb-show-ecb-windows)
(global-set-key (kbd "C-x C-'") 'ecb-activate)
(global-set-key (kbd "C-x C-;") 'ecb-deactivate)
;;; Sr SpeedBar is the mod of SpeedBar
(require 'sr-speedbar)
(global-set-key (kbd "C-c q") 'sr-speedbar-open)
(global-set-key (kbd "C-c w") 'sr-speedbar-close)
