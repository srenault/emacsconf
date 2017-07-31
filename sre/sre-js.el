;; sre-js.el

(package-require 'json-mode)
(add-to-list 'auto-mode-alist '("\\.json$" . json-mode))

(package-require 'js2-mode)
'(js3-auto-indent-p t)
'(js3-enter-indents-newline t)
'(js3-indent-on-enter-key t)

(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("[.]js$" . js2-jsx-mode))
(add-to-list 'auto-mode-alist '("[.]jsx$" . js2-jsx-mode))

(setq js2-cleanup-whitespace t)
(setq-default js2-basic-offset 4)
(setq js2-enter-indents-newline nil)
(setq js2-indent-on-enter-key nil)
(setq js2-mirror-mode nil)
(setq js2-mode-indent-ignore-first-tab t)
(setq js2-global-externs
      '("module" "require" "__dirname" "process" "console" "define"
        "JSON" "$" "_"))
(setq js2-strict-missing-semi-warning nil)

(package-require 'flycheck)

(use-package flycheck
  :ensure t
  :diminish flycheck-mode
  :config
  (global-flycheck-mode)
  (setq-default flycheck-temp-prefix ".flycheck")
  (setq flycheck-eslintrc "~/.eslintrc")
  (flycheck-add-mode 'javascript-eslint 'js2-mode)
  (flycheck-add-mode 'javascript-eslint 'js-mode)
  (flycheck-add-mode 'javascript-eslint 'js2-jsx-mode)
  (flycheck-add-mode 'javascript-eslint 'web-mode)

  (setq-default flycheck-disabled-checkers
                (append flycheck-disabled-checkers
                        '(javascript-jshint))))


;; disable jshint since we prefer eslint checking
(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
    '(javascript-jshint)))

;; customize flycheck temp file prefix
;;(setq-default flycheck-temp-prefix ".flycheck")

;; (setq flycheck-eslintrc "~/.eslintrc")

;; (add-hook 'js2-mode-hook 'flycheck-mode)
(add-hook 'js2-mode-hook 'js2-mode-hide-warnings-and-errors)

;; use eslint with web-mode for jsx files
;; (flycheck-add-mode 'javascript-eslint 'js2-jsx-mode)
;; (flycheck-add-mode 'javascript-eslint 'web-mode)

(provide 'sre-js)
