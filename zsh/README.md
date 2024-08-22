
# ZSH

## Install

Install for this follows the norm for the rest of the dotfiles. `cd` to this directory and run

```make install```

or if you are on a machine where BSD Make is installed by default:

```gmake install```

## File Structure.

The file structure looks something like this: Nodes with a trailing "δ" are directories. 

```
zsh
├── environment δ 
│   ├── host δ
│   └── os δ
│       ├── darwin δ
│       └── linux-gnu δ
├── makefile
├── modules δ
├── transient δ
├── zlogin
├── zlogout
├── zgenom
├── zprofile
├── zshenv
└── zshrc
```

* `environment` :: This is the contains environment base logic and contains. At each step of the zsh loading process the `env_loader` function will load the corresponding file.
  * `host` :: Loaded Automatically. Conditionally loads by based on `$HOST` value.
  * `os` :: Loaded Automatically. Conditionally loads by based on `$OSTYPE` value.
* `makefile` :: Install/Update/Remove makefile. 
* `modules` :: Local modules loaded by zgenom
* `transient` :: Files that are required for zsh (eg history), that are not to
  be versioned.
* `zlogin`/`zlogout`/`zprofile`/etc :: The default shell resource files. See [here](https://shreevatsa.wordpress.com/2008/03/30/zshbash-startup-files-loading-order-bashrc-zshrc-etc/) for more infomation on load order.
* `zgenom` :: How to load modules.
