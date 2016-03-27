(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(setq inhibit-startup-message t)

;; Set path to dependencies
(setq site-lisp-dir
      (expand-file-name "site-lisp" user-emacs-directory))

(setq settings-dir
      (expand-file-name "settings" user-emacs-directory))

(setq themes-dir
      (expand-file-name "themes" user-emacs-directory))

(add-to-list 'load-path settings-dir)
(add-to-list 'custom-theme-load-path themes-dir)

;; mac os 
(setq is-mac (equal system-type 'darwin))


(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups")))))
(global-set-key (kbd "C-x p") 'previous-multiframe-window)
;;(setq shift-select-mode nil)
(require 'setup-package)

;; Install extensions if they're missing
(defun init--install-packages ()
  (packages-install
   '(magit
     visual-regexp
     yasnippet
     cedet
     zenburn-theme
     smartparens
     auto-complete
     ess
     )))

(condition-case nil
    (init--install-packages)
  (error
   (package-refresh-contents)
   (init--install-packages)))

(load-theme 'zenburn t)
(set-face-attribute 'region nil :background "#666")

(require 'smartparens-config)
(setq sp-autoescape-string-quote nil)

(ac-config-default)

(require 'setup-c-mode)
(require 'setup-R-mode)
(display-time-mode 1)
;;(require 'mode-mappings)

;; Lets start with a smattering of sanity
;;(require 'sane-defaults)

;; Font lock dash.el
(eval-after-load "dash" '(dash-enable-font-lock))

;; Setup environment variables from the user's shell.
(when is-mac
  (require-package 'exec-path-from-shell)
  (exec-path-from-shell-initialize)
  (set-face-attribute 'default nil :family "Monaco")
  (set-face-attribute 'default nil :height 140))
