# Hack for build
$(shell mkdir -p $(OUT)/obj/KERNEL_OBJ/usr)
$(shell mkdir -p $(OUT)/system/lib/modules)
$(shell mkdir -p $(OUT)/system/vendor/firmware)
$(shell cp $(ANDROID_BUILD_TOP)/device/samsung/vivalto3gvn/prop/vbc_eq $(OUT)/system/vendor/firmware)

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

ALL_PREBUILT += $(INSTALLED_KERNEL_TARGET)

# include the non-open-source counterpart to this file
-include vendor/samsung/vivalto3gvn/AndroidBoardVendor.mk
