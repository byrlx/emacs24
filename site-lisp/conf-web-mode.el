(require 'web-mode)
(setq auto-mode-alist (cons '("\\.php$" . web-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.aspx$" . web-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.html$" . web-mode) auto-mode-alist))
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode)) 
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode)) 
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode)) 
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode)) 
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

; Identication
(defun web-mode-hook () "Hooks for Web mode." 
  (setq web-mode-markup-indent-offset 4)
  (setq web-mode-css-indent-offset 4)
  (setq web-mode-code-indent-offset 4)) 
(add-hook 'web-mode-hook 'web-mode-hook)
; Add a snippets 
(add-to-list 'web-mode-snippets '("div" "<div>" "</div>"))
(add-to-list 'web-mode-snippets '("span" "<span>" "</span>"))
(add-to-list 'web-mode-snippets '("html" "<html>" "</html>"))
(add-to-list 'web-mode-snippets '("p" "<p>" "</p>"))
(setq web-mode-enable-block-faces t)
; Set face color for attributes
(set-face-attribute 'web-mode-doctype-face nil :foreground "#CB4B16" :bold t)
(set-face-attribute 'web-mode-html-tag-face nil :foreground "#859900" :bold t)
(set-face-attribute 'web-mode-html-attr-name-face nil :foreground "DodgerBlue3")

(require 'flymake)
(autoload 'flymake-find-file-hook "flymake" "" t)
(add-hook 'find-file-hook 'flymake-find-file-hook)
(setq flymake-gui-warnings-enabled nil)
(setq flymake-log-level 1)

;; ;; Customize how flymake displays the errors
;; '(flymake-errline ((((class color)) (:underline "OrangeRed"))))
;; '(flymake-warnline ((((class color)) (:underline "yellow"))))

(require 'markdown-mode)
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
