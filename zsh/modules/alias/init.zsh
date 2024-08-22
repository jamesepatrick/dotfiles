# ls shortcuts.
if [[ $OSTYPE = darwin* ]] ; then
    color_flag="-G"
else
    color_flag="--color"
fi
alias ls="ls $color_flag"
alias l="ls -lh $color_flag"
alias la="ls -lha $color_flag"

# Get the most recently modified object in the current directory.
alias lf="ls -1tr | tail -n 1"

# Goes to a temp folder. This will be deleted on restart.
alias _="cd `mktemp -d` ; "

alias :q="exit"

# Because sometimes asking nicely gets things done.
alias please="sudo"
