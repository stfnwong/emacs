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
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(setq package-enable-at-startup nil)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(tuareg rust-mode haskell-mode evil-visual-mark-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(package-initialize)


;; Add evil mode but don't use it by default
(require 'evil)
;;(evil-mode t)

;; Add rust mode (via MELPA)
(require 'rust-mode)

;; Add tuareg (via MELPA)
(require 'tuareg)

;; ;; Trying to install tuareg
;; (require 'cl-lib)
;;      (use-package tuareg
;; 		  :ensure t
;; 		  :config
;; 		  (add-hook 'tuareg-mode-hook #'electric-pair-local-mode)
;; 		  ;; (add-hook 'tuareg-mode-hook 'tuareg-imenu-set-imenu)
;; 		  (setq auto-mode-alist
;; 			(append '(("\\.ml[ily]?$" . tuareg-mode)
;; 				  ("\\.topml$" . tuareg-mode))
;; 				auto-mode-alist)))

;;      ;; Merlin configuration
;;      (use-package merlin
;; 		  :ensure t
;; 		  :config
;; 		  (add-hook 'tuareg-mode-hook 'merlin-mode)
;; 		  (add-hook 'merlin-mode-hook #'company-mode)
;; 		  (setq merlin-error-after-save nil))
     
;;      ;; utop configuration

;;      (use-package utop
;; 		  :ensure t
;; 		  :config
;; 		  (autoload 'utop-minor-mode "utop" "Minor mode for utop" t)
;; 		  (add-hook 'tuareg-mode-hook 'utop-minor-mode)
;; 		  )

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
