(add-to-list 'load-path "~/.emacs.d/vendor")
(add-to-list 'load-path "~/.emacs.d/vendor/org-mode")
(add-to-list 'load-path "~/.emacs.d/vendor/el-get")
(require 'el-get)
(require 'yasnippet)
(require 'kill-wspace-mode)

(require 'filecache)

;; No idle-highlight
(remove-hook 'coding-hook 'idle-highlight)

;; No paredit for JS
(remove-hook 'espresso-mode-hook 'esk-paredit-nonlisp)

(setq starter-kit-packages
      (append starter-kit-packages (list
                                    'haml-mode
                                    'highlight-80+
                                    'rinari
                                    'ruby-electric
                                    'rvm
                                    'sass-mode)))
(starter-kit-elpa-install)

(setq el-get-sources
      '(python-mode
        ipython
        pylookup
        pymacs
        ropemacs
        color-theme-tango-2
        (:name rvm
               :type git
               :url "http://github.com/djwhitt/rvm.el.git"
               :load "rvm.el"
               :compile ("rvm.el")
               :after (lambda() (rvm-use-default)))
        (:name rhtml
               :type git
               :url "https://github.com/eschulte/rhtml.git"
               :features rhtml-mode)
        (:name textmate
               :type git
               :url "git://github.com/defunkt/textmate.el"
               :load "textmate.el")
        ))

(el-get 'sync)
