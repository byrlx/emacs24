;;------------------------------------------------------------------------------
;;; openwith.el --- Open files in file explorer-mode with external programs
(require 'openwith)
(openwith-mode t)

;;------------------------------------------------------------------------------
;;; Auto-complete-mode + Auto-complete-clang

(add-to-list 'load-path
				 "~/.emacs.d/site-lisp/yasnippet")
(require 'yasnippet)
(yas/global-mode 1)
;; default TAB key is occupied by auto-complete
(global-set-key (kbd "C-c k") 'yas/expand)

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/site-lisp/ac-dict")
(ac-config-default)
(ac-set-trigger-key "<tab>")
(global-auto-complete-mode t)

(add-to-list 'load-path "~/.emacs.d/site-lisp/auto-complete-clang")	;add it to load-path
(require 'auto-complete-clang)
(setq clang-completion-suppress-error 't)
(global-set-key (kbd "<backtab>") 'ac-complete-clang)


;;--------------------------------------------------------------------
;;; Org-mode is a personal information management and outlining tool for Emacs
(add-to-list 'load-path "~/.emacs.d/org-mode")
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(setq org-agenda-files (list "~/org/work.org"
                             "~/org/school.org" 
                             "~/org/home.org"))

;;-----------------------------------------------------------------------------
;;; phpunil.el -- Interact with PHPUnit
(require 'phpunit)

;;-----------------------------------------------------------------------------
;;; ido-ubiquitous.el --- Use ido (nearly) everywhere.
(ido-mode '1)
(require 'ido-ubiquitous)
(require 'smex) ; Not needed if you use package.el
(smex-initialize) ; Can be omitted. This might cause a (minimal) delay
													 ; when Smex is auto-initialized on its first run.
(ido-ubiquitous-mode)

;;-----------------------------------------------------------------------------
;;; anything.el is a great application framework written by TamasPatrovics. It provides a totally new Emacs experience.
(require 'anything)
(require 'anything-match-plugin)
(require 'anything-config)

;;------------------------------------------------------------------------------
;;; Autopair in emacs
(add-to-list 'load-path "~/.emacs.d/site-lisp/flex-autopair")
(require 'flex-autopair)
(flex-autopair-mode 1)

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
						  n                    " "
                    buffer-file-name)))
  )
(global-set-key (kbd "C-c o") 'prelude-open-with)
