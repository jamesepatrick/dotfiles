# -*- mode: makefile-gmake; -*-
SRC_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

CONFIG_SRC :=  $(SRC_DIR)/config
CONFIG_TRGT :=  ~/.ssh/config
GIT_KEY := ~/.ssh/git.jpatrick.io

include ../lib/shared.mk

up: init
	mkdir -p public_keys/`hostname`
	cd ~/.ssh
	$(report) header "Copying public keys"
	for i in *.pub ; do
		cp $$i public_keys/`hostname`/$$i
		$(report) pass "Copied $$i"
	done

down:
	$(report) header "Removing ssh sym-links"
	$(rm_link) $(CONFIG_TRGT)
	$(report) warn "NOTE: All keys still remain."

init:
	$(report) header "Setting up ssh"
	$(mk_link) $(CONFIG_SRC) $(CONFIG_TRGT)
	$(mk_link) $(SRC_DIR)/public_keys ~/.ssh/public_keys
    mkdir -p ~/.ssh/config.d
	$(MAKE) -C $(SRC_DIR) init_git_key

init_git_key:
	if [[ -e $(GIT_KEY) ]] ; then
		$(report) debug "$(GIT_KEY) already installed."
	else
		$(report) info "Setting up key for git.jpatrick.io"
		ssh-keygen -t ed25519 -C "`hostname`: `date`" -f $(GIT_KEY)  -N "" \
			; $(report) info "git.jpatrick.io key created"
	fi
