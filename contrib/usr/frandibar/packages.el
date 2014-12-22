(defvar frandibar-packages '(multiple-cursors)
  "List of all packages to install and/or initialize. Built-in packages
which require an initialization must be listed explicitly in the list.")

(defvar frandibar-excluded-packages '()
  "List of packages to exclude.")

(defun frandibar/init-multiple-cursors ()
  (use-package multiple-cursors
    :bind (("M-m" . mc/edit-lines)
           ("C->" . mc/mark-next-like-this)
           ("C-<" . mc/mark-previous-like-this)
           ("C-;" . mc/mark-all-like-this)) ; binding used by iedit
    )
  )
