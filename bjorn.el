;; Add the marmelade repo
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

;; First setup packages
(unless package-archive-contents (package-refresh-contents))
(setq starter-kit-packages  (list
                             'highlight-80+
                             ))
(starter-kit-elpa-install)

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil t)
  (url-retrieve
   "https://raw.github.com/dimitri/el-get/master/el-get-install.el"
   (lambda (s)
     (end-of-buffer)
     (eval-print-last-sexp))))

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
        mustache-mode
        org-mode
        paredit
        rhtml-mode
        rinari
        rspec-mode
        ruby-mode
        inf-ruby
        ruby-electric
        ruby-compilation
        sass-mode
        textmate
        yaml-mode
        yari
        ))

(unless (eq window-system 'w32)
  (setq my-packages
        (append '(
                  ;;csharp-mode ;; git-svn
                  ;;fsharp-mode ;; svn
                  ;;moz-repl
                  rvm
                  )
                my-packages)))

(setq el-get-sources
      '(
        (:name js3-mode
               :type git
               :url "git://github.com/thomblake/js3-mode.git"
               :compile "js3.el"
               :post-init (lambda ()
                            (autoload 'js3-mode "js3" nil t))
               )
        (:name yasnippet
               :website "https://github.com/capitaomorte/yasnippet.git"
               :description "YASnippet is a template system for Emacs."
               :type git
               :url "https://github.com/capitaomorte/yasnippet.git"
               :features "yasnippet"
               :prepare (lambda ()
                          ;; Set up the default snippets directory
                          ;;
                          ;; Principle: don't override any user settings
                          ;; for yas/snippet-dirs, whether those were made
                          ;; with setq or customize. If the user doesn't
                          ;; want the default snippets, she shouldn't get
                          ;; them!
                          (unless (or (boundp 'yas/snippet-dirs) (get 'yas/snippet-dirs 'customized-value))
                            (setq yas/snippet-dirs
                                  (list (concat el-get-dir (file-name-as-directory "yasnippet") "snippets")))))

               :post-init (lambda ()
                            ;; Trick customize into believing the standard
                            ;; value includes the default snippets.
                            ;; yasnippet would probably do this itself,
                            ;; except that it doesn't include an
                            ;; installation procedure that sets up the
                            ;; snippets directory, and thus doesn't know
                            ;; where those snippets will be installed. See
                            ;; http://code.google.com/p/yasnippet/issues/detail?id=179
                            (put 'yas/snippet-dirs 'standard-value
                                 ;; as cus-edit.el specifies, "a cons-cell
                                 ;; whose car evaluates to the standard
                                 ;; value"
                                 (list (list 'quote
                                             (list (concat el-get-dir (file-name-as-directory "yasnippet") "snippets"))))))
               ;; byte-compile load vc-svn and that fails
               ;; see https://github.com/dimitri/el-get/issues/200
               :compile nil)
        (:name liquid-mode
               :type git
               :url "git://github.com/rehanift/Emacs-Liquid.git"
               :post-init (lambda ()
                            (autoload 'liquid-mode "liquid" nil t)))
        ))

(setq my-packages
       (append
        my-packages
   (mapcar 'el-get-source-name el-get-sources)))

(el-get 'sync my-packages)

(add-to-list 'load-path "~/.emacs.d/vendor")

(require 'magit)
;; enable midnight mode
(require 'midnight)
(midnight-delay-set 'midnight-delay 3600)
(setq midnight-period 7200) ;; (eq (* 2 60 60) "2 hours")
(setq clean-buffer-list-delay-general 1)

(require 'iy-go-to-char)
(require 'ack)
(require 'kill-wspace-mode)
(autoload 'scss-mode "scss-mode")
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))

(add-to-list 'auto-mode-alist '("\\.ejs\\'" . html-mode))

(add-to-list 'auto-mode-alist '("\\.hbs\\'" . html-mode))

(add-to-list 'auto-mode-alist '("\\.liquid\\'" . liquid-mode))

(require 'filecache)

(autoload 'autopair-global-mode "autopair" nil t)
(setq autopair-pair-criteria 'always
      autopair-blink nil)

;; auto save and restore session
(desktop-save-mode 1)
(setq desktop-restore-eager 5)

;; No idle-highlight
(remove-hook 'coding-hook 'idle-highlight)

;; Start the emacs server
(server-start)
