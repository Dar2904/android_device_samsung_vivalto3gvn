# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/core.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Boot animation
TARGET_SCREEN_HEIGHT := 480
TARGET_SCREEN_WIDTH := 320

# Release name
PRODUCT_RELEASE_NAME := vivalto3gvn

# Inherit device configuration
$(call inherit-product, $(LOCAL_PATH)/device_vivalto3gvn.mk)

# Overlay
DEVICE_PACKAGE_OVERLAYS += \
	device/samsung/vivalto3gvn/overlay \

# Override build date
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := vivalto3gvn
PRODUCT_NAME := slim_vivalto3gvn
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-G313HZ
PRODUCT_MANUFACTURER := samsung
PRODUCT_CHARACTERISTICS := phone
