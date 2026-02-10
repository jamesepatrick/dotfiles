# Dotfiles

Hi. This is James Patrick's current collection of dotfiles. If you found this
feel free to steal what ever you want, if you have any questions feel free to
contact me.

## Tenants

1. The time invested in configuring tools will probably never recouped by
   increased productivity. This isn't a reason not to spend the time to do this.
2. Don't write what already exist.
3. Configuration should be easy to setup and tear down, without destroying
   anything of value.
4. Try to stay lean. More tooling begets more maintenance.
   1. The best code is no code.
   2. It's better to have an imperfect tool than to have targets diverge
   3. Write tooling to allow for variation between targets.
5. Any rule can ignored if it has a non-stupid reason.
6. Take lots of screenshots.
7. Don't be an idiot and store large files.
8. Git-crypt is used to store some semi-sensitive data. All encrypted data should
   assumed to be able to be brute for in the future for pocket change. Do not
   store important data this way.

## Quick start

```sh
git clone https://github.com/jamesepatrick/dotfiles/ ~/.dotfiles
make -C ~/.dotfiles up
```

## What's in here

This repo manages configurations for:

- **ZSH** - Shell with modular setup including vi-mode, fzf integration, and
  custom prompt
- **Emacs** - I use vi bindings in Emacs, so I'm a heretic to both churches of
  Emacs and Vim.
- **Vim** - Primarily used for quick edits and viewing files, but also has some
  customizations
- **Tridactyl** - Vim-like browser extension for Firefox. Seeing a theme here?
- **Tmux** - Terminal multiplexer for managing multiple terminal sessions

The setup uses a modular approach where each tool gets its own directory and can
be enabled/disabled independently.

## How it works

The Makefile handles symlinking configs to the right places without destroying
your existing setup. It's smart enough to back things up and restore them if you
decide this was a terrible idea. You can run `make up` to set everything up, or
`make down` to tear it all down and restore your previous configs.

Why Make? Because it's simple, widely available, and & a bunch of `.PHONY`
targets make it easy to run specific setups without needing to write a bunch of
custom scripts.

## Customization

Fork it, break it, fix it. The whole point is to make this yours. The modular
setup means you can pick and choose what you want without inheriting my terrible
life choices.

If you improve something, consider opening a PR. Or don't. I'm not your boss.
