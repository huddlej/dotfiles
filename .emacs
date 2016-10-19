(setq load-path  (cons (expand-file-name "~/.emacs-lisp/") load-path))

;; t for tabs instead of spaces
(setq-default indent-tabs-mode t)
;; nil for spaces instead of tabs
;;(setq-default indent-tabs-mode nil)
(setq default-tab-width 4)
(setq c-basic-offset 4)

(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

(global-set-key "\M-g" 'goto-line)

;; Enable snakemake mode.
(require 'snakemake-mode)
(add-to-list 'auto-mode-alist '("\.*Snakefile.*\\'" . snakemake-mode))
(add-to-list 'auto-mode-alist '("\\.snake\\'" . snakemake-mode))
(add-to-list 'auto-mode-alist '("\\.rules\\'" . snakemake-mode))

;; Enable markdown mode with GitHub flavored syntax.
(require 'markdown-mode)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; Enable backup files.
(setq make-backup-files t)

;; Enable versioning with default values (keep five last versions, I think!)
(setq version-control t)

;; Save all backup file in this directory.
(setq backup-directory-alist (quote ((".*" . "~/.emacs_backups/"))))

;; Show line-number in the mode line
(line-number-mode 1)

;; Show column-number in the mode line
(column-number-mode 1)

;; Delete whitespace on save.
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Invoke M-x without the Alt key.
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)

;; Prefer backward-kill-word over Backspace.
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)
(global-set-key "\C-d" 'delete-region)

;; Setup auto fill so lines wrap at 80 characters.
(setq-default fill-column 80)
(setq auto-fill-mode 1)

;; Configure unique buffer names.  Replaces default names of "views.py<2>" with
;; "views.py/keymanager" for all duplicates.
(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse)
(setq uniquify-separator "/")
(setq uniquify-after-kill-buffer-p t) ; rename after killing uniquified
(setq uniquify-ignore-buffers-re "^\\*") ; don't muck with special buffers (or
                                         ; Gnus mail buffers)

;; Configure autocomplete.
;; Downloaded from: http://www.emacswiki.org/emacs/download/auto-complete.el
(require 'auto-complete)
(global-auto-complete-mode t)
;; start completion when entered 3 characters
;;(setq ac-auto-start 3)
(setq ac-dwim t)

(require 'git)
