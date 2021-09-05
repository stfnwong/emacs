;; Packages

(require 'package)
(add-to-list 'package-archives '("mepla-stable" . "http://melpa-stable.milkbox.net/packages/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))


;; Install these packages 
(setq package-list
      '(python-environment
		pyenv
		change-inner
		highlight-parentheses
		lsp-mode
		rust-mode
		haskell-mode
		markdown-mode
		which-key
		tuareg
		evil
		dune
		magit
		fzf
		geiser
		geiser-guile
		darkburn-theme
		darkmine-theme
		afternoon-theme
		arc-dark-theme
		colonoscopy-theme
		dracula-theme
		)
	  )
			   
;; activate the packages
(package-initialize)

;; fetch the list of available packages
(unless package-archive-contents
  (package-refresh-contents))

;; install any missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))
