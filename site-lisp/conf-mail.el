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
