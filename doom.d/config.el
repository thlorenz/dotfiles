;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

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

(setq user-full-name "Thorsten Lorenz"
      user-mail-address "thlorenz@gmx.de"

      make-backup-files nil
      create-lockfiles nil

      display-line-numbers t
      doom-font (font-spec :family "Source Code Pro" :size 14)


      compilation-scroll-output t

      org-directory "~/dotfiles/org/"
      which-key-idle-delay 0.2
      projectile-indexing-method 'alien)

;; typescript/javascript formatting with prettier
(use-package! add-node-modules-path
  :commands (typescript-mode js2-mode))
(eval-after-load 'js2-mode
  (add-hook 'js2-mode-hook #'add-node-modules-path))
(eval-after-load 'typescript-mode
  '(progn
     (setq compile-command "tsc -b")
     (add-hook 'js2-mode-hook #'add-node-modules-path)))

(eval-after-load "evil"
  '(progn
     (define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
     (define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
     (define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
     (define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)))

;; org
(global-set-key (kbd "C-c l") 'org-store-link)

;; elisp
(use-package! format-all
  :init
  (add-hook 'emacs-lisp-mode 'format-all-mode))

;; company
(use-package! company
  :init
  (setq company-idle-delay nil
        company-tooltip-align-annotations t)
  :hook (after-init . global-company-mode)
  :bind
  (:map prog-mode-map
   ("C-i" . company-indent-or-complete-common)
   ("C-M-i" . completion-at-point)))

;; documentation
(define-key evil-normal-state-map "gh" 'dash-at-point)

;; elisp
(define-key evil-normal-state-map "g'" 'eval-last-sexp )
(define-key evil-normal-state-map "g\"" 'eval-defun)

;; TODO: non ui settings
;; (setq doom-theme 'wombat)
;;
;;(defun paste-to-osx (text &optional push)
;;  (let ((process-connection-type nil))
;;    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
;;      (process-send-string proc text)
;;      (process-send-eof proc))))
;;
;;(setq interprogram-cut-function 'paste-to-osx)
;;
;; improving appearance of company popups
;;(eval-after-load 'company
;;  '(progn
;;     (custom-set-faces
;;      '(company-tooltip
;;        ((t (:background "lightgreen" :foreground "darkblue"))))
;;      '(company-tooltip-selection
;;        ((t (:background "steelblue" :foreground "white"))))
;;      '(company-tooltip-common
;;        ((((type x)) (:inherit company-tooltip :weight bold))
;;         (t (:inherit company-tooltip))))
;;      '(company-tooltip-common-selection
;;        ((((type x)) (:inherit company-tooltip-selection :weight bold))
;;         (t (:inherit company-tooltip-selection)))))
;;     ))
;;
;;(use-package! tmux-pane
;;  :config
;;  (tmux-pane-mode))
;;
;; (setq local-function-key-map (delq '(kp-tab . [9]) local-function-key-map))
;; (global-set-key (kbd "C-i") 'evil-jump-forward)
