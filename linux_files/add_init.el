(require 'package)

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)

(unless (package-installed-p 'inf-clojure)
  (package-refresh-contents)
  (package-install 'inf-clojure))

(defun figwheel-repl ()
  (interactive)
  (run-clojure "lein figwheel"))

(add-hook 'clojure-mode-hook #'inf-clojure-minor-mode)

(setq make-backup-files nil)
(setq auto-save-default nil)
