(autoload 'R-mode "ess-site.el" "ESS" t)
(add-to-list 'auto-mode-alist '("\\.R$" . R-mode))
(setq inferior-R-program-name "/usr/local/bin/R")
setq ess-eval-visibly-p nil)
(setq ess-ask-for-ess-directory nil)
(require 'ess-eldoc)
(show-paren-mode 1)
(provide 'setup-R-mode)