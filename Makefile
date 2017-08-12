ARCHS = armv7 armv7s arm64
include /var/theos/makefiles/common.mk

APPLICATION_NAME = InstallousX
InstallousX_FILES = main.m InstallousXApplication.mm RootViewController.mm
InstallousX_FRAMEWORKS = UIKit CoreGraphics

include $(THEOS_MAKE_PATH)/application.mk
