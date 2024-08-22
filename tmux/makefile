# -*- mode: makefile-gmake; -*-
SRC_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

SOURCE :=  $(SRC_DIR)/tmux.conf
TARGET :=  ~/.tmux.conf

include ../lib/shared.mk

up:
	if (( ! $$+commands[tmux] )) ; then
		$(report) header "tmux not installed"
	else
		$(report) header "tmux init"
		$(mk_link) $(SOURCE) $(TARGET)
	fi

down:
	$(report) header "Removing tmux config"
	$(rm_link) $(TARGET)
