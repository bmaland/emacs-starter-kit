(if (or (eq window-system 'mac) (eq window-system 'ns))
    (progn
      (setq browse-url-browser-function 'browse-url-default-macosx-browser)

      (defun dired-open-mac ()
        (interactive)
        (let ((file-name (dired-get-file-for-visit)))
          (if (file-exists-p file-name)
              (call-process "/usr/bin/open" nil 0 nil file-name))))
      (add-hook 'dired-mode-hook
                '(lambda ()
                   (define-key dired-mode-map "o" 'dired-open-mac)))

      (setq mac-option-modifier 'none
            mac-command-modifier 'meta)))
