# vim: syn=zsh

# Return if tmux isn't installed.
if (( ! $+commands[tmux] )); then
    return 1
fi

# If running as root, stop and return.
if [ "$EUID" -eq 0 ] ; then
    return 0
fi

# If this this terminal meets any of these return.
env_array=($TMUX $EMACS $VIM $INSODE_EMACS $VSCODE $POPUP_TTY)
if [[ -n $env_array ]]; then
    return 0
fi

if  ( [[ -n "$SSH_TTY" ]] && zstyle -t ':tmux:auto-start' remote ) ||  \
    ( [[ -z "$SSH_TTY" ]] && zstyle -t ':tmux:auto-start' local ) \
   ; then
    zstyle -s ':tmux:auto-start' name tmux_session
    tmux_session=${tmux_session:-tmux}
    echo $tmux_session
    tmux start-server
    if ! tmux has-session 2> /dev/null; then
        zstyle -s ':tmux:auto-start' name tmux_session
        tmux \
            new-session -d -s "${tmux_session:-tmux}" \; \
            set-option -t "${tmux_session:-tmux}" destroy-unattached off &> /dev/null
    fi
    tmux attach -t $tmux_session
fi
