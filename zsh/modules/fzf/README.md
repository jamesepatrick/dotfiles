# FZF Module

This module provides ZSH integration for [fzf](https://github.com/junegunn/fzf) (fuzzy finder), enabling interactive file, directory, and command history selection.

## Usage

The module automatically detects your fzf version:

- For fzf >= 0.48.0: Uses the built-in `fzf --zsh` integration
- For older versions: Falls back to the included legacy scripts

## Files

- `init.zsh` - Main initialization script that detects fzf version and loads appropriate integration
- `key-bindings.zsh` - Legacy key bindings for fzf < 0.48.0
- `completion.zsh` - Legacy tab completion integration for fzf < 0.48.0

> [!NOTE]  
> The `key-bindings.zsh` and `completion.zsh` are both from the junegunn/fzf repo, and attribution goes to the original authors. This is specifically the version packaged with fzf 0.44.1 as this is the oldest version I'm presently supporting.
