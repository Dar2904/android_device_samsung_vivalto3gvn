#
# Copyright 2016 The Android Open Source Project
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

# Boot animation
TARGET_SCREEN_HEIGHT := 320
TARGET_SCREEN_WIDTH := 181

# Inherit common Slim configuration
$(call inherit-product, vendor/slim/config/common_full_phone.mk)

# Inherit AOSP device configuration
$(call inherit-product, device/samsung/vivalto3gvn/aosp_vivalto3gvn.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/vivalto3gvn/device_vivalto3gvn.mk)

# Overlay
DEVICE_PACKAGE_OVERLAYS += \
	device/samsung/vivalto3gvn/overlay \

# Override build date
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

# Device identifier
PRODUCT_DEVICE := vivalto3gvn
PRODUCT_NAME := slim_vivalto3gvn
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-G313HZ
PRODUCT_MANUFACTURER := samsung
PRODUCT_CHARACTERISTICS := phone
