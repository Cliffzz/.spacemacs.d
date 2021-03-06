;;; core-editor.el -*- lexical-binding: t; -*-

;; Force spaces for indentation.
(setq-default indent-tabs-mode nil)

;; Mitigate performance problems with long lines.
(global-so-long-mode)

;; Add a newline automatically at the end of the file.
(setq require-final-newline t)

;; Disable backup files.
(setq make-backup-files nil)

;; Disable file locks.
(setq create-lockfiles nil)

;; Disable auto save files.
(setq auto-save-default nil
      auto-save-list-file-prefix nil)

;; Unobtrusively trim spaces from end of line.
(use-package ws-butler
  :config
  (ws-butler-global-mode))

;; Smartly manage pairs.
(use-package smartparens
  :hook
  (prog-mode . smartparens-mode))

;; Code/text auto completion, needs to be configured per langauge.
(use-package company
  :commands
  (company-mode)
  :config
  (setq company-idle-delay 0.0)
  (setq company-minimum-prefix-length 1)
  (setq company-backends '()))

;; Syntax checking, needs to be configured per langauge.
(use-package flycheck
  :commands
  (flycheck-mode))

;; Language server protocol support, needs to be configured per langauge.
(use-package lsp-mode
  :hook
  (lsp-mode . lsp-enable-which-key-integration)
  :commands
  (lsp)
  :init
  (setq read-process-output-max (* 1024 1024)
        lsp-idle-delay 0.500
        lsp-file-watch-threshold 100000
        lsp-keymap-prefix "C-c l"
        lsp-eldoc-enable-hover nil
        lsp-eldoc-render-all nil
        lsp-eslint-server-command
        `(
          "node"
          ,(file-truename (concat user-emacs-directory ".bin/vscode-eslint/server/out/eslintServer.js"))
          "--stdio")))

;; UI modules for `lsp-mode'.
(use-package lsp-ui
  :commands
  (lsp-ui-mode)
  :bind
  (:map lsp-ui-mode-map
        (("C-." . lsp-ui-peek-find-definitions)
         ("C-," . lsp-ui-peek-find-references)))
  :config
  (setq lsp-ui-sideline-show-diagnostics t
        lsp-ui-sideline-show-hover t
        lsp-ui-sideline-show-code-actions nil
        lsp-ui-sideline-update-mode 'line'
        lsp-ui-doc-enable nil))

;; `ivy-mode' for `lsp-mode'
(use-package lsp-ivy
  :commands
  (lsp-ivy-workspace-symbol))

;; Emacs completion using ivy.
(use-package ivy
  :init
  (ivy-mode)
  :config
  (setq ivy-use-virtual-buffers t
        ivy-use-selectable-prompt t
        enable-recursive-minibuffers t
        ivy-height 20
        ivy-count-format "(%d/%d) "))

;; Ivy enhanced versions of emacs commands and use `counsel-rg' for project search.
(use-package counsel
  :bind
  (("C-c s" . 'counsel-rg))
  :config
  (counsel-mode))

;; `I-Search' replacement using ivy.
(use-package swiper
  :commands
  (swiper)
  :bind
  (("C-s" . 'swiper)))

(use-package rg
  :config
  (rg-enable-default-bindings (kbd "C-c S")))

;; Universal go to definition.
(use-package dumb-jump
  :bind
  (:map prog-mode-map
        (("C-." . dumb-jump-go)
         ("C-," . dumb-jump-back)))
  :config
  (setq dumb-jump-selector 'ivy))

;; Easy expandable selectable region.
(use-package expand-region
  :bind
  (("C-=" . er/expand-region)))

;; Jump to character in visiable text.
(use-package avy
  :bind
  (("C-'" . 'avy-goto-char-timer)))

;; Provide a visualization of undos in a file.
(use-package undo-tree
  :commands
  (undo-tree-undo undo-tree-redo)
  :init
  (global-undo-tree-mode)
  :bind (("C-/" . 'undo-tree-undo)
         ("C-?" . 'undo-tree-redo)))

;; Navigate windows and frames using numbers.
(use-package winum
  :config
  (winum-mode))

;; Project integration.
(use-package projectile
  :commands projectile-mode
  :bind-keymap ("C-c p" . projectile-command-map)
  :init
  (defvar projectile-sort-order)
  (setq projectile-sort-order 'recentf
        projectile-completion-system 'ivy)
  (projectile-mode +1))

;; Git Emacs interface.
(use-package magit
  :commands (magit-status)
  :bind (("C-c g" . 'magit-status)))

;; Highlight git changes.
(use-package git-gutter-fringe
  :init
  (global-git-gutter-mode))

(provide 'core-editor)
;;; core-editor.el ends here
