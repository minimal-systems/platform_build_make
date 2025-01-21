#
# Copyright (C) 2008 The Android Open Source Project
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

#
# A central place to define mappings to paths, to avoid hard-coding
# them in Bootstrap.mk files. Not meant for header file include directories,
# despite the fact that it was historically used for that!
#
# If you want this for a library's header files, use LOCAL_EXPORT_C_INCLUDES
# instead. Then users of the library don't have to do anything --- they'll
# have the correct header files added to their include path automatically.
#

#
# TODO: Allow each project to define stuff like this before the per-module
#       Android.mk files are included, so we don't need to have a big central
#       list.
#

#
# A mapping from shorthand names to include directories.
#
pathmap_INCL := \
    libhardware:hardware/libhardware/include \
    libhardware_legacy:hardware/libhardware_legacy/include \
    system-core:system/core/include \
    audio:external/pulseaudio/pulse \
    audio-effects:external/pulseaudio/pulsecore \
    audio-utils:external/pulseaudio/utils \
    audio-route:external/pulseaudio/modules \
    gnome:packages/apps/Gnome/include \
    gnome-apps:packages/apps/Gnome/extra/include \
    vendor-nvidia:vendor/nvidia/include \

#
# Returns the path to the requested module's include directory,
# relative to the root of the source tree.  Does not handle external
# modules.
#
# $(1): a list of modules (or other named entities) to find the includes for
#
define include-path-for
$(foreach n,$(1),$(patsubst $(n):%,%,$(filter $(n):%,$(pathmap_INCL))))
endef
