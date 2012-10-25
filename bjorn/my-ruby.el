;;(setq rinari-tags-file-name "TAGS")

;;(load "~/.emacs.d/vendor/rdoc-mode.el")

(add-hook 'ruby-mode-hook
          '(lambda ()
             ;;(rvm-activate-corresponding-ruby)
             (setq ruby-deep-indent-paren nil)
             (setq c-tab-always-indent nil)
             (setq ruby-use-encoding-map nil)
             (require 'ruby-electric)
             (require 'ruby-style)
             (require 'rcodetools)
             (ruby-electric-mode t)
             (require 'ruby-compilation)
             (coding-hook)
             (set-pairs '("(" "{" "[" "\"" "\'" "|"))
             (inf-ruby-keys)
             (local-set-key [return] 'reindent-then-newline-and-indent)
             (local-set-key [f1] 'yari)
             ;;(local-set-key (kbd "C-h r") 'yari)
             (local-set-key (kbd "C-x C-t") 'transpose-lines)
             ;;(local-set-key (kbd "C-c C-c") 'ruby-compilation-this-buffer)
             (local-set-key (kbd "M-e") 'ruby-forward-sexp)
             (local-set-key (kbd "M-a") 'ruby-backward-sexp)
             ;;(local-set-key [tab] 'ri-ruby-complete-symbol)
             ;;(local-set-key "\C-c\C-a" 'ri-ruby-show-args)
             ))

;;; rhtml mode
;;(add-to-list 'load-path "~/.emacs.d/vendor/rhtml")
;;(require 'rhtml-mode)

;; ruby-test
;;(require 'ruby-test)

;; (add-hook 'rhtml-mode-hook
;;           (lambda () (rinari-launch)))

;; find-file-at-point help

;; (defun ruby-module-path (module)
;;     (shell-command-to-string
;;      (concat
;;       "ruby -e "
;;       "\"ret='()';$LOAD_PATH.each{|p| "
;;       "x=p+'/'+ARGV[0].gsub('.rb', '')+'.rb';"
;;       "ret=File.expand_path(x)"
;;       "if(File.exist?(x))};printf ret\" "
;;       module)))

;; (eval-after-load "ffap"
;;   '(push '(ruby-mode . ruby-module-path) ffap-alist))

;;; Rake

;; (defun pcomplete/rake ()
;;   (pcomplete-here (pcmpl-rake-tasks)))

;; (defun pcmpl-rake-tasks ()
;;    "Return a list of all the rake tasks defined in the current
;; projects.  I know this is a hack to put all the logic in the
;; exec-to-string command, but it works and seems fast"
;;    (delq nil (mapcar '(lambda(line)
;;       (if (string-match "rake \\([^ ]+\\)" line) (match-string 1 line)))
;;          (split-string (shell-command-to-string "rake -T") "[\n]"))))

;; (defun rake (task)
;;   (interactive (list (completing-read "Rake (default: default): "
;;                                       (pcmpl-rake-tasks))))
;;   (shell-command-to-string (concat "rake " (if (= 0 (length task)) "default" task))))

;; Clear the compilation buffer between test runs.
;; (eval-after-load 'ruby-compilation
;;   '(progn
;;      (defadvice ruby-do-run-w/compilation (before kill-buffer (name cmdlist))
;;        (let ((comp-buffer-name (format "*%s*" name)))
;;          (when (get-buffer comp-buffer-name)
;;            (with-current-buffer comp-buffer-name
;;              (delete-region (point-min) (point-max))))))
;;      (ad-activate 'ruby-do-run-w/compilation)))

;;; Flymake

;; (eval-after-load 'ruby-mode
;;   '(progn
;;      (require 'flymake)
;;      (when (boundp 'rinari) (require 'rinari))

;;      ;; Invoke ruby with '-c' to get syntax checking
;;      (defun flymake-ruby-init ()
;;        (let* ((temp-file (flymake-init-create-temp-buffer-copy
;;                           'flymake-create-temp-inplace))
;;               (local-file (file-relative-name
;;                            temp-file
;;                            (file-name-directory buffer-file-name))))
;;          (list "ruby" (list "-c" local-file))))

;;      (push '(".+\\.rb$" flymake-ruby-init) flymake-allowed-file-name-masks)
;;      (push '("Rakefile$" flymake-ruby-init) flymake-allowed-file-name-masks)

;;      (push '("^\\(.*\\):\\([0-9]+\\): \\(.*\\)$" 1 2 nil 3)
;;            flymake-err-line-patterns)

;;      (add-hook 'ruby-mode-hook
;;                (lambda ()
;;                  (when (and buffer-file-name
;;                             (file-writable-p
;;                              (file-name-directory buffer-file-name))
;;                             (file-writable-p buffer-file-name))
;;                    (local-set-key (kbd "C-c d") 'flymake-display-err-menu-for-current-line)
;;                    (flymake-mode t))))))

(provide 'my-ruby)
