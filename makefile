# -*- mode: makefile-gmake; -*-
SRC_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

include lib/shared.mk

define recursive_make
	for i in */makefile; do
   echo "`dirname $$i` "
   $(MAKE) --keep-going -C $(SRC_DIR)/`dirname $$i` $1
   echo ""
  done
endef

up:
	$(call recursive_make,up)

down:
	$(call recursive_make,down)
