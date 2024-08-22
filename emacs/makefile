# -*- mode: makefile-gmake; -*-
SRC_DIR    := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
EMACSD     := ~/.emacs.d

# Doom Config
DOOMD      := ~/.doom.d
DOOM_URL   := https://github.com/doomemacs/doomemacs

include ../lib/shared.mk

up: setup
	if [ -e $(EMACSD)/bin/doom ] ; then
		~/.emacs.d/bin/doom sync \
			; $(report) "doom sync"
		~/.emacs.d/bin/doom purge \
			; $(report) "doom purge"
	else
		$(report) debug "doom not setup, so not updating."
	fi

down:
	$(report) header "Removing Emacs configuration"
	rm -rf $(EMACSD) ; $(report) "deleted $(EMACSD)"
	$(rm_link) $(DOOMD)


setup:
	if (( ! $$+commands[emacs] )) ; then
		$(report) debug "Emacs not installed. Skipping install."
	elif [[ -v $$SSH_TTY ]] ; then
		$(report) debug "This is a SSH connection. Skipping."
	else
		$(report) header "emacs init"
		$(mk_link) $(SRC_DIR) $(DOOMD)
		$(MAKE) -C $(SRC_DIR) doom_init
	fi

doom_init:
	if [ ! -e $(EMACSD) ] ; then
		git clone $(DOOM_URL) $(EMACSD)
		~/.emacs.d/bin/doom install \
			; $(report) "doom install"
		~/.emacs.d/bin/doom compile \
			; $(report) "doom core compile"
	else
		$(report) debug "emacsd already exists. Skipping"
	fi
