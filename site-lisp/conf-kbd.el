;;------------------------------------------------------------------------------
;;; Windows Switching
;; (pc-selection-mode 1)
;; (windmove-default-keybindings 'meta)
(global-set-key [M-left] 'windmove-left)          ; move to left windnow
(global-set-key [M-right] 'windmove-right)        ; move to right window
(global-set-key [M-up] 'windmove-up)              ; move to upper window
(global-set-key [M-down] 'windmove-down)          ; move to downer wind

;;------------------------------------------------------------------------------
;;; Excellent package for better scrolling in emacs
;;; should be default package. But now it can be downloaded
;;; from: http://user.it.uu.se/~mic/pager.el
(require 'pager)
(global-set-key (kbd "M-p") 'pager-row-up)
(global-set-key (kbd "M-n") 'pager-row-down)
(global-set-key (kbd "M-P") 'backward-paragraph)
(global-set-key (kbd "M-N") 'forward-paragraph)

;; Global set key
(global-set-key (kbd "<C-tab>") 'other-window)
(global-set-key (kbd "M-k") 'kill-this-buffer) ; Kill the current buffer
(global-set-key (kbd "C-x C-e") 'eval-buffer)
(global-set-key (kbd "C-c =") 'imenu)
(menu-bar-mode 0) ; Toggle the Menu Bar  
(tool-bar-mode 0) ; Toggle the Tool bar
(setq make-backup-files nil) ; stop creating those backup~ files
(setq auto-save-default nil) ; stop creating those #autosave# files

;;------------------------------------------------------------------------------
;;; Unbinding Mouse click and 4-arrow buttons
;; (dolist (k '([mouse-1] [down-mouse-1] [drag-mouse-1] [double-mouse-1] [triple-mouse-1]  
;;              [mouse-2] [down-mouse-2] [drag-mouse-2] [double-mouse-2] [triple-mouse-2]
;;              [mouse-3] [down-mouse-3] [drag-mouse-3] [double-mouse-3] [triple-mouse-3]
;;              [mouse-4] [down-mouse-4] [drag-mouse-4] [double-mouse-4] [triple-mouse-4]
;;              [mouse-5] [down-mouse-5] [drag-mouse-5] [double-mouse-5] [triple-mouse-5]
;; 				 [left] [right] [up] [down] [C-down-mouse-3]))
;;   (global-unset-key k)) 
;; (global-unset-key (kbd "<C-down-mouse-1>"))
