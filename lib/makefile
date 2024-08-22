# -*- mode: makefile-gmake; -*-
SRC_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
GIT_HOOK_SRC = $(SRC_DIR)/post-merge
GIT_HOOK_TARGET = $(abspath $(SRC_DIR)/..)/.git/hooks/post-merge

include ../lib/shared.mk

init:
	$(report) header "Setting up this stuff"
	$(report) pass "githook symlinked `ln -svf $(GIT_HOOK_SRC) $(GIT_HOOK_TARGET)`"
	$(MAKE) -C $(SRC_DIR) fix_http_repo

fix_http_repo:
	cd $(SRC_DIR)
	if [[ $$(git remote get-url origin) == http* ]] ; then
		git remote set-url origin git@git.jpatrick.io:james/dotfiles.git \
			; $(report) "Reseting git remote http(s) -> ssh repo"
	else
		$(report) debug "git repo deosn't start with http. So no need to reset remote."
	fi

up: init

down:
	$(report) header "Removing githook"
	$(rm_link) $(GIT_HOOK_TARGET)
