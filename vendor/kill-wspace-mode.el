(define-minor-mode
  kill-wspace-mode
  "Kill Wspace mode"
  :global t
  :lighter " kws"
  (if kill-wspace-mode
      (progn
        (add-hook 'before-save-hook 'delete-trailing-whitespace)
        (add-hook 'before-save-hook 'untabify-buffer))
    (progn
      (remove-hook 'before-save-hook 'delete-trailing-whitespace)
      (remove-hook 'before-save-hook 'untabify-buffer))))

(add-hook 'kill-wspace-unload-hook (lambda () (kill-wspace-mode 0)))

(provide 'kill-wspace-mode)
