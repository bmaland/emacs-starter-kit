;;; .loaddefs.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (rvm-open-gem rvm-use rvm-activate-corresponding-ruby
;;;;;;  rvm-use-default) "rvm" "rvm/rvm.el" (19781 48786))
;;; Generated autoloads from rvm/rvm.el

(autoload 'rvm-use-default "rvm" "\
use the rvm-default ruby as the current ruby version

\(fn)" t nil)

(autoload 'rvm-activate-corresponding-ruby "rvm" "\
activate the corresponding ruby version for the file in the current buffer.
This function searches for an .rvmrc file and actiavtes the configured ruby.
If no .rvmrc file is found, the default ruby is used insted.

\(fn)" t nil)

(autoload 'rvm-use "rvm" "\
switch the current ruby version to any ruby, which is installed with rvm

\(fn NEW-RUBY NEW-GEMSET)" t nil)

(autoload 'rvm-open-gem "rvm" "\
Not documented

\(fn GEMHOME)" t nil)

;;;***

;;;### (autoloads nil nil ("rhtml/rhtml-erb.el" "rhtml/rhtml-fonts.el"
;;;;;;  "rhtml/rhtml-mode.el" "rhtml/rhtml-navigation.el" "rhtml/rhtml-ruby-hook.el"
;;;;;;  "rhtml/rhtml-sgml-hacks.el") (19781 48985 744606))

;;;***

(provide '.loaddefs)
;; Local Variables:
;; version-control: never
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; .loaddefs.el ends here
