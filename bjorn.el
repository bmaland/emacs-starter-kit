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
      '((:name rvm
               :type git
               :url "http://github.com/djwhitt/rvm.el.git"
               :load "rvm.el"
               :compile ("rvm.el")
               :after (lambda() (rvm-use-default)))))

(el-get 'sync)
