(setq load-path  (cons (expand-file-name "~/.emacs-lisp/") load-path))

(require 'php-mode)
(add-hook 'php-mode-hook 'turn-on-font-lock)

;; Configure Django HTML mode.
;; Downloaded from: http://code.djangoproject.com/wiki/Emacs
(require 'django-html-mode)
(add-hook 'django-html-mode 'turn-on-font-lock)

;; Configure IPython support.
;; Downloaded from: http://ipython.scipy.org/dist/ipython.el
;; (setq ipython-command "/usr/local/bin/ipython")
;; (require 'ipython)
;; (require 'comint)
;; (define-key comint-mode-map [(meta p)]
;;   'comint-previous-matching-input-from-input)
;; (define-key comint-mode-map [(meta n)]
;;   'comint-next-matching-input-from-input)
;; (define-key comint-mode-map [(control meta n)]
;;    'comint-next-input)
;; (define-key comint-mode-map [(control meta p)]
;;    'comint-previous-input)


(setq-default indent-tabs-mode nil)
(setq default-tab-width 4)
(setq c-basic-offset 4)

(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

(global-set-key "\M-g" 'goto-line)

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

;; Enable linum-mode for all modes unless we think the buffer is special.
(add-hook 'change-major-mode-hook
          (lambda ()
            (unless (string-match "^\*.+\*$" (buffer-name))
              (linum-mode t))))
(setq linum-format "%3d|")
(global-set-key "\M-n" 'linum-mode)

;; Save the current buffers and postions to the desktop.
(desktop-save-mode 1)

;; Delete whitespace on save.
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Touch WSGI file after saving a Django file.
(add-hook
 'after-save-hook
 (lambda ()
   (if (string-match "django" buffer-file-name)
       (shell-command "touch ~/django/wwu_housing/apache/django-home.wsgi")
       nil)))

;; Invoke M-x without the Alt key.
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)

;; Prefer backward-kill-word over Backspace.
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)

;; Setup auto fill so lines wrap at 80 characters.
(setq-default fill-column 80)
(setq auto-fill-mode 1)

;; Setup code folding.
(defun jao-toggle-selective-display ()
  (interactive)
  (set-selective-display (if selective-display nil 1)))

;; Configure global key shortcuts.
(global-set-key [f5] 'comment-region)
(global-set-key [f6] 'uncomment-region)
(global-set-key [f7] 'django-html-mode)
(global-set-key [f8] 'jao-toggle-selective-display)

;; Configure javascript mode.
;; Downloaded from: http://code.google.com/p/js2-mode/
(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

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

;; Configure yasnippet (a templating system).
(add-to-list 'load-path "~/.emacs-lisp/plugins/yasnippet")
(require 'yasnippet) ;; not yasnippet-bundle
(yas/initialize)
(yas/load-directory "~/.emacs-lisp/plugins/yasnippet/snippets")

(require 'git)

;; Configure IRC
;; (add-to-list 'rcirc-server-alist
;;              '("irc.freenode.net"
;;                :channels ("#dur" "#wwu-restek" "#tillikum")))
;; (setq rcirc-authinfo
;;       '(("freenode" nickserv "huddlej" "Heyjude")))


