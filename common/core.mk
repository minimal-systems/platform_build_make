#
# Generic Linux Build Script
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Use bash as the default shell. Allow overriding with LINUX_BUILD_SHELL.
ifdef LINUX_BUILD_SHELL
SHELL := $(LINUX_BUILD_SHELL)
else
# Default to bash to ensure consistency.
SHELL := /bin/bash
endif

# Utility variables.
empty :=
space := $(empty) $(empty)
comma := ,
# Note that make will eat the newline just before endef.
define newline


endef
# The pound character "#"
define pound
#
endef
# Define backslash for usage in makefiles.
backslash := \a
backslash := $(patsubst %a,%,$(backslash))

# Base directory variables.
TOP := $= .
TOPDIR := $=

# Basic warning/error wrappers. These can be extended for specific modules.
define pretty-warning
$(warning $(1))
endef

define pretty-error
$(error $(1))
endef
