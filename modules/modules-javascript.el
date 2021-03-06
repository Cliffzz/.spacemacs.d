;;; modules-javascript.el -*- lexical-binding: t; -*-

;; Only run `js-mode-hook', when `js-mode' is the major mode.
(defun set-js-mode-hook (hook-to-run)
  (add-hook 'js-mode-hook
            (lambda ()
              (when (eq major-mode 'js-mode)
                (add-hook 'js-mode-hook hook-to-run)))))

;; Major mode for editing javascript files, for rjsx files only enable minor mode.
(use-package js2-mode
  :mode
  (("\\.js?\\'" . js2-mode))
  :commands
  (js2-minor-mode)
  :init
  (set-js-mode-hook #'js2-minor-mode)
  :config
  (setq-default js2-basic-offset 4
                js-switch-indent-offset 4
                js-indent-level 4
                js2-strict-trailing-comma-warning nil
                js2-include-node-externs t))

;; Add project node modules to path.
(use-package add-node-modules-path
  :commands
  (add-node-modules-path)
  :init
  (add-hook 'js2-mode-hook #'add-node-modules-path)
  (set-js-mode-hook #'add-node-modules-path))

;; Small refactoring functions to enhance editing of javascript.
(use-package js2-refactor
  :commands
  (js2-refactor-mode)
  :init
  (add-hook 'js2-mode-hook #'js2-refactor-mode)
  (set-js-mode-hook #'js2-refactor-mode)
  :config
  (js2r-add-keybindings-with-prefix "C-c r")

  (declare-function set-js2-refactor-keybind-descriptions "modules-javascript")
  (defun set-js2-refactor-keybind-descriptions (mode)
    "Set the refactor keybind descriptions for the given mode."
    (which-key-add-major-mode-key-based-replacements mode
      "C-c r" "refactor"

      "C-c r 3" "ternary"
      "C-c r a" "add/args"
      "C-c r b" "barf"
      "C-c r c" "contract"
      "C-c r e" "expand/extract"
      "C-c r i" "inline/inject/introduct"
      "C-c r l" "localize/log"
      "C-c r r" "rename"
      "C-c r s" "split/slurp"
      "C-c r t" "toggle"
      "C-c r u" "unwrap"
      "C-c r v" "var"
      "C-c r w" "wrap"
      "C-c r t" "text"))

  (set-js2-refactor-keybind-descriptions 'js2-mode)
  (set-js2-refactor-keybind-descriptions 'js-mode))

;; Enable langauge server.
(add-hook 'js2-mode-hook #'lsp)
(set-js-mode-hook #'lsp)

(provide 'modules-javascript)
;;; modules-javascript.el ends here
