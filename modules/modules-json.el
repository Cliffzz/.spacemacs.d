;;; modules-json.el -*- lexical-binding: t; -*-

;; Major mode for editing JSON files.
(use-package json-mode
  :mode
  (("\\.json?\\'" . json-mode))
  :config
  (defvar js-indent-level)
  (defvar json-reformat:indent-width)
  (defun json-mode-indentation ()
    (make-local-variable 'js-indent-level)
    (setq js-indent-level 2
          json-reformat:indent-width 2))
  (add-hook 'json-mode-hook 'json-mode-indentation))

;; Prettier, code formatting.
(use-package prettier-js
  :commands (prettier-js)
  :init
  (defun set-prettier-json-config ()
    (make-local-variable 'prettier-js-command)
    (make-local-variable 'prettier-js-args)
    (setq prettier-js-command "prettier")
    (setq prettier-js-args '("--print-width" "100" "--tab-width" "2" "--single-quote" "--trailing-comma" "all"))
    (bind-key "C-c f" 'prettier-js json-mode-map))

  (add-hook 'json-mode-hook 'set-prettier-json-config))

;; Enable langauge server completion.
(defun setup-json-completion ()
  (defvar company-backends)
  (make-local-variable 'company-backends)
  (setq company-backends '(company-lsp)))

(add-hook 'json-mode-hook #'setup-json-completion)

;; JSON syntax checking with jsonlint + language server.
(defvar flycheck-disabled-checkers)
(defun configure-json-syntax-checking ()
  (flycheck-mode)
  ;; Flycheck
  (setq-default flycheck-disabled-checkers
                (append flycheck-disabled-checkers
                        '(json-python-json)))

  (declare-function flycheck-add-next-checker "flycheck")
  (flycheck-add-next-checker 'lsp-ui 'json-jsonlint))

(add-hook 'json-mode-hook #'configure-json-syntax-checking)

;; Enable langauge server.
(add-hook 'json-mode-hook #'lsp)

(provide 'modules-json)
;;; modules-json.el ends here