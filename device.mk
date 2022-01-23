### DALVIK
$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk)

DEVICE_PATH := device/motorola/guamp
BOARD_BUILD_PRODUCT_IMAGE := false
BOARD_BUILD_VENDOR_IMAGE := true
BOARD_SYSTEMSDK_VERSIONS := 29
PRODUCT_BUILD_SUPER_PARTITION := false
PRODUCT_COMPATIBLE_PROPERTY_OVERRIDE := true
PRODUCT_SHIPPING_API_LEVEL := 29
PRODUCT_TARGET_VNDK_VERSION := 30
PRODUCT_USE_DYNAMIC_PARTITIONS := true
TARGET_SCREEN_HEIGHT := 1600
TARGET_SCREEN_WIDTH := 720
PRODUCT_SOONG_NAMESPACES += $(DEVICE_PATH)
$(call inherit-product-if-exists, vendor/motorola/guamp/guamp-vendor.mk)

PRODUCT_HOST_PACKAGES += \
    libbluetooth \
    libbluetooth_qti
    
PRODUCT_COPY_FILES += \
$(DEVICE_PATH)/rootdir/system/lib/libbluetooth.so:system/lib/libbluetooth.so \
$(DEVICE_PATH)/rootdir/system/etc/apns-conf.xml:system/etc/apns-conf.xml
