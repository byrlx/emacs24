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

;;; Setup initial emacs frames (windows) location and size
;; (setq default-frame-alist
  ;;    '((wait-for-wm . nil)
;;	(top . 0) (left . 0)
;;	(width . 85) (height . 40)
;;	(background-color . "gray15")
;;	(foreground-color . "limegreen")
;;	(cursor-color . "LightGoldenrod")
;;	(mouse-color . "yellow")
  ;;      )) 

;;; My location for external packages.
(add-to-list 'load-path "~/.emacs.d/site-lisp")


;;------------------------------------------------------------------------------
;;; Unbinding Mouse click
(dolist (k '([mouse-1] [down-mouse-1] [drag-mouse-1] [double-mouse-1] [triple-mouse-1]  
             [mouse-2] [down-mouse-2] [drag-mouse-2] [double-mouse-2] [triple-mouse-2]
             [mouse-3] [down-mouse-3] [drag-mouse-3] [double-mouse-3] [triple-mouse-3]
             [mouse-4] [down-mouse-4] [drag-mouse-4] [double-mouse-4] [triple-mouse-4]
             [mouse-5] [down-mouse-5] [drag-mouse-5] [double-mouse-5] [triple-mouse-5]
		 [left] [right] [up] [down] [C-down-mouse-3]))
  (global-unset-key k)) 
(global-unset-key (kbd "<C-down-mouse-1>"))
(defalias 'yes-or-no-p 'y-or-n-p)
(global-linum-mode 1) 
(scroll-bar-mode 0) ; Disable scroll bar mode

;; Global set key
(global-set-key (kbd "<C-tab>") 'other-window)
(global-set-key (kbd "M-k") 'kill-this-buffer) ; Kill the current buffer
(global-set-key (kbd "C-x C-e") 'eval-buffer)

(menu-bar-mode 0) ; Toggle the Menu Bar  
(tool-bar-mode 0) ; Toggle the Tool bar
(setq make-backup-files nil) ; stop creating those backup~ files
(setq auto-save-default nil) ; stop creating those #autosave# files

;; Save from the last session
(desktop-save-mode 1)
(setq large-file-warning-threshold nil) ; Disable message "File XXX is really big, really wants to open it"


;;------------------------------------------------------------------------------
;;; Set tab width
(require 'cc-mode)
(setq-default c-basic-offset 6
tab-width 6
indent-tabs-mode t
c-default-style "linux") ;;;automatic indentation

;;------------------------------------------------------------------------------
;;; Excellent package for better scrolling in emacs
;;; should be default package. But now it can be downloaded
;;; from: http://user.it.uu.se/~mic/pager.el
(require 'pager)
(global-set-key (kbd "M-[") 'pager-row-up)
(global-set-key (kbd "M-]") 'pager-row-down)



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



;;------------------------------------------------------------------------------
;; Setup google-search
(require 'google-this)
(google-this-mode 1)
(global-set-key (kbd "C-x t g") 'google-search)

;;; First load personal-funcs.el with custum functions set
;;; and personal parameters.
;;; You can find this file if necessary at address:
;;; http://wttools.sourceforge.net/emacs-stuff/personal-funcs.html
;;; or download emacs lisp file from CVS repository:
;;; http://cvs.sourceforge.net/cgi-bin/viewcvs.cgi/*checkout*/wttools/wttools/emacs-stuff/personal-funcs.el?rev=HEAD&content-type=text/plain

(load-file "~/.emacs.d/site-lisp/personal-funcs.el")

;;------------------------------------------------------------------------------
;;; ECB for loading speedbar
(add-to-list 'load-path "~/.emacs.d/ecb")
;(load-file "~/.emacs.d/ecb/ecb.el")
(require 'ecb)
(require 'ecb-autoloads)
(setq stack-trace-on-error t)
(global-set-key (kbd "C-'") 'ecb-hide-ecb-windows)
(global-set-key (kbd "C-;") 'ecb-show-ecb-windows)
(global-set-key (kbd "C-x C-'") 'ecb-activate)
(global-set-key (kbd "C-x C-;") 'ecb-deactivate)
;;; Sr SpeedBar is the mod of SpeedBar
(require 'sr-speedbar)
(global-set-key (kbd "C-c q") 'sr-speedbar-open)
(global-set-key (kbd "C-c w") 'sr-speedbar-close)

;;------------------------------------------------------------------------------
;;; Configure Outbound Mail
;;Tell the program who you are

(setq user-full-name "Vuong Nguyen")
(setq user-mail-address "vuongnguyen1909@gmail.com")

;;Tell Emacs to use GNUTLS instead of STARTTLS
;;to authenticate when sending mail.

(setq starttls-use-gnutls t)

;;Tell Emacs about your mail server and credentials

(setq send-mail-function 'smtpmail-send-it
message-send-mail-function 'smtpmail-send-it
smtpmail-starttls-credentials
'(("smtp.gmail.com" 587 nil nil))
smtpmail-auth-credentials
(expand-file-name "~/.emacs.d/site-lisp/.authinfo")
smtpmail-default-smtp-server "smtp.gmail.com"
smtpmail-smtp-server "smtp.gmail.com"
smtpmail-smtp-service 587
smtpmail-debug-info t)
(require 'smtpmail)

;;------------------------------------------------------------------------------
;;;   Revive.el  saves current editing  status including  the window
;; splitting   configuration,   which   can't   be   recovered   by
;; `desktop.el' nor by `saveconf.el', into a file  and reconstructs
;; that status correctly.
(autoload 'save-current-configuration "revive" "Save status" t)
(autoload 'resume "revive" "Resume Emacs" t)
(autoload 'wipe "revive" "Wipe Emacs" t)
(global-set-key (kbd "M-s M-s") 'save-current-configuration)
(global-set-key (kbd "M-s M-r") 'resume)


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
;;; Configuration for git in emacs
(add-to-list 'load-path "~/.emacs.d/git")
(require 'git-emacs)
(require 'dash)


;;------------------------------------------------------------------------------
;;; Autopair in emacs
(add-to-list 'load-path "~/.emacs.d/site-lisp/flex-autopair")
(require 'flex-autopair)
(flex-autopair-mode 1)


;;------------------------------------------------------------------------------
(require 'package)
(package-initialize)
(add-to-list 'package-archives 
		 '("melpa" . "http://melpa.milkbox.net/packages/")
		 'APPEND)

(setq package-archives '(("ELPA" . "http://tromey.com/elpa/") 
                          ("gnu" . "http://elpa.gnu.org/packages/")
                          ("marmalade" . "http://marmalade-repo.org/packages/")))
;;(load "~/.emacs.d/site-lisp/icicles-install")
;;(add-to-list 'load-path "~/.emacs.d/site-lisp/icicles")
;;(require 'icicles)
;;(icicle-mode 1)


;;------------------------------------------------------------------------------
;;; Windows Switching
;; (pc-selection-mode 1)
;; (windmove-default-keybindings 'meta)
(global-set-key [M-left] 'windmove-left)          ; move to left windnow
(global-set-key [M-right] 'windmove-right)        ; move to right window
(global-set-key [M-up] 'windmove-up)              ; move to upper window
(global-set-key [M-down] 'windmove-down)          ; move to downer wind

;;------------------------------------------------------------------------------
;;; Find file faster with the recent package
(require 'recentf)
;; get rid of `find-file-read-only' and replace it with something
;; more useful.
(global-set-key (kbd "C-x C-r") 'ido-recentf-open)
;; enable recent files mode.
(recentf-mode t)
; 5 files ought to be enough.
(setq recentf-max-saved-items 4)
(defun ido-recentf-open ()
  "Use `ido-completing-read' to \\[find-file] a recent file"
  (interactive)
  (if (find-file (ido-completing-read "Recent files: " recentf-list))
      (message "Opening file...")
    (message "Aborting")))

;;------------------------------------------------------------------------------
;; (add-to-list 'load-path
;;		 "~/.emacs.d/site-lisp/yasnippet")
;; (require 'yasnippet)
;; (yas/global-mode 1)



;;------------------------------------------------------------------------------
;;; Provide fast and easy way to access folder and buffers
(add-to-list 'load-path
		 "~/.emacs.d/site-lisp/lusty-explorer")
(require 'lusty-explorer)
(global-set-key (kbd "C-c l") 'lusty-file-explorer)
(global-set-key (kbd "C-x b") 'lusty-buffer-explorer)



;;------------------------------------------------------------------------------
;;; Provide a powerful file explorer
(add-to-list 'load-path
		 "~/.emacs.d/site-lisp/sunrise-commander")
(require 'sunrise-commander)
(require 'sunrise-x-popviewer)
(require 'sunrise-x-tree)
(global-set-key (kbd "C-c e") 'sunrise-cd)


;;------------------------------------------------------------------------------
;;; Add different color for different delimiter ()))
(when (require 'rainbow-delimiters nil 'noerror) 
  (add-hook 'scheme-mode-hook 'rainbow-delimiters-mode))
(global-set-key (kbd "C-c M-r") 'rainbow-delimiters-mode)

;;------------------------------------------------------------------------------
;;; Open current file editing with external programs
(defun prelude-open-with ()
  "Simple function that allows us to open the underlying
file of a buffer in an external program."
  (interactive)
  (when buffer-file-name
    (shell-command (concat
                    (if (eq system-type 'darwin)
                        "open"
                      (read-shell-command "Open current file with: "))
                    " "
                    buffer-file-name)))
)
(global-set-key (kbd "C-c o") 'prelude-open-with)


;;------------------------------------------------------------------------------
;; emacs 23 accept these settings to change themes
;; (load-theme 'darkclean.el)
;; (load-theme 'solarized-dark.el)
;; (load-theme 'solarized-light.el)



;; From now on is for emacs 24
;; =========================================================================================================================================================================
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector (vector "#839496" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#002b36"))
 '(custom-safe-themes (quote ("cd897b5508b62ac507ac961764b7a2c643824bf49875abdab97f7a5a3097234c" (default))))
 '(custom-theme-directory "~/.emacs.d/themes")
 '(ecb-layout-name "left14")
 '(ecb-layout-window-sizes (quote (("left14" (ecb-directories-buffer-name 0.22857142857142856 . 0.717391304347826) (ecb-history-buffer-name 0.22857142857142856 . 0.2608695652173913)))))
 '(ecb-options-version "2.40")
 '(ecb-primary-secondary-mouse-buttons (quote mouse-1--C-mouse-1))
 '(ecb-source-path (quote (("/home/vuongnguyen" "vuongnguyen") "/home/vuongnguyen")))
 '(ecb-tip-of-the-day nil)
 '(ecb-tree-buffer-style (quote ascii-guides))
 '(fci-rule-color "#073642")
 '(inhibit-startup-screen t)
 '(openwith-associations (quote (("\\.pdf\\'" "evince" (file)) ("\\.\\(?:xls?x\\|doc\\|docx\\|rtf\\|ppt\\|pptx\\)\\'" "soffice" (file)) ("\\.\\(?:mpe?g\\|avi\\|wmv\\|mp4\\|mkv\\|mp3\\|wma\\|flac\\|mov\\|ape\\|m4a\\)\\'" "vlc" (file)) ("\\.\\(?:jp?g\\|png\\)\\'" "eog" (file)))))
 '(openwith-confirm-invocation nil)
 '(sr-windows-default-ratio 66)
 '(tree-widget-image-enable t))
(load-theme 'darkclean)
;;(load-theme 'sanityinc-solarized-dark)


;;------------------------------------------------------------------------------
;;; openwith.el --- Open files in file explorer-mode with external programs
(require 'openwith)
(openwith-mode t)

;;-----------------------------------------------------------------------------
;;; web-mode.el --- Web-mode environment for web development on emacs
(require 'web-mode) 
(setq auto-mode-alist (cons '("\\.php$" . web-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.aspx$" . web-mode) auto-mode-alist))
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode)) 
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode)) 
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode)) 
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode)) 
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(defun web-mode-hook () "Hooks for Web mode." (setq web-mode-markup-indent-offset 3)) 
(add-hook 'web-mode-hook 'web-mode-hook)
(setq web-mode-markup-indent-offset 3)
(setq web-mode-css-indent-offset 3)
(setq web-mode-code-indent-offset 3)
(set-face-attribute 'web-mode-css-rule-face nil :foreground "Pink3")
(add-to-list 'web-mode-snippets '("div" "<div>" "</div>"))
(add-to-list 'web-mode-snippets '("span" "<span>" "</span>"))
(add-to-list 'web-mode-snippets '("html" "<html>" "</html>"))
(add-to-list 'web-mode-snippets '("p" "<p>" "</p>"))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(sr-active-path-face ((t (:background "dim gray" :foreground "white" :weight bold :height 130))))
 '(sr-passive-path-face ((t (:background "dim gray" :foreground "dark gray" :weight bold :height 130)))))

