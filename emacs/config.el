;;; -*- lexical-binding: t; -*-

;;; This file is generated via tangles from the config.org file. Do not modify this file.
;;; Any modifications here will be clobbered and versioned over. Seriously just don't.

;;; -*- lexical-binding: t; -*-
;;; This file is generated via tangles from the config.org file. Do not modify this file.
;;; Any modifications here will be clobbered and versioned over. Seriously just don't.

(setq fancy-splash-image (concat doom-user-dir "./.resources/doom.png"))

(setq-hook! 'sql-mode-hook +format-with 'pgformatter)

(setq ispell-dictionary "en"
      ispell-personal-dictionary "~/org/.ispell.en.pws")

(setq doom-fallback-buffer-name "Doom"
      +doom-dashboard-name "Doom Dashboard")

(setq frame-title-format
      '(""
        (:eval
         (if (s-contains-p org-roam-directory (or buffer-file-name ""))
             (replace-regexp-in-string
              ".*/[0-9]*-?" "☰ "
              (subst-char-in-string ?_ ?  buffer-file-name))
           "%b"))
        (:eval
         (let ((project-name (projectile-project-name)))
           (unless (string= "-" project-name)
             (format (if (buffer-modified-p)  " ♢ %s" " ♦ %s") project-name))))))

(setq doom-font (font-spec :family "Hasklig" :size 14 :height 1)
      doom-variable-pitch-font (font-spec :family "Alegreya" :height 1.3)
      doom-big-font (font-spec :family "Hasklig" :size 18))

(load! "+keybinds")

(setq which-key-idle-delay 0.1)

(add-to-list 'auto-mode-alist '("/\\(tmp\\|private/var\\)/.*/tmp_.*\\.txt" . markdown-mode))

(load! "+orgmode")

(use-package! gptel)

(use-package! copilot
  :hook (prog-mode . copilot-mode)
  :bind (:map copilot-completion-map
              ("<tab>" . 'copilot-accept-completion)
              ("TAB" . 'copilot-accept-completion)
              ("C-TAB" . 'copilot-accept-completion-by-word)
              ("C-<tab>" . 'copilot-accept-completion-by-word)))
