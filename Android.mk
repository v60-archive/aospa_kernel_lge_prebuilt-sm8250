#
# SPDX-FileCopyrightText: Paranoid Android
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),timelm)
# With a prebuilt kernel nothing runs headers_install, but the qcom Make
# modules read the kernel uapi from KERNEL_OBJ/usr (with
# TARGET_COMPILE_WITH_MSM_KERNEL). Give them the arm64 set, as
# headers_install would.
TIMELM_KERNEL_HEADERS := $(LOCAL_PATH)/kernel-headers
$(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr: $(shell find $(TIMELM_KERNEL_HEADERS)/include $(TIMELM_KERNEL_HEADERS)/arm64 -type f)
	rm -rf $@
	mkdir -p $@/include
	cp -r $(TIMELM_KERNEL_HEADERS)/include/. $@/include/
	cp -r $(TIMELM_KERNEL_HEADERS)/arm64/. $@/include/
	touch $@
endif
