;; First setup packages
(setq starter-kit-packages
      (append starter-kit-packages (list
                                    'haml-mode
                                    'highlight-80+
                                    'rinari
                                    'ruby-electric
                                    'rvm
                                    'sass-mode)))
(starter-kit-elpa-install)

(add-to-list 'load-path "~/.emacs.d/vendor/el-get")
(require 'el-get)
(setq el-get-sources
      '(python-mode
        ipython
        pylookup
        pymacs
        ropemacs
        auto-complete
        anything
        autopair
        magit
        rvm
        quack
        org-mode
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

(add-to-list 'load-path "~/.emacs.d/vendor")

(require 'ack)
(require 'yasnippet)
(require 'kill-wspace-mode)

(require 'filecache)

(autoload 'autopair-global-mode "autopair" nil t)
(setq autopair-pair-criteria 'always
      autopair-blink nil)

;; No idle-highlight
(remove-hook 'coding-hook 'idle-highlight)

;; No paredit for JS
(remove-hook 'espresso-mode-hook 'esk-paredit-nonlisp)
