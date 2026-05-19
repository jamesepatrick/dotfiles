# -*- mode: makefile-gmake; -*-
SRC_DIR    := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
CONFIG_DIR     := ~/.config/opencode

include ../lib/shared.mk

up:
	if (( ! $$+commands[opencode] )) ; then
		$(report) debug "opencode not installed. Skipping install."
		return
	fi
	$(report) header "opencode init"
	mkdir -p $(CONFIG_DIR)
	$(mk_link) $(SRC_DIR)/opencode.json $(CONFIG_DIR)/opencode.json
	$(mk_link) $(SRC_DIR)/dcp.jsonc $(CONFIG_DIR)/dcp.jsonc

down:
	$(report) header "clearing opencode"
	$(rm_link) $(CONFIG_DIR)/opencode.json
	$(rm_link) $(CONFIG_DIR)/dcp.jsonc
