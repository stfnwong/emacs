;; Packages

(require 'package)
(add-to-list 'package-archives '("mepla-stable" . "http://melpa-stable.milkbox.net/packages/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

;; TODO: group all the theme packages together
;; Install these packages
(setq package-list
	  '(python-environment
		ewal-evil-cursors
		change-inner
		highlight-parentheses

		;; Modes
		lsp-mode
		rust-mode
		haskell-mode
		markdown-mode
		pyenv-mode-auto
		tuareg   ;; OCaml mode
		evil
		glsl-mode

		;; Other things
		which-key
		dune
		magit
		fzf

		;; Lisp
		scheme-complete
		geiser
		geiser-guile

		;; Themes
		ewal-doom-themes
		darkburn-theme
		darkmine-theme
		afternoon-theme
		colonoscopy-theme
		dracula-theme
		solidity-mode
		arc-dark-theme
		dream-theme
		ancient-one-dark-theme
		exotica-theme

		;; Org
		org-tree-slide
		browse-kill-ring
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
