;; Packages

;; Takeaway order - 1x Pad Si Ew (Chicken), 1x Egg Fried Rice

;; 
(require 'package)

(add-to-list 'package-archives '("mepla-stable" . "http://melpa-stable.milkbox.net/packages/") t)

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))


;; select packages here
(setq package-list
      '(python-environment rust-mode haskell-mode tuareg evil ))
			   
;; activate the packages
(package-initialize)

;; fetch the list of available packages
(unless package-archive-contents
  (package-refresh-contents))

;; install any missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))
