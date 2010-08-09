(add-to-list 'load-path "~/.emacs.d/vendor")
(add-to-list 'load-path "~/.emacs.d/vendor/org-mode")
(require 'yasnippet)
(require 'kill-wspace-mode)

;; No idle-highlight
(remove-hook 'coding-hook 'idle-highlight)

;; No paredit for JS
(remove-hook 'espresso-mode-hook 'esk-paredit-nonlisp)

(setq starter-kit-packages
      (append starter-kit-packages (list 'haml-mode
                                   'highlight-80+
                                   'rinari
                                   'rvm
                                   'sass-mode)))
(starter-kit-elpa-install)
