;;; -*- lexical-binding: t; -*-
;;; This file is generated via tangles from the config.org file. Do not modify this file.
;;; Any modifications here will be clobbered and versioned over. Seriously just don't.

(require 'org)

(custom-set-variables '(org-directory "~/org/"))

(setq org-download-image-dir (concat org-directory ".attach/"))

(setq org-roam-directory (concat org-directory "roam"))

(setq org-agenda-files (list (concat org-directory "todo" )))

(setq org-roam-dailies-directory (concat org-directory "journals/"))

(defvar-local +org-capture-work-todo-file
    (expand-file-name "Work/todo.org" org-directory))
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

(add-hook 'org-mode-hook (lambda ()
                           "Beautify Org Checkbox Symbol"`
                           (push '("[ ]" . "☐") prettify-symbols-alist)
                           (push '("[_]" . "☐") prettify-symbols-alist)
                           (push '("[X]" . "☑" ) prettify-symbols-alist)
                           (push '("[-]" . "⊟" ) prettify-symbols-alist)
                           (prettify-symbols-mode)))

(setq prettify-symbols-unprettify-at-point 'right-edge)

(with-eval-after-load 'org
  (defvar-local rasmus/org-at-src-begin -1
    "Variable that holds whether last position was a ")

  (defvar rasmus/ob-header-symbol ?☰
    "Symbol used for babel headers")

  (defun rasmus/org-prettify-src--update ()
    (let ((case-fold-search t)
          (re "^[ \t]*#\\+begin_src[ \t]+[^ \f\t\n\r\v]+[ \t]*")
          found)
      (save-excursion
        (goto-char (point-min))
        (while (re-search-forward re nil t)
          (goto-char (match-end 0))
          (let ((args (org-trim
                       (buffer-substring-no-properties (point)
                                                       (line-end-position)))))
            (when (org-string-nw-p args)
              (let ((new-cell (cons args rasmus/ob-header-symbol)))
                (cl-pushnew new-cell prettify-symbols-alist :test #'equal)
                (cl-pushnew new-cell found :test #'equal)))))
        (setq prettify-symbols-alist
              (cl-set-difference prettify-symbols-alist
                                 (cl-set-difference
                                  (cl-remove-if-not
                                   (lambda (elm)
                                     (eq (cdr elm) rasmus/ob-header-symbol))
                                   prettify-symbols-alist)
                                  found :test #'equal)))
        ;; Clean up old font-lock-keywords.
        (font-lock-remove-keywords nil prettify-symbols--keywords)
        (setq prettify-symbols--keywords (prettify-symbols--make-keywords))
        (font-lock-add-keywords nil prettify-symbols--keywords)
        (while (re-search-forward re nil t)
          (font-lock-flush (line-beginning-position) (line-end-position))))))

  (defun rasmus/org-prettify-src ()
    "Hide src options via `prettify-symbols-mode'.

        `prettify-symbols-mode' is used because it has uncollpasing. It's
        may not be efficient."
    (let* ((case-fold-search t)
           (at-src-block (save-excursion
                           (beginning-of-line)
                           (looking-at "^[ \t]*#\\+begin_src[ \t]+[^ \f\t\n\r\v]+[ \t]*"))))
      ;; Test if we moved out of a block.
      (when (or (and rasmus/org-at-src-begin
                     (not at-src-block))
                ;; File was just opened.
                (eq rasmus/org-at-src-begin -1))
        (rasmus/org-prettify-src--update))
      ;; Remove composition if at line; doesn't work properly.
      ;; (when at-src-block
      ;;   (with-silent-modifications
      ;;     (remove-text-properties (match-end 0)
      ;;                             (1+ (line-end-position))
      ;;                             '(composition))))
      (setq rasmus/org-at-src-begin at-src-block)))

  ;; This function helps to produce a single glyph out of a
  ;; string. The glyph can then be used in prettify-symbols-alist.
  ;; This function was provided by Ihor in the org-mode mailing list.
  (defun yant/str-to-glyph (str)
    "Transform string into glyph, displayed correctly."
    (let ((composition nil))
      (dolist (char (string-to-list str)
                    (nreverse (cdr composition)))
        (push char composition)
        (push '(Br . Bl) composition))))

  (defun rasmus/org-prettify-symbols ()
    (mapc (apply-partially 'add-to-list 'prettify-symbols-alist)
          (cl-reduce 'append
                     (mapcar (lambda (x) (list x (cons (upcase (car x)) (cdr x))))
                             `(("#+begin_src" . ?⎡) ;; ⎡ ➤ 🖝 ➟ ➤ ✎
                               ;; multi-character strings can be used with something like this:
                               ;; ("#+begin_src" . ,(yant/str-to-glyph "```"))
                               ("#+end_src"   . ?⎣) ;; ⎣ ✐
                               (":LOGBOOK:"   . ?) ;;
                               ("#+header:" . ,rasmus/ob-header-symbol)
                               ("#+begin_quote" . ?«)
                               ("#+end_quote" . ?»)))))
    (turn-on-prettify-symbols-mode)
    (add-hook 'post-command-hook 'rasmus/org-prettify-src t t))
  (add-hook 'org-mode-hook #'rasmus/org-prettify-symbols))

(setq org-log-into-drawer t)

(setq org-clock-into-drawer t)

(setq org-roam-dailies-capture-templates
      '(("l" "Log" entry "*  %T %?"
         :target (file+head+olp "%<%Y-%m-%d>.org"
                                "#+title: %<%Y-%m-%d>\n#+filetags: %<:%Y:%B:daily:>\n\n* Goals\n* Logs"
                                ("Logs")))
        ("g" "Goal" entry "* TODO %?"
         :target (file+head+olp "%<%Y-%m-%d>.org"
                                "#+title: %<%Y-%m-%d>\n#+filetags: %<:%Y:%B::daily>\n\n* Goals\n* Logs"
                                ("Goals")))))

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

(use-package! ox-tufte)

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
