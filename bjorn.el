;; Add the marmelade repo
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

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
        org-mode
        paredit
        sass-mode
        ))

(unless (eq window-system 'w32)
  (setq my-packages
        (append '(
                  csharp-mode ;; git-svn
                  fsharp-mode ;; svn
                  moz-repl
                  rvm
                  )
                my-packages)))

(setq el-get-sources
      '(
        (:name coffee-mode
               :type git
               :url "git://github.com/defunkt/coffee-mode.git"
               :post-init (lambda ()
                            (autoload 'coffee-mode "coffee-mode" nil t)))
        (:name textmate
               :type git
               :url "git://github.com/defunkt/textmate.el"
               :load "textmate.el")
        (:name js3-mode
               :type git
               :url "git://github.com/thomblake/js3-mode.git"
               :compile "js3.el"
               :post-init (lambda ()
                            (autoload 'js3-mode "js3" nil t))
               )
        (:name yasnippet
               :type git
               :url "git://github.com/emacsmirror/yasnippet.git"
               :features "yasnippet"
               :post-init (lambda ()
                            (yas/initialize)
                            (add-to-list 'yas/snippet-dirs (concat el-get-dir "yasnippet/snippets"))
                            (yas/reload-all)))
        ))

(setq my-packages
      (append
       my-packages
       el-get-sources))
       ;;(mapcar 'el-get-source-name el-get-sources)))

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
