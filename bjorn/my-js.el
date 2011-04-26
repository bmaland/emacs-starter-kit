(add-to-list 'auto-mode-alist '("\\.js$" . js-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . js-mode))

(add-hook 'js-mode-hook
          '(lambda ()
             (pretty-lambdas)
             (coding-hook)
             (autopair-mode)
             (moz-minor-mode 1)
             (subword-mode 1)

             (local-set-key (kbd "C-c C-z") 'run-mozilla)
             (local-set-key [return] 'newline-and-indent)
             ))
