;;; -*- lexical-binding: t; -*-
;;; This file is generated via tangles from the config.org file. Do not modify this file.
;;; Any modifications here will be clobbered and versioned over. Seriously just don't.

(map! :map git-commit-mode-map
      :localleader
      "n" #'git-commit-next-message
      "p" #'git-commit-prev-message
      )

(setq doom-localleader-key ",")

(map! :leader
      (:prefix "i"
       :desc "icons" "i" #'nerd-icons-insert
       )
      )

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
      (:prefix "t"
       :desc "CoPilot" "C" #'copilot-mode
       )
      )

(map! :leader
      (:prefix "o"
       :desc "Copilot Chat" "c" #'copilot-chat
       )
      )

(map! :leader
      (:prefix-map ("m" . "Copilot Magic")
       :desc "Transient"          "k"    #'copilot-chat-transient
       :desc "Add Current Buffer" "a"    #'copilot-chat-add-current-buffer
       :desc "Go To"              "g"    #'copilot-chat-switch-to-buffer
       :desc "Hide"               "x"    #'copilot-chat-hide
       :desc "Ask & Insert"       "i"    #'copilot-chat-ask-and-insert
       :desc "Select Model"       "m"    #'copilot-chat-set-model
       :desc "Quick Prompt"       "q"    #'copilot-chat-custom-prompt-mini-buffer
       :desc "Reset"              "r"    #'copilot-chat-reset
       :desc "Quick Prompt"       "q"    #'copilot-chat-custom-prompt-mini-buffer
       :desc "Quick Prompt"       "q"    #'copilot-chat-custom-prompt-mini-buffer
       (:prefix-map ("c" . "Context")
          :desc "Add Current Buffer" "a" #'copilot-chat-add-current-buffer
          :desc "Add File"           "f" #'copilot-chat-add-file
          :desc "Remove Buffer"      "r" #'copilot-chat-del-buffers
          :desc "List Files"         "l" #'copilot-chat-list
          :desc "Add Workspace"      "w" #'copilot-chat-add-workspace
          :desc "Add Directory"      "d" #'copilot-chat-add-files-under-dir
          :desc "Transient Code"     "c" #'copilot-chat-transient-code)
       (:prefix-map ("h" . "Helper")
          :desc "Explain"             "e" #'copilot-chat-explain
          :desc "Documentation"       "d" #'copilot-chat-doc
          :desc "Fix"                 "f" #'copilot-chat-fix
          :desc "Optimize"            "o" #'copilot-chat-optimize
          :desc "Test"                "t" #'copilot-chat-test
          :desc "Custom Prompt"       "c" #'copilot-chat-custom-prompt-function
       )
      )
     )

(map! :map git-commit-mode-map
      :localleader
      "g" #'copilot-chat-insert-commit-message
      )
