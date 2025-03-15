;;; init-dev.el --- Development settings -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

(use-package vc
  :ensure nil
  :custom
  ;; 打开链接文件时，不进行追问
  (vc-follow-symlinks t)
  (vc-allow-async-revert t)
  (vc-handled-backends '(Git)))

(use-package rust-mode
  :ensure t)
(add-hook 'rust-mode-hook 'eglot-ensure)

(defun meow-setup ()
(setq meow-cheatsheet-layout meow-cheatsheet-layout-dvp)
(meow-leader-define-key
 '("?" . meow-cheatsheet))
(meow-motion-define-key
 ;; custom keybinding for motion state
 '("<escape>" . ignore))
(meow-normal-define-key
 '("?" . meow-cheatsheet)
 '("*" . meow-expand-0)
 '("=" . meow-expand-9)
 '("!" . meow-expand-8)
 '("[" . meow-expand-7)
 '("]" . meow-expand-6)
 '("{" . meow-expand-5)
 '("+" . meow-expand-4)
 '("}" . meow-expand-3)
 '(")" . meow-expand-2)
 '("(" . meow-expand-1)
 '("1" . digit-argument)
 '("2" . digit-argument)
 '("3" . digit-argument)
 '("4" . digit-argument)
 '("5" . digit-argument)
 '("6" . digit-argument)
 '("7" . digit-argument)
 '("8" . digit-argument)
 '("9" . digit-argument)
 '("0" . digit-argument)
 '("-" . negative-argument)
 '(";" . meow-reverse)
 '("," . meow-inner-of-thing)
 '("." . meow-bounds-of-thing)
 '("<" . meow-beginning-of-thing)
 '(">" . meow-end-of-thing)
 '("a" . meow-append)
 '("A" . meow-open-below)
 '("b" . meow-back-word)
 '("B" . meow-back-symbol)
 '("c" . meow-change)
 '("d" . meow-delete)
 '("D" . meow-backward-delete)
 '("e" . meow-line)
 '("E" . meow-goto-line)
 '("f" . meow-find)
 '("g" . meow-cancel-selection)
 '("G" . meow-grab)
 '("h" . meow-left)
 '("H" . meow-left-expand)
 '("i" . meow-insert)
 '("I" . meow-open-above)
 '("j" . meow-join)
 '("k" . meow-kill)
 '("l" . meow-till)
 '("m" . meow-mark-word)
 '("M" . meow-mark-symbol)
 '("n" . meow-next)
 '("N" . meow-next-expand)
 '("o" . meow-block)
 '("O" . meow-to-block)
 '("p" . meow-prev)
 '("P" . meow-prev-expand)
 '("q" . meow-quit)
 '("r" . meow-replace)
 '("R" . meow-swap-grab)
 '("s" . meow-search)
 '("t" . meow-right)
 '("T" . meow-right-expand)
 '("u" . meow-undo)
 '("U" . meow-undo-in-selection)
 '("v" . meow-visit)
 '("w" . meow-next-word)
 '("W" . meow-next-symbol)
 '("x" . meow-save)
 '("X" . meow-sync-grab)
 '("y" . meow-yank)
 '("z" . meow-pop-selection)
 '("'" . repeat)
 '("<escape>" . ignore)))

(use-package meow
:ensure t
:config
(meow-setup)
(meow-global-mode 1))

(use-package magit
  :ensure t
  :hook (git-commit-mode . flyspell-mode)
  :bind (("C-x g"   . magit-status)
         ("C-x M-g" . magit-dispatch)
         ("C-c M-g" . magit-file-dispatch))
  :custom
  (magit-diff-refine-hunk t)
  (magit-ediff-dwim-show-on-hunks t))

(use-package diff-hl
  :ensure t
  :hook ((dired-mode         . diff-hl-dired-mode-unless-remote)
         (magit-pre-refresh  . diff-hl-magit-pre-refresh)
         (magit-post-refresh . diff-hl-magit-post-refresh))
  :init
  (global-diff-hl-mode t)
  :config
  ;; When Emacs runs in terminal, show the indicators in margin instead.
  (unless (display-graphic-p)
    (diff-hl-margin-mode)))

(use-package magit-delta
  :ensure t
  :hook (magit-mode . magit-delta-mode)
  :config
  (setq magit-delta-hide-plus-minus-markers nil)
  )

(provide 'init-dev)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-dev.el ends here
