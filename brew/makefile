# -*- mode: makefile-gmake; -*-
SRC_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
SOURCE :=  $(SRC_DIR)/Brewfile
TARGET :=  ~/.Brewfile

include ../lib/shared.mk

init:
	if [[ $$OSTYPE != darwin* ]] ; then
		$(report) debug "This doesn't seem to be a macOS env. Skipping."
		return
	fi
	if (( ! $$+commands[brew] )) ; then
		$(report) header "installing brew"
		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" \
			; $(report) "Brew installed."
		xcode-select --install \
			; $(report) "Xcode CLI tools installed."
	fi

up: init
	if [[ $$OSTYPE != darwin* ]] ; then
		$(report) debug "This doesn't seem to be a macOS env. Skipping."
		return
	fi
	$(report) header "Updating BrewFile"
	$(mk_link) $(SOURCE) $(TARGET)
	brew bundle install --global --cleanup ; $(report) "Brew Updated"

down:
	$(report) header "Removing BrewFile"
	$(rm_link) $(TARGET)
