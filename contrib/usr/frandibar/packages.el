(defvar frandibar-packages '(
                             ;; elpy
                             ;; jedi

                             ;; 4clojure
                             ;; clojure-mode-extra-font-locking

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
