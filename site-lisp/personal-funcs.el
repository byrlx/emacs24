;;    Artur Hefczyc sample, working .emacs file
;;    http://wttools.sf.net/
;;    (C) 2003, Artur Hefczyc
;;
;;    This library is free software; you can redistribute it and/or
;;    modify it under the terms of the GNU Lesser General Public
;;    License as published by the Free Software Foundation;
;;    version 2.1 of the License.
;;
;;    This library is distributed in the hope that it will be useful,
;;    but WITHOUT ANY WARRANTY; without even the implied warranty of
;;    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;;    Lesser General Public License for more details.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;    Some of stuuf stored here are created on my own and some
;;    were found on the Internet.
;;    I hope I don't break their authors permisions. If some one
;;    will find I do, please let me know.
;;    I also don't remember where I have found these functions and
;;    who is origin author. 
;;    I will try to complete these lack if possible.
;;
;; $Id: $

;;; I prefer to delete whole line regardless where cursor is
;;; Define function doing this
;;; Author: Artur Hefczyc
(defun kill-whole-line (arg)
  "Kill whole line regardless where kursor is"
  (interactive "p")
  (move-to-column 0) 
  (kill-line)
)
;;; Small but really nice and useful function inserting current
;;; date and time under cursor
;;; Is there any function doing this built-in emacs?
;;; Let me know if you know
;;; Author: Artur Hefczyc
(defun insert-current-time (arg)
  "Insert current time string at current position"
  (interactive "p")
  (insert (current-time-string)))

;;; Very useful function allowing to jump to matching parent
;;; Author: unknown yet
(defun match-paren (arg)
  "Go to the matching parenthesis if on parenthesis otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
	((looking-at "\\s\)") (forward-char 1) (backward-list 1))
	(t (self-insert-command (or arg 1)))))

;;; This is my own emacs color theme definition.
(defun my-color-theme ()
  "Color theme by Artur Hefczyc, created 2003-04-30."
  (interactive)
  (color-theme-install
   '(my-color-theme
     ((background-color . "grey15")
      (background-mode . dark)
      (border-color . "black")
      (cursor-color . "LightGoldenrod")
      (foreground-color . "limegreen")
      (mouse-color . "yellow"))
     (default 
       ((t (:stipple nil :background "grey15" :foreground "limegreen" 
                     :inverse-video nil :box nil :strike-through nil 
                     :overline nil :underline nil :slant normal 
                     :weight normal :height 98 :width normal 
                     :family "outline-courier new"))))
     (border ((t (:background "black"))))
     (comint-highlight-input ((t (:bold t :weight bold))))
     (comint-highlight-prompt ((t (:foreground "cyan"))))
     (cursor ((t (:background "LightGoldenrod"))))
     (custom-button-face 
      ((t (:background "lightgrey" :foreground "black" 
                       :box (:line-width 2 :style released-button)))))
     (custom-button-pressed-face 
      ((t (:background "lightgrey" :foreground "black" 
                       :box (:line-width 2 :style pressed-button)))))
     (custom-changed-face ((t (:background "blue" :foreground "white"))))
     (custom-comment-face ((t (:background "dim gray"))))
     (custom-comment-tag-face ((t (:foreground "gray80"))))
     (custom-documentation-face ((t (nil))))
     (custom-face-tag-face 
      ((t (:bold t :weight bold :height 1.2 :family "helv"))))
     (custom-group-tag-face 
      ((t (:bold t :foreground "light blue" 
                 :weight bold :height 1.2))))
     (custom-group-tag-face-1 
      ((t (:bold t :foreground "pink" :weight bold 
                 :height 1.2 :family "helv"))))
     (custom-invalid-face ((t (:background "red" :foreground "yellow"))))
     (custom-modified-face ((t (:background "blue" :foreground "white"))))
     (custom-rogue-face ((t (:background "black" :foreground "pink"))))
     (custom-saved-face ((t (:underline t))))
     (custom-set-face ((t (:background "gray15" :foreground "limegreen"))))
     (custom-state-face ((t (:foreground "lime green"))))
     (custom-variable-button-face ((t (:bold t :underline t :weight bold))))
     (custom-variable-tag-face 
      ((t (:bold t :foreground "light blue" 
                 :weight bold :height 1.2 :family "helv"))))
     (erc-action-face 
      ((t (:bold t :background "gray15" 
                 :foreground "lightyellow" :weight bold))))
     (erc-bold-face 
      ((t (:bold t :background "gray15" :foreground "gray77" :weight bold))))
     (erc-current-nick-face 
      ((t (:bold t :background "gray15" :foreground "lightblue" :weight bold))))
     (erc-dangerous-host-face ((t (:background "gray15" :foreground "red"))))
     (erc-default-face ((t (:background "Gray15" :foreground "gray77"))))
     (erc-direct-msg-face ((t (:background "gray15" :foreground "gray90"))))
     (erc-error-face ((t (:background "gray15" :foreground "red"))))
     (erc-fool-face ((t (:background "gray15" :foreground "gray40"))))
     (erc-input-face ((t (:background "gray15" :foreground "gray77"))))
     (erc-inverse-face ((t (:background "gray77" :foreground "Gray15"))))
     (erc-keyword-face 
      ((t (:bold t :background "gray15" 
                 :foreground "lightgreen" :weight bold))))
     (erc-nick-default-face 
      ((t (:bold t :background "gray15" :foreground "Magenta" :weight bold))))
     (erc-nick-msg-face 
      ((t (:bold t :background "gray15" :foreground "orange" :weight bold))))
     (erc-notice-face 
      ((t (:bold t :background "gray15" :foreground "lightBlue" :weight bold))))
     (erc-pal-face 
      ((t (:bold t :background "gray15" :foreground "white" :weight bold))))
     (erc-prompt-face 
      ((t (:bold t :background "lightBlue2" :foreground "Black" :weight bold))))
     (erc-timestamp-face 
      ((t (:bold t :background "gray15" :foreground "green" :weight bold))))
     (erc-underline-face 
      ((t (:background "gray15" :foreground "gray77" :underline t))))
     (extra-whitespace-face ((t (:background "pale green"))))
     (fixed-pitch ((t (:family "courier"))))
     (font-lock-builtin-face ((t (:foreground "LightSlateBlue"))))
     (font-lock-comment-face ((t (:foreground "lightgray"))))
     (font-lock-constant-face ((t (:foreground "yellow"))))
     (font-lock-doc-face ((t (:foreground "LightSalmon"))))
     (font-lock-function-name-face ((t (:foreground "greenyellow"))))
     (font-lock-keyword-face ((t (:foreground "DeepSkyBlue"))))
     (font-lock-string-face ((t (:foreground "LightGoldenrodYellow"))))
     (font-lock-type-face ((t (:foreground "cyan"))))
     (font-lock-variable-name-face ((t (:foreground "lightcyan"))))
     (font-lock-warning-face ((t (:bold t :foreground "Pink" :weight bold))))
     (fringe ((t (:background "grey10"))))
     (header-line ((t (:background "grey20" :foreground "grey90" :box nil))))
     (highlight ((t (:background "darkolivegreen"))))
     (jde-bug-breakpoint-cursor ((t (:background "brown" :foreground "cyan"))))
     (jde-db-active-breakpoint-face ((t (:background "red" :foreground "black"))))
     (jde-db-requested-breakpoint-face 
      ((t (:background "yellow" :foreground "black"))))
     (jde-db-spec-breakpoint-face ((t (:background "green" :foreground "black"))))
     (jde-java-font-lock-api-face ((t (:foreground "light goldenrod"))))
     (jde-java-font-lock-bold-face ((t (:bold t :weight bold))))
     (jde-java-font-lock-code-face ((t (nil))))
     (jde-java-font-lock-constant-face ((t (:foreground "Aquamarine"))))
     (jde-java-font-lock-doc-tag-face ((t (:foreground "light coral"))))
     (jde-java-font-lock-italic-face ((t (:italic t :slant italic))))
     (jde-java-font-lock-link-face 
      ((t (:foreground "blue" :underline t :slant normal))))
     (jde-java-font-lock-modifier-face ((t (:foreground "LightSteelBlue"))))
     (jde-java-font-lock-number-face ((t (:foreground "LightSalmon"))))
     (jde-java-font-lock-operator-face ((t (:foreground "medium blue"))))
     (jde-java-font-lock-package-face ((t (:foreground "steelblue1"))))
     (jde-java-font-lock-pre-face ((t (nil))))
     (jde-java-font-lock-underline-face ((t (:underline t))))
     (menu ((t (nil))))
     (mode-line 
      ((t (:background "grey75" :foreground "black" 
                       :box (:line-width -1 :style released-button)))))
     (mouse ((t (:background "yellow"))))
     (region ((t (:background "blue3"))))
     (scroll-bar ((t (nil))))
     (secondary-selection ((t (:background "SkyBlue4"))))
     (ecb-default-highlight-face ((t (:background "gray40" :height 1.0))))
     )))

;;; Order emacs to automaticaly save all IRC buffers when quiting
;;; Author: unknown yet
(defadvice save-buffers-kill-emacs (before save-logs (arg) activate)
  (save-some-buffers 
   t (lambda () 
       (when (and (eq major-mode 'erc-mode) (not (null buffer-file-name)))))))

;;; Remove characters not allowed for Windows file system
;;; and create short log file name containing channel name and
;;; current day date.
;;; Author: unknown yet with Artur Hefczyc modifications
(defun my-erc-generate-log-file-name-short (buffer &optional target
						   nick server port)
  "This function uses the buffer-name as a file, with some replacing."
  (let* ((name (buffer-name buffer))
	 (name (replace-regexp-in-string "|" "-" name)))
    (concat erc-log-channels-directory "/" 
	    name  "_" (format-time-string "%Y-%m-%d") ".txt")))

;;; Fast start on given server without any additional questions
;;; /join #geotools
;;; command is read from ~/.ercrc file, but how to do it
;;; without .ercrc file but explicity in erc-geotools function?
;;; Please let me know if you know how to set target channel name
;;; in .emacs file.
;;; Author: Artur Hefczyc
(defun erc-start-now ()
  "Start ERC client and log directly to default server without any questions."
  (interactive)
  (erc "irc.eu.freenode.net" 6667 "artur" erc-user-full-name t)
  )

;;; Generate colorized HTML version of erc-log with
;;; faces set for light background - prefered by many
;;; people color for web pages
;;; Author: Artur Hefczyc
(defun erc-colorize-log ()
  "Generate html log file with colorized content - light background scheme"
  (interactive)
  (set-foreground-color "gray1")
  (set-background-color "lightyellow")
  (custom-set-faces
   '(erc-action-face 
     ((t (:bold t :background "lightyellow" :foreground "gray1" :weight bold))))
   '(erc-bold-face 
     ((t (:bold t :background "lightyellow" :foreground "gray1" :weight bold))))
   '(erc-current-nick-face 
     ((t (:bold t :background "lightyellow" 
                :foreground "darkblue" :weight bold))))
   '(erc-dangerous-host-face ((t (:background "lightyellow" :foreground "red"))))
   '(erc-default-face ((t (:background "Lightyellow" :foreground "gray1"))))
   '(erc-direct-msg-face ((t (:background "lightyellow" :foreground "black"))))
   '(erc-error-face ((t (:background "lightyellow" :foreground "red"))))
   '(erc-fool-face ((t (:background "lightyellow" :foreground "gray60"))))
   '(erc-input-face ((t (:background "lightyellow" :foreground "gray1"))))
   '(erc-inverse-face ((t (:background "gray1" :foreground "Lightyellow"))))
   '(erc-keyword-face 
     ((t (:bold t :background "lightyellow" 
                :foreground "darkgreen" :weight bold))))
   '(erc-nick-default-face 
     ((t (:bold t :background "lightyellow" 
                :foreground "darkMagenta" :weight bold))))
   '(erc-nick-msg-face 
     ((t (:bold t :background "lightyellow" :foreground "brown" :weight bold))))
   '(erc-notice-face 
     ((t (:bold t :background "lightyellow" 
                :foreground "darkBlue" :weight bold))))
   '(erc-pal-face 
     ((t (:bold t :background "lightyellow" :foreground "black" :weight bold))))
   '(erc-prompt-face 
     ((t (:bold t :background "lightBlue2" :foreground "Black" :weight bold))))
   '(erc-timestamp-face 
     ((t (:bold t :background "lightyellow" 
                :foreground "darkgreen" :weight bold))))
   '(erc-underline-face 
     ((t (:background "lightyellow" :foreground "gray1" :underline t))))
   )
  (htmlize-buffer (current-buffer))
  (set-background-color "gray15")
  (set-foreground-color "limegreen")
  (custom-set-faces
   '(erc-action-face 
     ((t (:bold t :background "gray15" 
                :foreground "lightyellow" :weight bold))))
   '(erc-bold-face 
     ((t (:bold t :background "gray15" :foreground "gray77" :weight bold))))
   '(erc-current-nick-face 
     ((t (:bold t :background "gray15" :foreground "lightblue" :weight bold))))
   '(erc-dangerous-host-face ((t (:background "gray15" :foreground "red"))))
   '(erc-default-face ((t (:background "Gray15" :foreground "gray77"))))
   '(erc-direct-msg-face ((t (:background "gray15" :foreground "gray90"))))
   '(erc-error-face ((t (:background "gray15" :foreground "red"))))
   '(erc-fool-face ((t (:background "gray15" :foreground "gray40"))))
   '(erc-input-face ((t (:background "gray15" :foreground "gray77"))))
   '(erc-inverse-face ((t (:background "gray77" :foreground "Gray15"))))
   '(erc-keyword-face 
     ((t (:bold t :background "gray15" :foreground "lightgreen" :weight bold))))
   '(erc-nick-default-face 
     ((t (:bold t :background "gray15" :foreground "Magenta" :weight bold))))
   '(erc-nick-msg-face 
     ((t (:bold t :background "gray15" :foreground "orange" :weight bold))))
   '(erc-notice-face 
     ((t (:bold t :background "gray15" :foreground "lightBlue" :weight bold))))
   '(erc-pal-face 
     ((t (:bold t :background "gray15" :foreground "white" :weight bold))))
   '(erc-prompt-face 
     ((t (:bold t :background "lightBlue2" :foreground "Black" :weight bold))))
   '(erc-timestamp-face 
     ((t (:bold t :background "gray15" :foreground "green" :weight bold))))
   '(erc-underline-face 
     ((t (:background "gray15" :foreground "gray77" :underline t))))
   )
  )
