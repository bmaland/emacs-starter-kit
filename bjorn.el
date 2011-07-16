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

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(require 'el-get)

(setq my-packages
      '(
        ;;color-theme-solarized
        anything
        auto-complete
        autopair
        coffee-mode
        haml-mode
        magit
        markdown-mode
        moz-repl
        org-mode
        paredit
        sass-mode
        csharp-mode
        fsharp-mode
        js3-mode
        yasnippet
        ))

(unless (eq window-system 'w32)
  (setq my-packages
        (append '(
                  rvm
                  )
                my-packages)))

(setq el-get-sources
      '(
  (:name textmate
               :type git
               :url "git://github.com/defunkt/textmate.el"
               :load "textmate.el")
        (:name js3-mode
               :type git
               :url "https://github.com/thomblake/js3-mode.git"
               :compile "js3.el"
               :post-init (lambda ()
                            (autoload 'js3-mode "js3" nil t))
         )))

(setq my-packages
      (append
       my-packages
       (mapcar 'el-get-source-name el-get-sources)))

(el-get 'sync my-packages)

(add-to-list 'load-path "~/.emacs.d/vendor")

(require 'ack)
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
