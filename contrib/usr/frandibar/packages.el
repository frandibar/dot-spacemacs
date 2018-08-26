(defvar frandibar-packages '(
                             blacken ;; python code formatter
                             dockerfile-mode
                             smartscan
                             )
  "List of all packages to install and/or initialize. Built-in packages
which require an initialization must be listed explicitly in the list.")

(defvar frandibar-excluded-packages '()
  "List of packages to exclude.")

(defun frandibar/init-dockerfile-mode ()
  (use-package dockerfile-mode))

(defun frandibar/init-smartscan ()
  ;; Jumps between other symbols found at point.
  (use-package smartscan
    :config
    (global-smartscan-mode 1))
  )

(defun frandibar/init-blacken ()
  (use-package blacken
    :config
    ;; python reformatting upon save with black
    (add-hook 'before-save-hook 'frandibar/py-format-with-isort-and-black-before-save)
    ))
