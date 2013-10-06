;;------------------------------------------------------------------------------
;;; Full-screen on startup
(defun toggle-fullscreen ()
  (interactive)
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
								 '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
								 '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0))
  )
(toggle-fullscreen)

;;------------------------------------------------------------------------------
;; emacs 23 accept these settings to change themes
;; (load-theme 'darkclean.el)
;; (load-theme 'solarized-dark.el)
;; (load-theme 'solarized-light.el)



;; This is configuration for Emacs 24
;; =========================================================================================================================================================================
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector (vector "#839496" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#002b36"))
 '(bongo-enabled-backends (quote (mpg123 vlc mplayer ogg123 speexdec timidity mikmod)))
 '(custom-safe-themes (quote ("fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" (default))))
 '(custom-theme-directory "~/.emacs.d/themes")
 '(custom-theme-load-path (quote ("~/.emacs.d/themes/emacs-color-theme-solarized" custom-theme-directory t)))
 '(ecb-compile-window-height 10)
;; '(ecb-layout-name "leftright2")
;; '(ecb-layout-window-sizes (quote (("leftright2" (ecb-directories-buffer-name 0.1 . 0.5625) (ecb-sources-buffer-name 0.1 . 0.4166666666666667) (ecb-methods-buffer-name 0.16666666666666666 . 0.5625) (ecb-history-buffer-name 0.16666666666666666 . 0.4166666666666667)))))
 '(ecb-layout-name "left13")
 '(ecb-layout-window-sizes (quote (("left13" (ecb-directories-buffer-name  0.2 . 0.5625)))))

 '(ecb-compile-window-height nil)
 '(ecb-options-version "2.40")
 '(ecb-primary-secondary-mouse-buttons (quote mouse-1--C-mouse-1))
 '(ecb-source-path (quote ("/home/vuongnguyen/Workspace" "/home/vuongnguyen/Emacs/site-lisp" "/home/vuongnguyen/Workspace/Rails_Apps/first_app")))
 '(ecb-tip-of-the-day nil)
 '(ecb-tree-buffer-style (quote ascii-guides))
 '(fci-rule-color "#073642")
 '(icicle-region-background "dark red")
 '(inhibit-startup-screen t)
 '(ns-function-modifier (quote control))
 '(openwith-associations (quote (("\\.pdf\\'" "evince" (file)) ("\\.\\(?:xls?x\\|doc\\|docx\\|rtf\\|ppt\\|pptx\\)\\'" "libreoffice4.0" (file)) ("\\.\\(?:mpe?g\\|avi\\|wmv\\|mp4\\|mkv\\)\\'" "smplayer" (file)) ("\\.\\(?:mp3\\|wma\\|flac\\|mov\\|ape\\|m4a\\)\\'" "smplayer" (file)) ("\\.\\(?:jp?g\\|png\\)\\'" "shotwell" (file)))))
 '(openwith-confirm-invocation nil)
 '(sr-windows-default-ratio 66)
 '(tree-widget-image-enable t)
 '(warning-minimum-level :error))

(setq ido-decorations '("\n=> " "" "\n" "" "[" "]" " [No match]" " [Matched]" " [Not readable]" " [Too big]" " [Confirm]"))

;; Theming selection for Emacs 24
													 ;(load-theme 'darkclean)
													 ;(load-theme 'sanityinc-solarized-dark)
													 ;(load-theme 'sanityinc-solarized-light)
(load-theme 'solarized-dark)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(sr-active-path-face ((t (:background "dim gray" :foreground "white" :weight bold :height 130))))
 '(sr-highlight-path-face ((t nil)))
 '(sr-passive-path-face ((t (:background "dim gray" :foreground "dark gray" :weight bold :height 130)))))

