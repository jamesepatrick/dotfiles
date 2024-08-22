;;; -*- lexical-binding: t; -*-
;;; This file is generated via tangles from the config.org file. Do not modify this file.
;;; Any modifications here will be clobbered and versioned over. Seriously just don't.

(setq doom-localleader-key ",")

(map! :leader
      (:when (modulep! :lang org +roam2)
        (:prefix-map ("r" . "roam")
         :desc "Find node"              "/"    #'org-roam-node-find
         :desc "Capture to node"        "n"    #'org-roam-capture
         :desc "Capture Today"          "c"    #'org-roam-dailies-capture-today
         :desc "Goto Today"             "t"    #'org-roam-dailies-goto-today
         )
        )
      )

(map! :leader
      (:prefix-map ("A" . "GPT")
       :desc "Menu"              "m"    #'gptel-menu
       :desc "Menu"              "a"    #'gptel-menu
       :desc "Send"              "s"    #'gptel-send
       :desc "Open Session"      "o"    #'gptel
       :desc "Set Topic"         "t"    #'gptel-set-topic
       :desc "Rewrite"           "r"    #'gptel-rewrite-menu
       :desc "Change Prompt"     "c"    #'gptel-system-prompt
       )
      )
