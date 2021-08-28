;; Packages



;; 
(require 'package)

(add-to-list 'package-archives '("mepla-stable" . "http://melpa-stable.milkbox.net/packages/") t)

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))


;; select packages here
(setq package-list
      '(python-environment change-inner highlight-parentheses lsp-mode rust-mode haskell-mode markdown-mode which-key tuareg evil darkburn-theme darkmine-theme dune magit))
			   
;; activate the packages
(package-initialize)

;; fetch the list of available packages
(unless package-archive-contents
  (package-refresh-contents))

;; install any missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))
