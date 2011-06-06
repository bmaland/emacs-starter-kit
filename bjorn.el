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
        haml-mode
        magit
        markdown-mode
        moz-repl
        org-mode
        paredit
        sass-mode
        (:name textmate
               :type git
               :url "git://github.com/defunkt/textmate.el"
               :load "textmate.el")
        ))

(unless (eq window-system 'w32)
  (setq el-get-sources
        (append '(
                  ipython
                  pylookup
                  pymacs
                  python-mode
                  rinari
                  ropemacs
                  rvm
                  )
                el-get-sources)))

(el-get 'sync)

(add-to-list 'load-path "~/.emacs.d/vendor")

(require 'ack)
(require 'yasnippet)
(require 'kill-wspace-mode)
(autoload 'scss-mode "scss-mode")
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))

(require 'filecache)

(autoload 'autopair-global-mode "autopair" nil t)
(setq autopair-pair-criteria 'always
      autopair-blink nil)

;; No idle-highlight
(remove-hook 'coding-hook 'idle-highlight)

;; Start the emacs server
(server-start)
