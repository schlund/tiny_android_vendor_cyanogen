# Inherit AOSP device configuration for photon.
$(call inherit-product, device/htc/photon/photon.mk)

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/cyanogen/products/common_full.mk)

# Include GSM stuff
$(call inherit-product, vendor/cyanogen/products/gsm.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := cyanogen_photon
PRODUCT_BRAND := htc
PRODUCT_DEVICE := photon
PRODUCT_MODEL := Photonic
PRODUCT_MANUFACTURER := HTC
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=htc_photon BUILD_ID=GRK39F BUILD_FINGERPRINT=google/passion/passion:2.3.6/GRK39F/189904:user/release-keys PRIVATE_BUILD_DESC="passion-user 2.3.6 GRK39F 189904 release-keys"

PRODUCT_SPECIFIC_DEFINES += TARGET_PRELINKER_MAP=$(TOP)/vendor/cyanogen/prelink-linux-arm-msm722x.map

# CYANOGEN_WITH_GOOGLE := true

# Broadcom FM radio
$(call inherit-product, vendor/cyanogen/products/bcm_fm_radio.mk)

# Release name and versioning, comment BUILDTYPE to create release
CM_BUILD := photonic
CM_BUILDTYPE := EXPERIMENTAL
BUILD_NUM := 10
CYANOGEN_EXTRAVERSION := r$(BUILD_NUM)

# GOO Manager
PRODUCT_PROPERTY_OVERRIDES += \
	ro.goo.developerid=schlund \
	ro.goo.board=$(PRODUCT_DEVICE) \
	ro.goo.rom=$(PRODUCT_MODEL) \
	ro.goo.version=$(BUILD_NUM)

PRODUCT_VERSION_DEVICE_SPECIFIC :=
-include vendor/cyanogen/products/common_versions.mk

#
# Copy photon specific prebuilt files
#
PRODUCT_COPY_FILES +=  \
    vendor/cyanogen/prebuilt/mdpi/media/bootanimation.zip:system/media/bootanimation.zip
