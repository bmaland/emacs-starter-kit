(global-set-key (kbd "C-c f") 'iy-go-to-char)
(global-set-key (kbd "C-c F") 'iy-go-to-char-backward)
(global-set-key (kbd "C-c ;") 'iy-go-to-char-continue)
(global-set-key (kbd "C-c ,") 'iy-go-to-char-continue-backward)

(global-set-key (kbd "C-c r") 'org-remember)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(global-set-key (kbd "C-<return>") 'join-line)

(global-set-key (kbd "C-o") '(lambda ()
                               (interactive)
                               (open-line 1)
                               (next-line)
                               (indent-according-to-mode)
                               (previous-line)))

(global-set-key (kbd "C-M-q") 'indent-region)

;; Align your code in a pretty way.
(global-set-key (kbd "C-x a r") 'align-regexp)
(global-set-key (kbd "C-x a ,") 'align-to-comma)
(global-set-key (kbd "C-x a :") 'align-to-colon)
(global-set-key (kbd "C-x a >") 'align-to-hash)
(global-set-key (kbd "C-x a =") 'align-to-equals)

;; folding
(global-set-key (kbd "C-c S") 'fold-dwim-show-all)
(global-set-key (kbd "C-c H") 'hs-hide-level)
(global-set-key (kbd "C-c s") 'fold-dwim-toggle)

;; Completion that uses many different methods to find options.
(global-set-key (kbd "M-/") 'hippie-expand)

(global-set-key (kbd "M-p") 'backward-to-non-whitespace)

;; Jump to a definition in the current file. (This is awesome.)
(global-set-key "\C-x\C-i" 'ido-imenu)

;; Movement for windows and buffers
;;(windmove-default-keybindings) ;; Shift+direction

(global-set-key [(control shift right)]       'next-user-buffer)
(global-set-key [(control shift left)]        'previous-user-buffer)

(global-set-key (kbd "C-x r i")               'string-insert-rectangle)

;;; WINDOW SPLITING
(global-set-key (kbd "M-0") 'delete-window) ; was digit-argument
(global-set-key (kbd "M-1") 'delete-other-windows) ; was digit-argument
(global-set-key (kbd "M-o") 'other-window) ; was prefix

;; File finding
(global-set-key (kbd "C-x M-f")   'ido-find-file-other-window)
(global-set-key (kbd "C-x C-M-f") 'find-file-in-project)
(global-set-key (kbd "C-x f")     'recentf-ido-find-file)
(global-set-key (kbd "C-x C-p")   'find-file-at-point)
(global-set-key (kbd "C-c y")     'bury-buffer)
(global-set-key (kbd "M-`")       'file-cache-minibuffer-complete)
(global-set-key (kbd "C-x C-b")   'ibuffer)
(global-set-key (kbd "C-x C-d")   'dired)

;; Use regex searches by default.
(global-set-key "\C-s"    'isearch-forward-regexp)
(global-set-key "\C-r"    'isearch-backward-regexp)
(global-set-key "\C-\M-s" 'isearch-forward)
(global-set-key "\C-\M-r" 'isearch-backward)

(global-set-key "\M-%"     'query-replace-regexp)

(global-set-key (kbd "C-c ;")   'comment-or-uncomment-region)
(global-set-key (kbd "C-x ;")   'comment-or-uncomment-region)
(global-set-key "\M-#"          'calc)
(global-set-key "\C-xf"         'recentf-ido-find-file)
(global-set-key "\C-xx"         'file-cache-ido-find-file)
(global-set-key "\M-`"          'ff-find-other-file)
(global-set-key "\C-c1"         'find-grep-dired)
(global-set-key "\C-c2"         'grep-find)
(global-set-key "\C-z"          'undo)
(global-set-key "\C-x\C-m"      'execute-extended-command)
(global-set-key "\C-c\C-m"      'execute-extended-command)

(global-set-key "\C-w"          'backward-kill-word)
(global-set-key (kbd "C-x w")   'backward-kill-sexp)
(global-set-key (kbd "M-SPC")   'delete-horizontal-space)

(global-set-key "\C-cc"         'jao-copy-line)
(global-set-key "\C-\M-w"       'my-mark-word)
(global-set-key (kbd "M-@")     'my-mark-word)
(global-set-key (kbd "M-\"")    'select-text-in-quote)
(global-set-key (kbd "M-2")     'extend-selection)
(global-set-key "\C-x\C-k"      'kill-region)
(global-set-key "\C-c\C-k"      'kill-region)
(global-set-key "\C-j"          'newline)
(global-set-key (kbd "C-x C-r") 'find-alternative-file-with-su)
(global-set-key [f5]            'bookmark-set)
(global-set-key [f6]            'bookmark-jump)
(global-set-key (kbd "TAB")     'indent-according-to-mode)
(global-set-key [backspace]     'delete-empty-pair)
(global-set-key (kbd "C-x M-f") 'ido-find-file-other-window)
(global-set-key (kbd "M-SPC")   'set-mark-command)
(global-set-key (kbd "C-x m")   'magit-status-fullscreen)
(global-set-key (kbd "s-s")     'sr-speedbar-toggle)

;; TextMate inspired bindings
(global-set-key (kbd "M-RET") 'insert-line-below)
(global-set-key (kbd "M-S-<return>") '(lambda ()
                                        (interactive)
                                        (previous-line)
                                        (insert-line-below)))
(global-set-key [(control shift k)] 'kill-whole-line)
(global-set-key [(control shift d)] 'duplicate-line)
(global-set-key [(control shift iso-lefttab)] 'textmate-shift-left)
(global-set-key [(control tab)] 'textmate-shift-right)

(global-set-key (kbd "C-x gf") 'textmate-goto-file)
(global-set-key (kbd "M-g f") 'textmate-goto-file)
(global-set-key (kbd "C-x gs") 'textmate-goto-symbol)
;; (global-set-key (kbd "C-x ga") 'ack-in-project)
;; (global-set-key (kbd "C-x gd") 'google-define))

(when window-system
  (global-set-key (kbd "C-x C-c") 'ask-before-closing))

(provide 'my-bindings)
