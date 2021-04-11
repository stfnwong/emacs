;; Init file
;; Colorscheme
(load-theme 'tango-dark)
;; Line numbers
(when (version<= "26.0.50" emacs-version)
  (global-display-line-numbers-mode))

;; Change default window size
(if (display-graphic-p)
    (progn
      (setq initial-frame-alist
	    '(
	      (tool-bar-lines . 0)
	      (width . 106)   ;; chars
	      (height . 60)   ;; lines
	      (left . 50)
	      (top . 50)))
      (setq default-frame-alist
	    '(
	      (tool-bar-lines . 0)
	      (width . 105)
	      (height . 60)
	      (left . 50)
	      (top . 50))))
  (progn
    (setq initial-frame-alist '( (tool-bar-lines . 0)))
    (setq default-frame-alist '( (tool-bar-lines . 0)))))


;; Packages
;; Check all required packages and load any that are missing
(load "~/.emacs.d/packages.el")

;; Turn on delete selection mode
(delete-selection-mode 1)

;; Enable Org mode
(require 'org)
;; Set org mode to work with files ending in *.org
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

;; Add the org-mode bindings
(global-set-key "\C-c a" 'org-agenda)
(global-set-key "\C-c l" 'org-store-link)
(global-set-key "\C-c c" 'org-capture)
