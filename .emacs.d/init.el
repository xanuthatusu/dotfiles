;; Minimal UI
(scroll-bar-mode -1)
(tool-bar-mode   -1)
(tooltip-mode    -1)
(menu-bar-mode   -1)

(setq inhibit-startup-screen t)
(setq initial-scratch-message nil)
(setq exec-path (append exec-path '("~/go/bin")))

(add-to-list 'default-frame-alist '(font . "Iosevka-14"))
(set-face-attribute 'default t :font "Iosevka-14")

(save-place-mode 1)
(recentf-mode 1)
(setq-default recent-save-file "~/.emacs.d/recentf")

;; Package configs
(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(("org"   . "http://orgmode.org/elpa/")
             ("gnu"   . "http://elpa.gnu.org/packages/")
             ("melpa" . "http://melpa.org/packages/")))
             ;; ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)

;; Bootstrap `use-package`
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

(setq scroll-step 1)
(setq scroll-margin 5)

;; Come to the Dark Side...
(use-package evil
  :ensure t
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1))

;; Behold, the Gruvbox of Doom!
(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-gruvbox t)
  (doom-themes-org-config)
  (doom-themes-treemacs-config))
(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode))

;; Squire! Bring me my Helm!
(use-package helm
  :ensure t
  :init
  (setq helm-mode-fuzzy-match t)
  (setq helm-completion-in-region-fuzzy-match t)
  (setq helm-candidate-number-list 500)
  :config
  (helm-mode 1))

;; Which key?
(use-package which-key
  :ensure t
  :init
  (setq which-key-separator " ")
  (setq which-key-prefix-prefix "+")
  :config
  (which-key-mode))

;; One Key to bring them all, and in the darkness bind them
(use-package general
  :ensure t
  :config
  (general-define-key
   :states '(normal visual insert emacs treemacs magit)
   :keymaps '(global magit-mode-map)
   :prefix "SPC"
   :non-normal-prefix "M-SPC"

   "TAB" '(evil-switch-to-windows-last-buffer :which-key "previous buffer")
   "SPC" '(helm-M-x :which-key "M-x")
   "/" '(projectile-grep :which-key "grep in project")
   ";" '(eval-expression :which-key "eval")
   "c" 'comment-line
   ;; Files
   "f" '(:ignore t :which-key "files")
   "ff" 'projectile-find-file
   "fp" 'projectile-switch-project
   "fg" 'find-file
   "ft" 'treemacs
   "fr" 'helm-recentf
   "fc" '(lambda() (interactive)(find-file "~/.emacs.d/init.el") :which-key "open config")
   "fo" '(lambda() (interactive)(find-file "~/org/work.org") :which-key "open work.org")
   ;; Buffers
   "b" '(:ignore t :which-key "buffers")
   "bb" '(helm-mini :which-key "buffer list")
   "bn" '(switch-to-next-buffer :which-key "next buffer")
   "bp" '(switch-to-previous-buffer :which-key "previous buffer")
   "bd" '(evil-delete-buffer :which-key "delete buffer")
   ;; Windows
   "w" '(:ignore t :which-key "windows")
   "wo" 'other-frame
   "wj" 'evil-window-down
   "wk" 'evil-window-up
   "wh" 'evil-window-left
   "wl" 'evil-window-right
   "wq" 'evil-window-delete
   "wv" 'split-window-below
   "ws" 'split-window-right
   ;; magit
   "g" '(:ignore t :which-key "magit")
   "gs" 'magit-status)
  (general-define-key
   :states 'normal
   :keymaps 'org-mode-map
   [remap outline-toggle-children] 'org-cycle)
  (general-define-key
   :states 'visual
   :prefix "SPC"
   "c" 'comment-dwim))

(use-package magit
  :ensure t)

(use-package evil-magit
  :ensure t)

(use-package magit-todos
  :ensure t
  :hook (magit-mode . magit-todos-mode))

(use-package git-gutter
  :ensure t
  :hook (prog-mode . git-gutter-mode)
  :config
  (custom-set-variables
   '(git-gutter:modified-sign "==")
   '(git-gutter:added-sign "++")
   '(git-gutter:deleted-sign "--"))

  (set-face-foreground 'git-gutter:modified "#458588")
  (set-face-foreground 'git-gutter:added "#98971a")
  (set-face-foreground 'git-gutter:deleted "#cc241d"))

(use-package origami
  :ensure t)

(use-package projectile
  :ensure t
  :config
  (projectile-mode +1))

(use-package helm-projectile
  :ensure t
  :config
  (helm-projectile-on))

(use-package treemacs
  :ensure t
  :defer t)

(use-package treemacs-evil
  :after treemacs evil
  :ensure t)

(use-package treemacs-projectile
  :after treemacs projectile
  :ensure t)

(use-package treemacs-icons-dired
  :after treemacs dired
  :ensure t
  :config (treemacs-icons-dired-mode))

(use-package treemacs-magit
  :after treemacs magit
  :ensure t)

(use-package hl-todo
  :ensure t
  :hook (prog-mode . hl-todo-mode))

;; TODO convert this to use-package
(defun line-numbers()
    "Use `display-line-number-mode` as linum-mode's backend for smooth performance."
    (setq linum-relative-backend 'display-line-numbers-mode)
    (use-package linum-relative
      :ensure t)
    (display-line-numbers-mode)
    (linum-relative-mode))
(add-hook 'prog-mode-hook 'line-numbers)

;; Completion
(use-package company
  :ensure t
  :init
  (add-hook 'after-init-hook 'global-company-mode)
  :config
  (setq company-idle-delay 0.3)
  (setq company-minimum-prefix-length 1)
  (setq company-tooltip-align-annotations t))

;; Tabnine
(use-package company-tabnine
  :ensure t
  :config
  (add-to-list 'company-backends #'company-tabnine)
  (setq company-idle-delay 0))

(use-package autopair
  :ensure t
  :hook (prog-mode . autopair-mode))

;; Go mode
(use-package exec-path-from-shell
  :ensure t
  :if (memq window-system '(mac ns))
  :config
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "GOPATH")
  (exec-path-from-shell-copy-env "GOROOT"))
(use-package go-mode
  :ensure t
  :init
  (progn
    (setq gofmt-command "goimports")
    (add-hook 'before-save-hook 'gofmt-before-save))
  :config
  (add-hook 'go-mode-hook
	    (lambda ()
	      (setq indent-tabs-mode 1)
	      (setq tab-width 4))))
(use-package flycheck
  :ensure t)
  ;:init
  ;(add-hook 'go-mode-hook 'flycheck-mode))

;; Typescript
;; from the Tide README
(use-package tide
  :ensure t
  :after (typescript-mode company flycheck)
  :hook ((typescript-mode . tide-setup)
         (typescript-mode . tide-hl-identifier-mode)
         (before-save . tide-format-before-save)))

(use-package web-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
  (add-hook 'web-mode-hook
            (lambda ()
              (when (string-equal "tsx" (file-name-extension buffer-file-name))
                (setup-tide-mode))))
  (add-hook 'web-mode-hook 'flycheck-mode)
  (flycheck-add-mode 'javascript-eslint 'web-mode)
  :custom
  (web-mode-javascript-indentation 2))

;; Snippets
(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1))

;; LSP
(use-package lsp-mode
  :ensure t
  :commands lsp
  :hook (go-mode . lsp)
  :config
  (setq lsp-prefer-flymake nil))
(use-package lsp-ui
  :ensure t
  :after lsp-mode
  :init
  ;(add-hook 'lsp-mode-hook 'lsp-ui-mode)
  :config
  (setq lsp-ui-doc-border "white")
  (setq lsp-ui-doc-max-height 50)
  (setq lsp-ui-doc-use-webkit t)
  (setq lsp-ui-flycheck-enable t))
(use-package company-lsp
  :ensure t
  :after (lsp-mode company)
  :config
  (push 'company-lsp company-backends))
(use-package lsp-treemacs
  :ensure t)

(use-package highlight-indent-guides
  :ensure t
  :hook (prog-mode . highlight-indent-guides-mode)
  :config
  (setq highlight-indent-guides-method 'character)
  (setq highlight-indent-guides-responsive 'top))

(use-package protobuf-mode
  :ensure t)

(use-package org
  :ensure t
  :init
  (setq org-hide-emphasis-markers t)
  (font-lock-add-keywords 'org-mode
                          '(("^ *\\([-]\\) "
                             (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))
  (let* ((variable-tuple
        (cond ((x-list-fonts "Iosevka")         '(:font "Iosevka"))
              ((x-list-fonts "Source Sans Pro") '(:font "Source Sans Pro"))
              ((x-list-fonts "Lucida Grande")   '(:font "Lucida Grande"))
              ((x-list-fonts "Verdana")         '(:font "Verdana"))
              ((x-family-fonts "Sans Serif")    '(:family "Sans Serif"))
              (nil (warn "Cannot find a Sans Serif Font.  Install Source Sans Pro."))))
       (base-font-color     (face-foreground 'default nil 'default))
       (headline           `(:inherit default :weight bold :foreground ,base-font-color)))

  (custom-theme-set-faces
   'user
   `(org-level-8 ((t (,@headline ,@variable-tuple))))
   `(org-level-7 ((t (,@headline ,@variable-tuple))))
   `(org-level-6 ((t (,@headline ,@variable-tuple))))
   `(org-level-5 ((t (,@headline ,@variable-tuple))))
   `(org-level-4 ((t (,@headline ,@variable-tuple :height 1.1))))
   `(org-level-3 ((t (,@headline ,@variable-tuple :height 1.25))))
   `(org-level-2 ((t (,@headline ,@variable-tuple :height 1.5))))
   `(org-level-1 ((t (,@headline ,@variable-tuple :height 1.75))))
   `(org-document-title ((t (,@headline ,@variable-tuple :height 2.0 :underline nil))))))

  (custom-theme-set-faces
   'user
   '(variable-pitch ((t (:family "Source Sans Pro" :height 180 :weight light)))))
   ;'(fixed-pitch ((t ( :family "Inconsolata" :slant normal :weight normal :height 1.0 :width normal)))))

  (add-hook 'org-mode-hook 'variable-pitch-mode)

  (setq org-treat-S-cursor-todo-selection-as-state-change nil)

  (setq org-todo-keywords
        '((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
          (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)")))

  (setq org-todo-keyword-faces
        (quote (("TODO" :foreground "red" :weight bold)
                ("NEXT" :foreground "blue" :weight bold)
                ("DONE" :foreground "forest green" :weight bold)
                ("WAITING" :foreground "orange" :weight bold)
                ("HOLD" :foreground "magenta" :weight bold)
                ("CANCELLED" :foreground "forest green" :weight bold))))

  (custom-theme-set-faces
   'user
   '(org-block                 ((t (:inherit fixed-pitch))))
   '(org-document-info         ((t (:foreground "dark orange"))))
   '(org-document-info-keyword ((t (:inherit (shadow fixed-pitch)))))
   '(org-link                  ((t (:foreground "royal blue" :underline t))))
   '(org-meta-line             ((t (:inherit (font-lock-comment-face fixed-pitch)))))
   '(org-property-value        ((t (:inherit fixed-pitch))) t)
   '(org-special-keyword       ((t (:inherit (font-lock-comment-face fixed-pitch)))))
   '(org-tag                   ((t (:inherit (shadow fixed-pitch) :weight bold :height 0.8))))
   '(org-verbatim              ((t (:inherit (shadow fixed-pitch)))))
   '(org-table                 ((t (:inherit fixed-pitch))))
   '(org-indent                ((t (:inherit (org-hide fixed-pitch)))))))

(use-package org-bullets
  :ensure t
  :init
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(git-gutter:added-sign "++")
 '(git-gutter:deleted-sign "--")
 '(git-gutter:modified-sign "==")
 '(package-selected-packages
   (quote
    (company-tabnine helm-projectile which-key use-package treemacs-projectile treemacs-magit treemacs-icons-dired treemacs-evil linum-relative helm go-mode general flycheck evil-magit doom-themes doom-modeline))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-block ((t (:inherit fixed-pitch))))
 '(org-document-info ((t (:foreground "dark orange"))))
 '(org-document-info-keyword ((t (:inherit (shadow fixed-pitch)))))
 '(org-document-title ((t (:inherit default :weight bold :foreground "#ebdbb2" :font "Iosevka" :height 2.0 :underline nil))))
 '(org-indent ((t (:inherit (org-hide fixed-pitch)))))
 '(org-level-1 ((t (:inherit default :weight bold :foreground "#ebdbb2" :font "Iosevka" :height 1.75))))
 '(org-level-2 ((t (:inherit default :weight bold :foreground "#ebdbb2" :font "Iosevka" :height 1.5))))
 '(org-level-3 ((t (:inherit default :weight bold :foreground "#ebdbb2" :font "Iosevka" :height 1.25))))
 '(org-level-4 ((t (:inherit default :weight bold :foreground "#ebdbb2" :font "Iosevka" :height 1.1))))
 '(org-level-5 ((t (:inherit default :weight bold :foreground "#ebdbb2" :font "Iosevka"))))
 '(org-level-6 ((t (:inherit default :weight bold :foreground "#ebdbb2" :font "Iosevka"))))
 '(org-level-7 ((t (:inherit default :weight bold :foreground "#ebdbb2" :font "Iosevka"))))
 '(org-level-8 ((t (:inherit default :weight bold :foreground "#ebdbb2" :font "Iosevka"))))
 '(org-link ((t (:foreground "royal blue" :underline t))))
 '(org-meta-line ((t (:inherit (font-lock-comment-face fixed-pitch)))))
 '(org-property-value ((t (:inherit fixed-pitch))) t)
 '(org-special-keyword ((t (:inherit (font-lock-comment-face fixed-pitch)))))
 '(org-table ((t (:inherit fixed-pitch))))
 '(org-tag ((t (:inherit (shadow fixed-pitch) :weight bold :height 0.8))))
 '(org-verbatim ((t (:inherit (shadow fixed-pitch)))))
 '(variable-pitch ((t (:family "Source Sans Pro" :height 180 :weight light)))))
