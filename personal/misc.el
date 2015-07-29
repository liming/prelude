;;; customize eamcs editing properties

;; use this key to select
(global-set-key (kbd "M-<SPC>") 'set-mark-command)

;; set goto line to simple key
(global-set-key (kbd "M-g") 'goto-line)

(load-theme 'solarized-dark t)

;; (set-default-font "ProggyCleanTT-12")
;; (set-default-font "Consolas-10")
;;(set-default-font "Monaco-9")

;;; setup sunrise commander
;; (require 'sunrise-commander)
;; (require 'sunrise-x-buttons)
;;; sunrise global key
;; (global-set-key [f11] 'sunrise)
;;(global-set-key [C-f11] 'sunrise-cd)
;;(add-to-list 'auto-mode-alist '("\\.srvm\\'" . sr-virtual-mode))
;;(set-register ?f '(file . "~/favorites.srvm"))

;;; this is the ace jump settings
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

(require 'google-translate)
(global-set-key "\C-ct" 'google-translate-at-point)
(global-set-key "\C-cT" 'google-translate-query-translate)

(setq prelude-clean-whitespace-on-save nil)

;; specially for mac
(setq mac-option-modifier 'super)
(setq mac-command-modifier 'meta)
