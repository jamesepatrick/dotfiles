if command -v fzf >/dev/null 2>&1; then
    local fzf_version=$(fzf --version | cut -d' ' -f1)

    # Use autoload for version comparison
    autoload -U is-at-least

    # See https://github.com/junegunn/fzf?tab=readme-ov-file#setting-up-shell-integration
    if is-at-least "0.48.0" "$fzf_version"; then
        source <(fzf --zsh)
    else
        # Load legacy key bindings and completion
        source completion.zsh
        source key-bindings.zsh
    fi
fi
#+END_SRC
