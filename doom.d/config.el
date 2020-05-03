;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Thorsten Lorenz"
      user-mail-address "thlorenz@gmx.de")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "Source Code Pro" :size 12))


;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/dotfiles/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.

;; fix forward jump via C-i in terminal
(setq local-function-key-map (delq '(kp-tab . [9]) local-function-key-map))
(global-set-key (kbd "C-i") 'evil-jump-forward)

;; navigate buffers with C-{hjkl}
;; (define-key evil-normal-state-map (kbd "C-h") #'evil-window-left)
;; (define-key evil-normal-state-map (kbd "C-j") #'evil-window-down)
;; (define-key evil-normal-state-map (kbd "C-k") #'evil-window-up)
;; (define-key evil-normal-state-map (kbd "C-l") #'evil-window-right)
(use-package! tmux-pane
  :config
  (tmux-pane-mode))

;; no backup/lock files
(setq make-backup-files nil)
(setq create-lockfiles nil)

;; typescript/javascript formatting with prettier
(use-package! prettier-js
  :commands (typescript-mode js2-mode))
(use-package! add-node-modules-path
  :commands (typescript-mode js2-mode))

(eval-after-load 'js2-mode
  '(progn
    (add-hook 'js2-mode-hook #'add-node-modules-path)
    (add-hook 'js2-mode-hook #'prettier-js-mode)
    (add-hook 'typescript-mode-hook (lambda () (setq-local global-hl-line-mode -1)))))
(eval-after-load 'typescript-mode
  '(progn
    (add-hook 'typescript-mode-hook #'add-node-modules-path)
    (add-hook 'typescript-mode-hook #'prettier-js-mode)
    (add-hook 'typescript-mode-hook (lambda () (setq-local global-hl-line-mode -1)))))

(map! :leader :desc "rename" "r" #'tide-rename-symbol)

;; projectile
(setq projectile-project-search-path '(
  "/Volumes/d/dotfiles/doom.d"
  "/Volumes/d//dev/cy/cypress-node"
  "/Volumes/d/dev/ts/macualay"
  "/Volumes/d/dev/gdev/flutter/ufo-2d"
  "/Volumes/d/dev/flutter/projects"))

;; theme
(setq doom-theme 'wombat)

;; org mode
(eval-after-load 'org '(require 'ox-gfm nil t))

;; clipboard
(defun copy-from-osx ()
  (shell-command-to-string "pbpaste"))

(defun paste-to-osx (text &optional push)
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
      (process-send-string proc text)
      (process-send-eof proc))))

(setq interprogram-cut-function 'paste-to-osx)
(setq interprogram-paste-function 'copy-from-osx)

;; which-key
(setq which-key-idle-delay 0.2)

;; improving appearance of company popups
(eval-after-load 'company
  '(progn
    (custom-set-faces
      '(company-tooltip
        ((t (:background "lightgreen" :foreground "darkblue"))))
      '(company-tooltip-selection
        ((t (:background "steelblue" :foreground "white"))))
      '(company-tooltip-common
        ((((type x)) (:inherit company-tooltip :weight bold))
          (t (:inherit company-tooltip))))
      '(company-tooltip-common-selection
        ((((type x)) (:inherit company-tooltip-selection :weight bold))
          (t (:inherit company-tooltip-selection)))))
     ))
