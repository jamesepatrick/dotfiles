# CTRL+space to accept Autosuggest's suggestion.
bindkey '^ ' autosuggest-accept

# Open command in $EDITOR
bindkey '^E' edit-command-line
bindkey -M vicmd "v" edit-command-line

# Start of line
bindkey '^[[1~' beginning-of-line
bindkey -M vicmd '^[[1~' beginning-of-line
# End of line
bindkey '^[[4~' end-of-line
bindkey -M vicmd '^[[4~' end-of-line
