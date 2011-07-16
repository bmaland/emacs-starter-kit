(add-to-list 'auto-mode-alist '("\\.js$" . js3-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . js3-mode))

(add-hook 'js3-mode-hook
          '(lambda ()
             (pretty-lambdas)
             (coding-hook)
             (autopair-mode)
             ;;(moz-minor-mode 1)
             (subword-mode 1)

             (setq js3-auto-indent-p t
                   js3-enter-indents-newline t
                   js3-indent-on-enter-key t)

             (local-set-key (kbd "C-c C-z") 'run-mozilla)
             (local-set-key [return] 'newline-and-indent)
             ))
