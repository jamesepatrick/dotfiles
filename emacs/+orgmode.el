;;; -*- lexical-binding: t; -*-
;;; This file is generated via tangles from the config.org file. Do not modify this file.
;;; Any modifications here will be clobbered and versioned over. Seriously just don't.

(require 'org)

(custom-set-variables '(org-directory "~/org/"))

(setq org-download-image-dir (concat org-directory ".attach/"))

(setq org-roam-directory (concat org-directory "pages"))

(setq org-roam-dailies-directory (concat org-directory "journals/"))

(defvar org-directory-work (concat org-directory "work/") "Location for work subdirectory.")

(defvar-local +org-capture-work-todo-file
    (expand-file-name "todo.org" org-directory-work))
(add-to-list 'org-capture-templates
             '("w" "Work Todo" entry
               (file+headline +org-capture-work-todo-file "Inbox")
               "* [_] %i%?\n%a -  %u" :prepend t))

(use-package! git-auto-commit-mode
  :config
  (setq-default gac-automatically-push-p t)
  (setq-default gac-automatically-add-new-files-p t)

  (defun gac-pull-before-push (&rest _args)
    (let ((current-file (buffer-file-name)))
      (shell-command "git pull")
      (when current-file
        (with-current-buffer (find-buffer-visiting current-file)
          (revert-buffer t t t)))))
  (advice-add 'gac-push :before #'gac-pull-before-push))

(add-hook! 'org-mode-hook #'mixed-pitch-mode)

(add-hook! 'org-mode-hook #'+org-pretty-mode)

(setq org-agenda-deadline-faces
      '((1.001 . error)
        (1.0 . org-warning)
        (0.5 . org-upcoming-deadline)
        (0.0 . org-upcoming-distant-deadline)))

(setq org-log-into-drawer t)

(setq org-clock-into-drawer t)

(setq org-roam-dailies-capture-templates
      '(("d" "default" entry "*  %T %?"
         :target (file+head "%<%Y-%m-%d>.org"
                            "#+title: %<%Y-%m-%d>\n#+filetags: %<:%Y:%B:daily:>\n\n"))
        ))

(setq org-src-fontify-natively t
      org-src-preserve-indentation t
      org-src-tab-acts-natively t
      org-src-window-setup 'current-window)

(defun org-babel-execute:diff (body params)
  "Applies diff patches. Use with care.
See https://emacs.stackexchange.com/questions/63517/org-mode-evaluate-diff-code-block"
  (with-temp-buffer
    (insert body "\n")
    (shell-command-on-region (point-min) (point-max) "patch --strip=1" "*patch*")
    (prog1
    (with-current-buffer "*patch*" (buffer-string))
      (kill-buffer "*patch*"))))

(use-package! ox-tufte
  :interpreter "org"
  )

(after! org
  (setq org-html-head ""
        org-html-head-extra ""))

(after! org
  (setq org-html-htmlize-output-type "css"))

(setq +org-capture-frame-parameters '((name . "doom-capture")
                                      (width . 100)
                                      (height . 20)
                                      (transient . t)
                                      ))

(use-package! khalel
  :after org
  :config
  (khalel-add-capture-template)
  (setq khalel-capture-key "e")
  (setq khalel-import-org-file (concat org-directory "/" "calendar.org"))
  (setq khalel-import-org-file-confirm-overwrite nil)
  (setq khalel-import-end-date "+90d")
)

(setq org-agenda-files
      (list org-directory org-directory-work))
