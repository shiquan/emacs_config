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

(setq-default c-indent-tabs-mode t    
	      c-indent-level 4      
	      c-argdecl-indent 0    
	      c-tab-always-indent t
	      backward-delete-function nil) 
(c-add-style "my-c-style" '((c-continued-statement-offset 4)))

(defun my-c-mode-hook ()
  (c-set-style "my-c-style")
  (c-set-offset 'substatement-open '0)
  (c-set-offset 'inline-open '+)
  (c-set-offset 'block-open '+)
  (c-set-offset 'brace-list-open '+)  
  (c-set-offset 'case-label '+))      
(add-hook 'c-mode-hook 'my-c-mode-hook)
(add-hook 'c++-mode-hook 'my-c-mode-hook)

(require 'setup-package)

;; Install extensions if they're missing
(defun init--install-packages ()
  (packages-install
   '(magit
     visual-regexp
     yasnippet
     cedet
     zenburn-theme
     )))

(condition-case nil
    (init--install-packages)
  (error
   (package-refresh-contents)
   (init--install-packages)))

(load-theme 'zenburn t)

;; Lets start with a smattering of sanity
;;(require 'sane-defaults)

;; Font lock dash.el
(eval-after-load "dash" '(dash-enable-font-lock))

;; Setup environment variables from the user's shell.
(when is-mac
  (require-package 'exec-path-from-shell)
  (exec-path-from-shell-initialize))
