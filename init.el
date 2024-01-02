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
(load-theme 'afternoon t)
;;(load-theme 'arc-dark t)

;; Turn on delete selection mode
(delete-selection-mode 1)

;; Adjust the default tab length 
(setq-default tab-width 4)

;; Jumpt to the buffer window if we open it
(global-set-key (kbd "C-x C-b") 'buffer-menu-other-window)

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
;; It does turn out that some other stuff is needed for two-finger clicks on Mac, but for the moment I don't need this.
(dolist (hook '(text-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))

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
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-safe-themes
   '("2035a16494e06636134de6d572ec47c30e26c3447eafeb6d3a9e8aee73732396" "8a379e7ac3a57e64de672dd744d4730b3bdb88ae328e8106f95cd81cbd44e0b6" "028c226411a386abc7f7a0fba1a2ebfae5fe69e2a816f54898df41a6a3412bb5" "cbdf8c2e1b2b5c15b34ddb5063f1b21514c7169ff20e081d39cf57ffee89bc1e" "da186cce19b5aed3f6a2316845583dbee76aea9255ea0da857d1c058ff003546" "266ecb1511fa3513ed7992e6cd461756a895dcc5fef2d378f165fed1c894a78c" "7eea50883f10e5c6ad6f81e153c640b3a288cd8dc1d26e4696f7d40f754cc703" "234dbb732ef054b109a9e5ee5b499632c63cc24f7c2383a849815dacc1727cb6" "a82ab9f1308b4e10684815b08c9cac6b07d5ccb12491f44a942d845b406b0296" "cf922a7a5c514fad79c483048257c5d8f242b21987af0db813d3f0b138dfaf53" "43f03c7bf52ec64cdf9f2c5956852be18c69b41c38ab5525d0bedfbd73619b6a" "9eecd688ffd00df3a218a323ceedf3f0f2950dd2347c9b708929a347bf46d2d4" "57e3f215bef8784157991c4957965aa31bac935aca011b29d7d8e113a652b693" "3d4df186126c347e002c8366d32016948068d2e9198c496093a96775cc3b3eaa" "7575474658c34b905bcec30a725653b2138c2f2d3deef0587e3abfae08c5b276" "2db65c4ef21dc93dd0d8f27d890637093e977658b7a70d55bedaaa1b7f973d85" "f7fed1aadf1967523c120c4c82ea48442a51ac65074ba544a5aefc5af490893b" "e6f3a4a582ffb5de0471c9b640a5f0212ccf258a987ba421ae2659f1eaa39b09" "c2aeb1bd4aa80f1e4f95746bda040aafb78b1808de07d340007ba898efa484f5" "1704976a1797342a1b4ea7a75bdbb3be1569f4619134341bd5a4c1cfb16abad4" "d268b67e0935b9ebc427cad88ded41e875abfcc27abd409726a92e55459e0d01" "1278c5f263cdb064b5c86ab7aa0a76552082cf0189acf6df17269219ba496053" "b0e446b48d03c5053af28908168262c3e5335dcad3317215d9fdeb8bac5bacf9" "6f4421bf31387397f6710b6f6381c448d1a71944d9e9da4e0057b3fe5d6f2fad" "3263bd17a7299449e6ffe118f0a14b92373763c4ccb140f4a30c182a85516d7f" "333958c446e920f5c350c4b4016908c130c3b46d590af91e1e7e2a0611f1e8c5" "1d5e33500bc9548f800f9e248b57d1b2a9ecde79cb40c0b1398dec51ee820daf" "ab729ed3a8826bf8927b16be7767aa449598950f45ddce7e4638c0960a96e0f1" "c1284dd4c650d6d74cfaf0106b8ae42270cab6c58f78efc5b7c825b6a4580417" default))
 '(nrepl-message-colors
   '("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3"))
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

