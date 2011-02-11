include theos/makefiles/common.mk

LIBRARY_NAME = Maps
Maps_FILES = Maps.m
Maps_INSTALL_PATH = /Library/ActionMenu/Plugins/
Maps_FRAMEWORKS = UIKit
Maps_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/library.mk
