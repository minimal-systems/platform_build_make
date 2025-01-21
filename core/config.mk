# This is included by the top-level Makefile.
# It sets up standard variables based on the
# current configuration and platform, which
# are not specific to what is being built.

BUILD_SYSTEM :=$= build/make/core
BUILD_SYSTEM_COMMON :=$= build/make/common

include $(BUILD_SYSTEM_COMMON)/core.mk

# Used to force goals to build.  Only use for conditionally defined goals.
.PHONY: FORCE
FORCE:

ORIGINAL_MAKECMDGOALS := $(MAKECMDGOALS)

UNAME := $(shell uname -sm)

SRC_TARGET_DIR := $(TOPDIR)build/make/target

# Set up efficient math functions which are used in make.
# Here since this file is included by envsetup as well as during build.
include $(BUILD_SYSTEM_COMMON)/math.mk

include $(BUILD_SYSTEM_COMMON)/strings.mk

include $(BUILD_SYSTEM_COMMON)/json.mk

# Various mappings to avoid hard-coding paths all over the place
include $(BUILD_SYSTEM)/pathmap.mk
