#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2019 The LineageOS Project
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

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
    init_exec.cpp \
    init_files.cpp \
    init_io.cpp \
    init_main.cpp \
    init_ramdisk.cpp \
    ../extract_ramdisk/extract_ramdisk.cpp

LOCAL_C_INCLUDES := \
    ../extract_ramdisk

ifneq ($(BOARD_SONY_INIT_INCLUDE),)
LOCAL_C_INCLUDES += \
    $(BOARD_SONY_INIT_INCLUDE)
endif

LOCAL_CPPFLAGS := \
    -Wall \
    -Wextra \
    -Werror

ifneq ($(BOARD_SONY_INIT_FLAGS),)
LOCAL_CFLAGS += \
    $(BOARD_SONY_INIT_FLAGS)
endif

LOCAL_MODULE := init_sony
LOCAL_MODULE_TAGS := optional

LOCAL_MODULE_PATH := $(TARGET_RAMDISK_OUT)/sbin
LOCAL_UNSTRIPPED_PATH := $(TARGET_RAMDISK_OUT_UNSTRIPPED)

LOCAL_FORCE_STATIC_EXECUTABLE := true
LOCAL_STATIC_LIBRARIES := \
    libbase \
    libc \
    libelf \
    liblzma \
    libz

LOCAL_CLANG := true

include $(BUILD_EXECUTABLE)
