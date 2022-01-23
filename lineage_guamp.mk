$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Inherit device configuration
$(call inherit-product, device/motorola/guamp/device.mk)

### LINEAGE
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Device identifier. This must come after all inclusions.
PRODUCT_NAME := lineage_guamp
PRODUCT_DEVICE := guamp
PRODUCT_BRAND := motorola
PRODUCT_MODEL := motorola
PRODUCT_MANUFACTURER := motorola
PRODUCT_RELEASE_NAME := motorola
PRODUCT_GMS_CLIENTID_BASE := android-motorola

ifneq ($(SIGN_BUILD),true)
PRODUCT_BUILD_PROP_OVERRIDES += \
        BUILD_FINGERPRINT=motorola/msi/msi:11/RPXS31.Q2-58-17-4-1/9f01c:user/release-keys \
        PRIVATE_BUILD_DESC="msi-user 11 RPXS31.Q2-58-17-4-1 9f01c release-keys"
endif
