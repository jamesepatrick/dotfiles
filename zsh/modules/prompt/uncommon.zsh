autoload -U colors \
  && colors

_UNCOMMON_COLOR_CURRENT_DIR=blue
_UNCOMMON_COLOR_RETURN_TRUE=yellow
_UNCOMMON_COLOR_RETURN_FALSE=red
_UNCOMMON_COLOR_BG_JOBS=yellow
_UNCOMMON_PROMPT_SYMBOL=${_UNCOMMON_PROMPT_SYMBOL:-'❯'}

if [ -z "$_UNCOMMON_HOSTNAME_COLOR" ] ; then
  if [ -z "$_UNCOMMON_PROMPT_COLORS" ] ; then
  _UNCOMMON_PROMPT_COLORS=(
    $fg[blue]
    $fg[cyan]
    $fg[green]
    $fg[magenta]
    $fg[red]
    $fg[white]
    $fg[yellow]
  )
  fi

  local DETERMINISTIC_INT=$(( $(hostname | cksum | sed 's/[^0-9]*//g') % ${#_UNCOMMON_PROMPT_COLORS[@]} ))
  export _UNCOMMON_HOSTNAME_COLOR=${_UNCOMMON_PROMPT_COLORS[$DETERMINISTIC_INT]}
fi

PROMPT='$(_uncommon_host)$(_uncommon_current_dir)$(_uncommon_return_status)'
RPROMPT='$(_uncommon_time)'

_uncommon_host(){
  if [[ -n $SSH_CONNECTION ]]; then
  me="%n@%m"
  elif [[ "$LOGNAME" != "$USER" ]]; then
  me="%n"
  fi

  if [[ -n $me ]]; then
  echo "%{${_UNCOMMON_HOSTNAME_COLOR}%}$me%{$reset_color%}:"
  fi
}

_uncommon_current_dir(){
  echo -n "%{$fg[$_UNCOMMON_COLOR_CURRENT_DIR]%}%c "
}

_uncommon_return_status() {
  echo -n "%(?.%F{$_UNCOMMON_COLOR_RETURN_TRUE}.%F{$_UNCOMMON_COLOR_RETURN_FALSE})$_UNCOMMON_PROMPT_SYMBOL%f "
}

_uncommon_bg_jobs() {
  bg_status="%{$fg[$_UNCOMMON_COLOR_BG_JOBS]%}%(1j.↓%j .)"
  echo -n $bg_status
}

_uncommon_time(){
  echo "%F{red} %D{%L:%M:%S}%r%f"
}

