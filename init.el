;; ================
;; Init file
;; ================

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

;; Add TODO keywords for org mode
(setq org-todo-keywords
	  '((sequence "TOOD" "IN-PROGRESS" "WAITING" "DONE")))

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

;; Add flyspell for text modes
(dolist (hook '(text-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))

;; It does turn out that some other stuff is needed for two-finger clicks on Mac, but for the moment I don't need this.


;; Settings for lsp-mode
(setq lsp-keymap-prefix "s-L")
(require 'lsp-mode)

(add-hook 'c-mode-hook 'lsp)
(add-hook 'c++-mode-hook 'lsp)
(add-hook 'tuareg-hook 'lsp)
(add-hook 'python-mode-hook 'lsp)
(add-hook 'rust-mode-hook 'lsp)

;; cc-mode options
(setq c-default-style "linux"
      c-basic-offset 4)

;; Enable CUA mode (rectangle select)
;;(setq cua-enable-cua-keys nil)
;;(cua-mode)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(glsl-mode browse-kill-ring org-tree-slide solidity-mode which-key tuareg rust-mode python-environment pyenv-mode-auto magit lsp-mode highlight-parentheses haskell-mode geiser-guile fzf evil dune dracula-theme darkmine-theme darkburn-theme colonoscopy-theme change-inner badger-theme arc-dark-theme afternoon-theme abyss-theme)))
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


;; Move all the backup files to a common place
;;(setq backup-directory-alist
;;	  ((".", (expand-file-name
;;			  (concat user-emacs-directory "backups")))))
;;
;;;; Write autosave files to temp dir
;;(setq auto-save-file-name-transforms
;;	  ((",", temporary-file-directory t)))

