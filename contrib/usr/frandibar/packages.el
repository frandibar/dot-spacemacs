(defvar frandibar-packages '(
                             ;; elpy
                             ;; jedi
                             yaml-mode
                             dockerfile-mode

                             paxedit ;; minor mode for lisp

                             ;; Interactive clojure problems
                             ;; 4clojure

                             blacken ;; python code formatter
                             py-isort

                             htmlize
                             git-gutter-fringe
                             ;; multiple-cursors
                             password-store
                             restclient
                             smartscan
                             ws-butler
                             )
  "List of all packages to install and/or initialize. Built-in packages
which require an initialization must be listed explicitly in the list.")

(defvar frandibar-excluded-packages '()
  "List of packages to exclude.")

;; (defun frandibar/init-elpy ()
;;   ;; Emacs Python Development Environment.
;;   (use-package elpy
;;     :config
;;     (progn
;;       (setq elpy-rpc-backend "jedi")
;;       (elpy-use-ipython)
;;       (setq python-shell-interpreter-args "-i --colors Linux")
;;       (setq python-shell-interpreter "/usr/local/bin/ipython")
;;       (setq elpy-default-minor-modes '(eldoc-mode
;;                                        yas-minor-mode
;;                                        auto-complete-mode))))
;;   (elpy-enable)
;;   )

;; (defun frandibar/init-jedi ()
;;   (use-package jedi))

(defun frandibar/init-yaml-mode ()
  (use-package yaml-mode))

(defun frandibar/init-dockerfile-mode ()
  (use-package dockerfile-mode))

(defun frandibar/init-deft ()
  (use-package deft
    :config
    (setq deft-directory "~/Documents/deft")
    (setq deft-extension "org")
    (setq deft-text-mode 'org-mode)
    (setq deft-use-filename-as-title t)
    (setq deft-auto-save-interval 0)))

(defun frandibar/init-git-gutter-fringe ()
  (use-package git-gutter-fringe))

;; (defun frandibar/init-multiple-cursors ()
;;   (use-package multiple-cursors
;;     :bind (("M-m" . mc/edit-lines)
;;            ("C->" . mc/mark-next-like-this)
;;            ("C-<" . mc/mark-previous-like-this)
;;            ("C-;" . mc/mark-all-like-this)) ; binding used by iedit
;;     )
;;   )

(defun frandibar/init-smartscan ()
  ;; Jumps between other symbols found at point.
  (use-package smartscan
    :config
    (global-smartscan-mode 1))
  )

(defun frandibar/init-ws-butler ()
  ;; Remove trailing whitespace on modified lines ONLY.
  (use-package ws-butler
    :config
    (progn
      (ws-butler-global-mode 1))))

(defun frandibar/init-paxedit ()
  (use-package paxedit
    :bind (("M-<right>" . paxedit-transpose-forward)
           ("M-<left>" . paxedit-transpose-backward)
           ("M-<up>" . paxedit-backward-up)
           ("M-<down>" . paxedit-backward-end)
           ("M-b" . paxedit-previous-symbol)
           ("M-f" . paxedit-next-symbol)
           ("C-%" . paxedit-copy)
           ("C-&" . paxedit-kill)
           ("C-*" . paxedit-delete)
           ("C-^" . paxedit-sexp-raise)
           ("M-u" . paxedit-symbol-change-case)
           ("C-@" . paxedit-symbol-copy)
           ("C-#" . paxedit-symbol-kill))
    ))

(defun frandibar/init-py-isort ()
  (use-package py-isort
    :config
    ;; commented out since I need to guarantee order (see my-python-hooks in init.el instead)
    ;; this hook should execute before the blacken hook as it formats differently
    ;; (add-hook 'before-save-hook 'py-isort-before-save t)
    ))

(defun frandibar/init-blacken ()
  (use-package blacken
    :config
    ;; commented out since I need to guarantee order (see my-python-hooks in init.el instead)
    ;; python reformatting upon save with black
    ;; (add-hook 'python-mode-hook 'blacken-mode)
    ))
