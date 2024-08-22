# -*- mode: makefile-gmake; -*-
SRC := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

include ../lib/shared.mk
ZSH_DIR :=  ~/.zsh
ZGENOM_DIR :=  ~/.zgenom

up: init
	if [ ! -d $(ZGENOM_DIR) ] ; then
		$(report) error "$(ZGENOM_DIR) doesn't exist - run init first."
		return
	fi
	source $(ZGENOM_DIR)/zgenom.zsh

down:
	rm -rf $(ZGENOM_DIR) ; $(report) "deleting zgenom dir"
	$(rm_link) ~/.zprofile
	$(rm_link) ~/.zlogin
	$(rm_link) ~/.zshrc
	$(rm_link) ~/.zsh
	$(rm_link) ~/.zshenv
	$(rm_link) ~/.zlogout

init:
	$(info => Setting up zsh)
	$(MAKE) -C $(SRC) init_zgenom
	$(mk_link) $(SRC) ~/.zsh
	$(mk_link) $(ZSH_DIR)/zshrc ~/.zshrc
	$(mk_link) $(ZSH_DIR)/zlogin ~/.zlogin
	$(mk_link) $(ZSH_DIR)/zprofile ~/.zprofile
	$(mk_link) $(ZSH_DIR)/zshenv ~/.zshenv
	$(mk_link) $(ZSH_DIR)/zlogout ~/.zlogout
	chmod 700 $(ZSH_DIR)/cache \
		; $(report) "updating cache permissions"

init_zgenom:
	if [ -e $(ZGENOM_DIR) ] ; then
	  $(report) debug "zgenom already installed. Skipping"
		return
	fi
	git clone https://github.com/jandamm/zgenom.git "${HOME}/.zgenom" \
		; $(report) "zgenom installed"
