# -*- mode: makefile-gmake; -*-
SRC_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
SOURCE :=  $(SRC_DIR)/gitconfig
TARGET :=  ~/.gitconfig

include ../lib/shared.mk

init:
	$(report) header "Setting up gitconfig"
	$(mk_link) $(SOURCE) $(TARGET)
	touch $(TARGET).local

up: init

down:
	$(report) header "Removing gitconfig"
	$(rm_link) $(TARGET)
