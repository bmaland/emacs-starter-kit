;; First setup packages
(unless package-archive-contents (package-refresh-contents))
(setq starter-kit-packages  (list
                             'highlight-80+
                             'inf-ruby
                             'ruby-mode
                             'ruby-electric
                             'ruby-compilation
                             ))
(starter-kit-elpa-install)

(add-to-list 'load-path "~/.emacs.d/vendor/el-get")
(require 'el-get)
(setq el-get-sources
      '(
        ;;color-theme-solarized
        anything
        auto-complete
        autopair
        color-theme
        gist
        haml-mode
        ipython
        magit
        markdown-mode
        moz-repl
        org-mode
        paredit
        pylookup
        pymacs
        python-mode
        quack
        rhtml-mode
        rinari
        ropemacs
        rvm
        sass-mode
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

;; Start the emacs server
(server-start)
