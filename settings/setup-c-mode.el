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

(provide 'setup-c-mode)
