#Hack for build
$(shell mkdir -p $(OUT)/system/app)
$(shell cp $(ANDROID_BUILD_TOP)/device/samsung/vivalto3gvn/prop/Term.apk $(OUT)/system/app)
$(shell mkdir -p $(ANDROID_BUILD_TOP)/vendor/cm/proprietary)
$(shell cp $(ANDROID_BUILD_TOP)/device/samsung/vivalto3gvn/prop/Term.apk $(ANDROID_BUILD_TOP)/vendor/cm/proprietary)
$(shell mkdir -p $(ANDROID_BUILD_TOP)/vendor/cm/proprietary/lib/armeabi)
$(shell cp $(ANDROID_BUILD_TOP)/device/samsung/vivalto3gvn/prop/libjackpal-androidterm5.so $(ANDROID_BUILD_TOP)/vendor/cm/proprietary/lib/armeabi)
$(shell cp $(ANDROID_BUILD_TOP)/device/samsung/vivalto3gvn/prop/libjackpal-termexec2.so $(ANDROID_BUILD_TOP)/vendor/cm/proprietary/lib/armeabi)
$(shell cp $(ANDROID_BUILD_TOP)/device/samsung/vivalto3gvn/prop/sec_format.h $(ANDROID_BUILD_TOP)/frameworks/av/media/libstagefright)
$(shell cp $(ANDROID_BUILD_TOP)/device/samsung/vivalto3gvn/prop/sec_format.h $(ANDROID_BUILD_TOP)/frameworks/av/media/libstagefright/include)
$(shell mkdir -p $(OUT)/system/vendor/firmware)
$(shell cp $(ANDROID_BUILD_TOP)/device/samsung/vivalto3gvn/prop/vbc_eq $(OUT)/system/vendor/firmware)
$(shell mkdir -p $(OUT)/system/lib/modules)

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

ALL_PREBUILT += $(INSTALLED_KERNEL_TARGET)

# include the non-open-source counterpart to this file
-include vendor/samsung/vivalto3gvn/AndroidBoardVendor.mk
