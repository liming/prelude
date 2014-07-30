;; c/c++ settings

(add-to-list 'auto-mode-alist '("\\.\\(cpp\\|h\\)$" . c++-mode))

;; Create my personal style.
(defconst corvu-c-style
  '((c-tab-always-indent        . t)
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
  "My C Programming Style")
(c-add-style "CorVu" corvu-c-style)

;; Create my personal style.
(defconst corvu-next-c-style
  '((c-tab-always-indent        . 0)
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
  "My C Programming Style")
(c-add-style "CorVu-Next" corvu-next-c-style)

"Settings for `cc-mode'."
(defun corvu-c-mode-hook-settings ()
  "Settings for `c-mode-common-hook'."
  (c-set-style "CorVu")
  (setq tab-width 2 indent-tabs-mode t)
  (setq c-basic-offset 2)
  (setq indent-tabs-mode t)
  (c-toggle-auto-newline 1)
  (c-toggle-hungry-state)
  (whitespace-mode -1))

(defun corvu-next-c-mode-hook-settings ()
  "Settings for `c-mode-common-hook'."
  (c-set-style "CorVu-Next")
  (setq tab-width 2 indent-tabs-mode t)
  (setq c-basic-offset 2)
  (indent-tabs-mode -1)
  (c-toggle-auto-newline 1)
  (c-toggle-hungry-state)
  (whitespace-mode -1))

(add-hook 'c-mode-common-hook 'corvu-c-mode-hook-settings)
(add-hook 'c++-mode-hook 'corvu-c-mode-hook-settings)

;; (add-hook 'c-mode-common-hook 'google-set-c-style)
;; (add-hook 'c-mode-common-hook 'google-make-newline-indent)

(defconst protobuf-style
  '((c-basic-offset . 2)
    (indent-tabs-mode . nil)))

(add-hook 'protobuf-mode-hook
          (lambda () (c-add-style "my-style" protobuf-style t)))

;; gtags settings
(autoload 'gtags-mode "gtags" "" t)
(setq gtags-mode-hook
      '(lambda ()
           (local-set-key "\M-t" 'gtags-find-tag)
           (local-set-key "\M-r" 'gtags-find-rtag)
           (local-set-key "\M-s" 'gtags-find-symbol)
           (local-set-key "\M-p" 'gtags-pop-stack)
          ))
;
(add-hook 'c-mode-common-hook
          '(lambda()
             (gtags-mode 1)
;;             (gtags-make-complete-list)
             ))
