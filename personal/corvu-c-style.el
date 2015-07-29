

;; Create my personal style for CorVu.

(defconst corvu-c-style
  '((c-tab-always-indent        . t)
    (indent-tabs-mode           . t)
    (c-toggle-auto-newline      . t)
    (c-comment-only-line-offset . 0)
    (c-basic-offset             . 2)
    (tab-width                  . 2)
    (whitespace-mode            . -1)
    (c-comment-only-line-offset . 0)
    (c-hanging-braces-alist     . ((substatement-open . (before))
                                   (substatement-open . (after))
                                   (brace-list-open)))
    (c-cleanup-list             . (scope-operator
                                   empty-defun-braces
                                   defun-close-semi))
    (c-hanging-colons-alist     . ((member-init-intro before)
                                   (inher-intro)
                                   (case-label after)
                                   (label after)
                                   (access-label after)))
    (c-offsets-alist            . ((arglist-close . c-lineup-arglist)
                                   (substatement-open . 0)
                                   (case-label        . 0)
                                   (block-open        . 0)
                                   (knr-argdecl-intro . -)
                                   (inline-open       . 0)
                                   ))
    (c-echo-syntactic-information-p . t))
  "CorVu C Programming Style")


;;;###autoload
(defun corvu-set-c-style ()
  "Set the current buffer's c-style to CorVu C/C++ Programming
  Style. Meant to be added to `c-mode-common-hook'."
  (interactive)
  (c-add-style "CorVu" corvu-c-style t))

;;;###autoload
(defun corvu-make-newline-indent ()
  "Sets up preferred newline behavior. Not set by default. Meant
  to be added to `c-mode-common-hook'."
  (interactive)
  (define-key c-mode-base-map "\C-m" 'newline-and-indent)
  (define-key c-mode-base-map [ret] 'newline-and-indent))

(provide 'corvu-c-style)
;;; corvu-c-style.el ends here

