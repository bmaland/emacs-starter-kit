(if (eq window-system 'w32)
    (progn
      ;; append cygwin binaries to PATH
      (setenv "PATH" (concat (getenv "PATH") ";D:\\mingw\\msys\\1.0\\bin" ";D:\\emacs-23.3\\bin" ";C:\\git\\bin"))

      ;; set a proper font
      (set-default-font
       "-outline-Inconsolata-normal-r-normal-normal-16-97-96-96-c-*-iso8859-1")
      ))
