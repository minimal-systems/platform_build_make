# Absolute path of the present working direcotry.
# This overrides the shell variable $PWD, which does not necessarily points to
# the top of the source tree, for example when "make -C" is used in m/mm/mmm.
PWD := $(shell pwd)

# This is the default target.  It must be the first declared target.
.PHONY: linux
DEFAULT_GOAL := linux
$(DEFAULT_GOAL): linux_targets

.PHONY: linux_targets
linux_targets: