SRC_DIR    := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
TARGET_DIR := ~/.vim
PLUG_URL   := https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
PLUG_PATH  := $(SRC_DIR)/autoload/plug.vim

include ../lib/shared.mk

up: init
	if (( $$+commands[vim] )) ; then
		$(report) header "Upgrading vim"
		curl -fsLo $(PLUG_PATH) $(PLUG_URL) \
			; $(report) "vim plug setup"
		vim +PlugInstall +PlugUpdate +PlugClean +qall \
			; $(report) "downloading/updating plugins"
		stty sane # dropping in & out causes some weird tty behavior.
	else
		$(report) warn "cannot find vim?"
	fi

down:
	$(report) header "Removing vim config"
	$(rm_link) ~/.vimrc
	$(rm_link) $(TARGET_DIR)

init:
	if (( $$+commands[vim] )) ; then
		$(report) header "Setting up vim"
		mkdir -p $(TARGET_DIR)
		$(mk_link) $(SRC_DIR)/vimrc ~/.vimrc
		$(mk_link) $(SRC_DIR)/vimrc.d $(TARGET_DIR)/vimrc.d
		$(mk_link) $(SRC_DIR)/spell $(TARGET_DIR)/spell
		$(mk_link) $(SRC_DIR)/ftplugin $(TARGET_DIR)/ftplugin
		( mkdir -p $(TARGET_DIR)/backup \
			&& chmod 700 $(TARGET_DIR)/backup ) \
			; $(report) "setting up backup dir"
	else
		$(report) warn "cannot find vim?"
	fi

