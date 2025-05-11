#Hack for build
$(shell mkdir -p $(OUT)/obj/KERNEL_OBJ/usr)
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
$(shell mkdir -p $(OUT)/obj/GYP/shared_intermediates/blink)
CSS_GRAMMAR_DIR := $(ANDROID_BUILD_TOP)/external/chromium_org/third_party/WebKit/Source/core/css
X_PATH_DIR := $(ANDROID_BUILD_TOP)/external/chromium_org/third_party/WebKit/Source/core/xml
BLINK_OUT := $(OUT)/obj/GYP/shared_intermediates/blink
$(shell bison -d -o $(CSS_GRAMMAR_DIR)/CSSGrammar.cpp $(CSS_GRAMMAR_DIR)/CSSGrammar.y)
$(shell cp -f $(CSS_GRAMMAR_DIR)/CSSGrammar.h $(CSS_GRAMMAR_DIR)/CSSGrammar.hpp)
$(shell cp -f $(CSS_GRAMMAR_DIR)/CSSGrammar.h $(BLINK_OUT)/CSSGrammar.h)
$(shell cp -f $(CSS_GRAMMAR_DIR)/CSSGrammar.hpp $(BLINK_OUT)/CSSGrammar.hpp)
$(shell bison -d -o $(X_PATH_DIR)/XPathGrammar.cpp $(X_PATH_DIR)/XPathGrammar.y)
$(shell cp -f $(X_PATH_DIR)/XPathGrammar.h $(X_PATH_DIR)/XPathGrammar.hpp)
$(shell cp -f $(X_PATH_DIR)/XPathGrammar.h $(BLINK_OUT)/XPathGrammar.h)
$(shell cp -f $(X_PATH_DIR)/XPathGrammar.hpp $(BLINK_OUT)/XPathGrammar.hpp)
$(shell cp $(ANDROID_BUILD_TOP)/device/samsung/vivalto3gvn/prop/strings.xml $(ANDROID_BUILD_TOP)/packages/apps/Settings/res/values)
$(shell cp $(ANDROID_BUILD_TOP)/device/samsung/vivalto3gvn/prop/attrs.xml $(ANDROID_BUILD_TOP)/packages/apps/Settings/res/values)
$(shell cp $(ANDROID_BUILD_TOP)/device/samsung/vivalto3gvn/prop/ic_bars.xml $(ANDROID_BUILD_TOP)/packages/apps/Settings/res/drawable)
$(shell cp $(ANDROID_BUILD_TOP)/device/samsung/vivalto3gvn/prop/ic_menus.xml $(ANDROID_BUILD_TOP)/packages/apps/Settings/res/drawable)
$(shell cp $(ANDROID_BUILD_TOP)/device/samsung/vivalto3gvn/prop/ic_notifications.xml $(ANDROID_BUILD_TOP)/packages/apps/Settings/res/drawable)
$(shell cp $(ANDROID_BUILD_TOP)/device/samsung/vivalto3gvn/prop/ic_navigation_ring_hint.xml $(ANDROID_BUILD_TOP)/packages/apps/Settings/res/drawable)
$(shell cp $(ANDROID_BUILD_TOP)/device/samsung/vivalto3gvn/prop/PhoneFactory.java $(ANDROID_BUILD_TOP)/frameworks/opt/telephony/src/java/com/android/internal/telephony)
$(shell cp $(ANDROID_BUILD_TOP)/device/samsung/vivalto3gvn/prop/Settings.java $(ANDROID_BUILD_TOP)/packages/apps/Settings/src/com/android/settings)
$(shell cp $(ANDROID_BUILD_TOP)/device/samsung/vivalto3gvn/prop/SoundSettings.java $(ANDROID_BUILD_TOP)/packages/apps/Settings/src/com/android/settings)
$(shell cp $(ANDROID_BUILD_TOP)/device/samsung/vivalto3gvn/prop/QuietHours.java $(ANDROID_BUILD_TOP)/packages/apps/Settings/src/com/android/settings/slim)
$(shell cp $(ANDROID_BUILD_TOP)/device/samsung/vivalto3gvn/prop/rule_bison.py $(ANDROID_BUILD_TOP)/external/chromium_org/third_party/WebKit/Source/build/scripts)

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

ALL_PREBUILT += $(INSTALLED_KERNEL_TARGET)

# include the non-open-source counterpart to this file
-include vendor/samsung/vivalto3gvn/AndroidBoardVendor.mk
