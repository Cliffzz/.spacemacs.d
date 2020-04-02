;;; modules-yaml.el -*- lexical-binding: t; -*-

;; Major mode for editing yaml files.
(use-package yaml-mode
  :mode
  (("\\.yml\\'" . yaml-mode)))

;; Enable langauge server completion.
(defun setup-yaml-completion ()
  (defvar company-backends)
  (make-local-variable 'company-backends)
  (setq company-backends '(company-lsp)))

(add-hook 'yaml-mode-hook #'setup-yaml-completion)

;; Yaml syntax checking with language server.
(defvar flycheck-disabled-checkers)
(defun configure-yaml-syntax-checking ()
  (flycheck-mode)
  (setq-default flycheck-disabled-checkers
                (append flycheck-disabled-checkers
                        '(yaml-jsyaml  yaml-ruby  yaml-yamllint)))

  (defvar lsp-ui-sideline-show-hover)
  (make-local-variable 'lsp-ui-sideline-show-hover)
  (setq lsp-ui-sideline-show-hover nil))

(add-hook 'yaml-mode-hook #'configure-yaml-syntax-checking)

;; Enable langauge server.
(add-hook 'yaml-mode-hook #'lsp)

(provide 'modules-yaml)
;;; modules-yaml.el ends here
