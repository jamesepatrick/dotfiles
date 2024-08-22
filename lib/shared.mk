_SHELL := $(shell which zsh )
ifndef _SHELL
  $(error ZSH is not installed on this machine. This makefile requires ZSH features)
endif
SHELL := $(_SHELL)

ifeq ($(shell $(MAKE) -v | grep GNU),)
  $(error I need gnumake not bsdmake)
endif
REQUIRED_V := 3.82
ifneq ($(REQUIRED_V),$(firstword $(sort $(MAKE_VERSION) $(REQUIRED_V))))
  $(error For .ONESHELL to work I need at least version $(REQUIRED_V))
endif
.ONESHELL:

# Helper scripts for setting up and taking down links.
LIB_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
mk_link := $(LIB_DIR)/helper/mk_link
rm_link := $(LIB_DIR)/helper/rm_link
report  := LAST_RETURN=$$? $(LIB_DIR)/helper/report

# Shortcut for the XDG dir if it exist. default to ~/.config
XDG_DIR := $${XDG_CONFIG_HOME:-~/.config}


# TURN THIS OFF FOR DEBUGGING
MAKEFLAGS += --silent

.PHONY: install update init remove
