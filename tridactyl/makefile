# -*- mode: makefile-gmake; -*-
SRC_DIR    := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

include ../lib/shared.mk
RC_TARGET := $(XDG_DIR)/tridactyl
SCRIPTS_TARGET := ~/.local/share/tridactyl/scripts

up:
	if [[ $$OSTYPE = darwin* ]] ; then
		$(MAKE) -C $(SRC_DIR) setup
	elif (( $$+commands[firefox] )) ; then
		$(MAKE) -C $(SRC_DIR) setup
	else
		$(report) debug "This doesn't seem to be an env for Tridactyl. Skipping."
	fi

down:
	$(report) header "Removing Tridaycl"
	$(rm_link) $(RC_TARGET)
	$(rm_link) $(SCRIPTS_TARGET)

setup:
	$(report) header "Setting up Tridaycl"
	$(mk_link) $(SRC_DIR) $(RC_TARGET)
	$(mk_link) $(SRC_DIR)/scripts $(SCRIPTS_TARGET)

