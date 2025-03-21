;;; org-super-links-autoloads.el --- automatically extracted autoloads (do not edit)   -*- lexical-binding: t -*-
;; Generated by the `loaddefs-generate' function.

;; This file is part of GNU Emacs.

;;; Code:

(add-to-list 'load-path (or (and load-file-name (directory-file-name (file-name-directory load-file-name))) (car load-path)))



;;; Generated autoloads from org-super-links.el

(autoload 'org-super-links-convert-link-to-super "org-super-links" "\
Convert a normal `org-mode' link at `point' to super link, ARG prefix.
If variable `org-super-links-related-into-drawer' is non-nil move
the link into drawer.

When called interactively with a `C-u' prefix argument ignore
variable `org-super-links-related-into-drawer' configuration and
do not modify existing link.

(fn &optional ARG)" t)
(autoload 'org-super-links-delete-link "org-super-links" "\
Delete the link at point, and the corresponding reverse link.
If no reverse link exists, just delete link at point.
This works from either side, and deletes both sides of a link." t)
(autoload 'org-super-links-store-link "org-super-links" "\
Store a point to register for use in function `org-super-links-insert-link'.
This is primarily intended to be called before `org-capture', but
could possibly even be used to replace `org-store-link' IF
function `org-super-links-insert-link' is used to replace
`org-insert-link'.  This has not been thoroughly tested outside
of links to/form org files.  GOTO and KEYS are unused.

(fn &optional GOTO KEYS)" t)
(autoload 'org-super-links-insert-link "org-super-links" "\
Insert a super link from the register." t)
(autoload 'org-super-links-link "org-super-links" "\
Insert a link and add a backlink to the target heading." t)
(register-definition-prefixes "org-super-links" '("org-super-links-"))


;;; Generated autoloads from org-super-links-org-ql.el

(register-definition-prefixes "org-super-links-org-ql" '("org-super-links-org-ql-"))


;;; Generated autoloads from org-super-links-org-rifle.el

(register-definition-prefixes "org-super-links-org-rifle" '("org-super-links-org-rifle-"))

;;; End of scraped data

(provide 'org-super-links-autoloads)

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; no-native-compile: t
;; coding: utf-8-emacs-unix
;; End:

;;; org-super-links-autoloads.el ends here
