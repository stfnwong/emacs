;; Init file
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
	    '(e
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

;; Colorscheme
;;(load-theme 'afternoon t)
(load-theme 'arc-dark t)

;; Turn on delete selection mode
(delete-selection-mode 1)

;; Adjust the default tab length 
(setq-default tab-width 4)

;; Add C-c C-i as change-inner globally
(global-set-key (kbd "C-c M-i") 'change-inner)
(global-set-key (kbd "C-c M-o") 'change-outer)
(global-set-key (kbd "C-c M-w") 'change-word)

;; Also add in expand region by itself
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)
(global-set-key (kbd "C-x M-w") 'er/mark-word)
(global-set-key (kbd "C-x M-s") 'er/mark-symbol)
(global-set-key (kbd "C-x M-p") 'er/mark-inside-pairs)
(global-set-key (kbd "C-x M-o") 'er/mark-outside-pairs)

;; Enable Org mode
(require 'org)
;; Set org mode to work with files ending in *.org
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

;; Add the org-mode bindings
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c c") 'org-Capture)

;; ========= Geiser 
;; TODO: replace this with the output of $(which guile)
;;(setq geiser-mit-binary "/usr/bin/guile2.2")
;;(setq geiser-active-implementations '(guile2.2))
(setq geiser-guile-binary "guile2.2")
;; Add parentheses-mode as a minor mode 
(require 'highlight-parentheses)

(define-globalized-minor-mode global-highlight-parentheses highlight-parentheses-mode
    (lambda nil (highlight-parentheses-mode t)))

(global-highlight-parentheses-mode t)

;; Settings for lsp-mode
(setq lsp-keymap-prefix "s-l")
(require 'lsp-mode)

(add-hook 'c-mode-hook 'lsp)
(add-hook 'c++-mode-hook 'lsp)
(add-hook 'tuareg-hook 'lsp)
(add-hook 'python-mode-hook 'lsp)
(add-hook 'rust-mode-hook 'lsp)



;; ;; Add a horizontal recenter
;; (defun horz-recenter ()
;;   "make the current point horizontally centered in the window"
;;   (interactive)
;;   (let ((mid (/ (window-width) 2))
;; 	(line-len (save-excursion (end-of-line) (current-column)))
;; 	(cur (current-column)))
;;     (if (< mid-cur)
;; 	(set-window-hscroll (selected-window)
;; 			    (- cur mid)))))

;; (global-set-key (kbd "C-S-l") 'horz-recenter)
 
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("57e3f215bef8784157991c4957965aa31bac935aca011b29d7d8e113a652b693" "7575474658c34b905bcec30a725653b2138c2f2d3deef0587e3abfae08c5b276" default))
 '(geiser-guile-binary "guile2.2")
 '(package-selected-packages
   '(pyenv pyenv-mode dracula-theme colonoscopy-theme badger-theme arc-dark-theme afternoon-theme abyss-theme which-key dune darkmine-theme darkburn-theme python-environment tuareg rust-mode haskell-mode expand-region evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; cc-mode options
(setq c-default-style "linux"
      c-basic-offset 4)

;; Enable CUA mode (rectangle select)
;;(setq cua-enable-cua-keys nil)
;;(cua-mode)
