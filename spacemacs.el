;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

;; Configuration Layers
;; --------------------

(setq-default
 ;; List of additional paths where to look for configuration layers.
 ;; Paths must have a trailing slash (ie. `~/.mycontribs/')
 dotspacemacs-configuration-layer-path '("~/spacemacs/contrib/"
                                         "~/dot-spacemacs/contrib/usr/")
 ;; List of configuration layers to load. If it is the symbol `all' instead
 ;; of a list then all discovered layers will be installed.
 dotspacemacs-configuration-layers '(
                                     ;; layers
                                     auto-completion
                                     deft ;; capture notes
                                     git
                                     markdown
                                     org
                                     osx
                                     restclient
                                     reveal-in-finder
                                     syntax-checking
                                     version-control
                                     ;; web-mode ; TODO not found

                                     ;; language layers
                                     clojure
                                     python
                                     javascript
                                     lua

                                     ;; user layers
                                     frandibar
                                     )
 ;; A list of packages and/or extensions that will not be install and loaded.
 dotspacemacs-excluded-packages '()
 ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
 ;; are declared in a layer which is not a member of
 ;; the list `dotspacemacs-configuration-layers'
 dotspacemacs-delete-orphan-packages nil
)

;; Settings
;; --------

(setq-default
 ;; Specify the startup banner. If the value is an integer then the
 ;; banner with the corresponding index is used, if the value is `random'
 ;; then the banner is chosen randomly among the available banners, if
 ;; the value is nil then no banner is displayed.
 dotspacemacs-startup-banner 'random
 ;; List of themes, the first of the list is loaded when spacemacs starts.
 ;; Press <SPC> T n to cycle to the next theme in the list (works great
 ;; with 2 themes variants, one dark and one light)
 dotspacemacs-themes '(
                       monokai
                       solarized-light
                       solarized-dark
                       leuven
                       zenburn
                       )
 ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
 ;; size to make separators look not too crappy.
 ;; dotspacemacs-default-font '("Source Code Pro"
 ;;                             :size 13
 ;;                             :weight normal
 ;;                             :width normal
 ;;                             :powerline-scale 1.1)
 ;; The leader key
 dotspacemacs-leader-key "SPC"
 ;; Major mode leader key is a shortcut key which is the equivalent of
 ;; pressing `<leader> m`
 dotspacemacs-major-mode-leader-key ","
 ;; The command key used for Evil commands (ex-commands) and
 ;; Emacs commands (M-x).
 ;; By default the command key is `:' so ex-commands are executed like in Vim
 ;; with `:' and Emacs commands are executed with `<leader> :'.
 dotspacemacs-command-key ":"
 ;; Guide-key delay in seconds. The Guide-key is the popup buffer listing
 ;; the commands bound to the current keystrokes.
 dotspacemacs-guide-key-delay 0.4
 ;; If non nil a progress bar is displayed when spacemacs is loading. This
 ;; may increase the boot time on some systems and emacs builds, set it to nil
 ;; to boost the loading time.
 dotspacemacs-loading-progress-bar t
 ;; Enable micro-state for helm buffer when pressing on TAB."
 dotspacemacs-helm-micro-state t
 ;; If non nil the frame is fullscreen when Emacs starts up (Emacs 24.4+ only).
 dotspacemacs-fullscreen-at-startup nil
 ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
 ;; Use to disable fullscreen animations in OSX."
 dotspacemacs-fullscreen-use-non-native nil
 ;; If non nil the frame is maximized when Emacs starts up (Emacs 24.4+ only).
 ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
 dotspacemacs-maximized-at-startup t
 ;; A value from the range (0..100), in increasing opacity, which describes the
 ;; transparency level of a frame when it's active or selected. Transparency can
 ;; be toggled through `toggle-transparency'.
 dotspacemacs-active-transparency 90
 ;; A value from the range (0..100), in increasing opacity, which describes the
 ;; transparency level of a frame when it's inactive or deselected. Transparency
 ;; can be toggled through `toggle-transparency'.
 dotspacemacs-inactive-transparency 90
 ;; If non nil unicode symbols are displayed in the mode line (e.g. for lighters)
 dotspacemacs-mode-line-unicode-symbols t
 ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth scrolling
 ;; overrides the default behavior of Emacs which recenters the point when
 ;; it reaches the top or bottom of the screen
 dotspacemacs-smooth-scrolling t
 ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
 dotspacemacs-smartparens-strict-mode nil
 ;; If non nil advises quit functions to keep server open when quitting.
 dotspacemacs-persistent-server nil
 ;; The default package repository used if no explicit repository has been
 ;; specified with an installed package.
 ;; Not used for now.
 dotspacemacs-default-package-repository nil
 ;; Choose either vim or emacs style.
 dotspacemacs-editing-style 'vim
 ;; if non nil the loading prints logs in the `*Messages*` buffer. Default value is `nil`.
 dotspacemacs-verbose-loading nil
 ;; list of symbols to display recent items in the startup buffer, possible values are:  `recents`,`bookmarks` and `projects`
 dotspacemacs-startup-lists '(recents projects)
 )

;; Initialization Hooks
;; --------------------

(defun dotspacemacs/init ()
  "User initialization for Spacemacs. This function is called at the very
 startup."
  ;; Add marmalade package repository (necessary for ws-trim).
  ;; (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

  ;; Confirm when quitting Emacs.
  (setq confirm-kill-emacs (quote yes-or-no-p))

  ;; OS specific settings.
  (setq shell-file-name "/bin/bash")
  (setq explicit-shell-file-name "/bin/bash")

  (defvar calendar-date-style 'european)  ; dd/mm/yyyy

  ;; Sentences end with single space, so this fixes sentence navigation.
  ;; commands.
  (setq sentence-end-double-space nil)

  ;; Set window title to buffer-file-name.
  (setq frame-title-format '("" "Emacs - %b - " buffer-file-name))

  ;; Write backup files to own directory.
  ;; To disable backups, use `(setq backup-inhibited t)'.
  (setq backup-directory-alist
        `(("." . ,(expand-file-name
                   (concat user-emacs-directory "backups")))))

  ;; Disable auto save.
  (setq auto-save-default nil)

  ;; Use 'y' or 'n' instead of 'yes' or 'no' for answers.
  (fset 'yes-or-no-p 'y-or-n-p)

  ;; Reload file if changed on disk.
  (global-auto-revert-mode 1)

  ;; Display current function name in the mode line.
  (which-function-mode t)

  ;; Shut up compile saves.
  ;; More info: http://www.masteringemacs.org/articles/2012/05/29/compiling-running-scripts-emacs/
  (setq compilation-ask-about-save nil)
  ;; Don't save *anything*.
  (defvar compilation-save-buffers-predicate '(lambda () nil))

  (setq delete-by-moving-to-trash t)

  ;; Ignore case when reading a file name completion.
  (setq read-file-name-completion-ignore-case t)

  ;; Ignore case when reading a file name completion.
  (setq read-file-name-completion-ignore-case t)

  ;; Settings for all programming modes.

  ;; Show line numbers for all programming modes.
  (add-hook 'prog-mode-hook (lambda () (linum-mode 1)))

  ;; Set mode for unknown Fish shell configuration files.
  (add-to-list 'auto-mode-alist '("\\.fish\\'" . conf-mode))

; (use-package aggressive-indent
;   :config
;   (add-hook 'emacs-lisp-mode-hook #'aggressive-indent-mode))

  ;; Specify agenda files.
  (setq org-agenda-files (quote ("~/Dropbox/docs/cumples.org"
                                 "~/Dropbox/docs/agenda-personal.org"
                                 "~/xapo/agenda.org")))

  (defvar org-capture-templates
    '(("m" "movilidad")
      ("ma" "auto" entry (file+headline "~/Dropbox/docs/agenda-personal.org" "auto")
       "* %^t %^{prompt}")
      ("mm" "moto" entry (file+headline "~/Dropbox/docs/agenda-personal.org" "moto")
       "* %^t %^{prompt}")
      ("p" "personal" entry (file+headline "~/Dropbox/docs/agenda-personal.org" "personal")
       "* %^t %^{prompt}")
      ("h" "salud" entry (file+headline "~/Dropbox/docs/agenda-personal.org" "salud")
       "* %^t %^{prompt}")
      ("x" "xapo" entry (file+headline "~/xapo/agenda.org" "xapo")
       "* %^t %^{")
      ))

  )

(defun dotspacemacs/config ()
  "This is were you can ultimately override default Spacemacs configuration.
This function is called at the very end of Spacemacs initialization."

  ;; Use special `lisp-state' for lisp.
  (add-hook 'emacs-lisp-mode-hook 'evil-lisp-state)

  ;; Show git gutter marks on the left
  (setq git-gutter-fr:side 'left-fringe)

  ;; Remap C-e to move cursor to end of line, instead of the default
  ;; behavior of copying from below (evil-copy-from-below)
  (define-key evil-insert-state-map "\C-e" 'move-end-of-line)

  ;; Consider _ as part of a word.
  (add-hook 'python-mode-hook (lambda () (modify-syntax-entry ?_ "w")))

  ;; Use paxedit for certain modes and
  (dolist (mode '(clojure-mode-hook
                  hy-mode-hook
                  emacs-lisp-mode-hook
                  lisp-interaction-mode-hook
                  cider-mode-hook))
    (add-hook mode 'paredit-mode)
    ;; consider - as part of a word.
    (add-hook mode (lambda () (modify-syntax-entry ?- "w"))))

  (global-set-key (kbd "M-SPC") 'cycle-spacing)


  (setq deft-directory "~/Documents/deft")
  (setq deft-extension "org")
  (setq deft-text-mode 'org-mode)
  (setq deft-use-filename-as-title t)
  (setq deft-auto-save-interval 0)
  )

;; Custom variables
;; ----------------

;; Do not write anything in this section. This is where Emacs will
;; auto-generate custom variable definitions.

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-ispell-requires 4 t)
 '(ahs-case-fold-search nil)
 '(ahs-default-range (quote ahs-range-whole-buffer))
 '(ahs-idle-interval 0.25)
 '(ahs-idle-timer 0 t)
 '(ahs-inhibit-face-list nil)
 '(custom-safe-themes
   (quote
    ("64581032564feda2b5f2cf389018b4b9906d98293d84d84142d90d7986032d33" "9dae95cdbed1505d45322ef8b5aa90ccb6cb59e0ff26fef0b8f411dfc416c552" default)))
 '(elpy-modules
   (quote
    (elpy-module-company elpy-module-eldoc elpy-module-flymake elpy-module-pyvenv elpy-module-yasnippet elpy-module-sane-defaults)))
 '(expand-region-contract-fast-key "V")
 '(expand-region-reset-fast-key "r")
 '(js2-strict-missing-semi-warning nil)
 '(js2-strict-trailing-comma-warning nil)
 '(neo-show-hidden-files nil)
 '(paradox-github-token t)
 '(ring-bell-function (quote ignore) t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((((class color) (min-colors 257)) (:foreground "#F8F8F2" :background "#272822")) (((class color) (min-colors 89)) (:foreground "#F5F5F5" :background "#1B1E1C"))))
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
