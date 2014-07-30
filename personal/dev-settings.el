
(defun my-prog-mode-defaults ()
  "Default coding hook, useful with any programming language."
  (turn-off-flyspell)
  (guru-mode -1)
  (whitespace-mode -1)
  (linum-mode t))

(add-hook 'prelude-prog-mode-hook 'my-prog-mode-defaults t)

;;; stop prelude cleaning up all the whitespace in prelude-programming.el
;;; the solution is coming from: https://github.com/bbatsov/prelude/issues/185
(add-hook 'prog-mode-hook
          (lambda nil (remove-hook 'before-save-hook 'whitespace-cleanup t))
          t)

;; set bookmark
(require 'bm)
;; M$ Visual Studio key setup.
(global-set-key (kbd "<C-f6>") 'bm-toggle)
(global-set-key (kbd "<f6>") 'bm-next)
(global-set-key (kbd "<S-f6>") 'bm-previous)

(define-key global-map (kbd "RET") 'newline-and-indent)

;;; js2 mode
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'interpreter-mode-alist '("node" . js2-mode))
(setq tab-width 4)


;; goto another paren
(defun goto-paren ()
  "goto matched paren"
  (interactive)
  (cond
   ((looking-at "[ \t]*[[\"({]") (forward-sexp) (backward-char))
   ((or (looking-at "[]\")}]") (looking-back "[]\")}][ \t]*")) (if (< (point) (point-max)) (forward-char)) (backward-sexp))
   (t (message "cannot find matched paren"))))

(global-set-key (kbd "C-]") 'goto-paren)

(yas-global-mode 1)
