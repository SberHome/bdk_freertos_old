OS := $(shell uname)

GREEN := 
RED := 
NC := 


ifeq ($(findstring bash, $(shell readlink $(SHELL))), bash)
ECHO = echo -e
else
ECHO = echo
endif

ifeq ($(findstring MINGW32_NT, $(OS)), MINGW32_NT) 
define update_sys_config_if_needed
	tools\scripts\generate_sys_config.bat $(1)
	tools\scripts\pick_beken_libs.bat $(1)
endef

.config: config/sys_config.h
	@echo "$(RED)Warning: build on Windows, generate empty .config$(NC)"
	@touch .config
else ifeq ($(findstring CYGWIN, $(OS)), CYGWIN) 
define update_sys_config_if_needed
	tools/scripts/generate_sys_config.bat $(1)
	tools/scripts/pick_beken_libs.bat $(1)
endef

.config: config/sys_config.h
	@echo "$(RED)Warning: build on Windows, generate empty .config$(NC)"
	@touch .config
else

GREEN := \033[0;32m
RED := \033[0;31m
NC := \033[0m # No Color

define update_sys_config_if_needed
	./tools/scripts/generate_sys_config.sh $(1)
	./tools/scripts/pick_beken_libs.sh $(1)
endef

.config: config/sys_config.h
	@echo "  $(GREEN)GEN  .config$(NC)"
	@-rm -f $@
	@echo '#include "config/sys_config.h"' > config.c
	@sed -n '/^#define/p' config/sys_config.h | awk '{print $$2}' | sort -d | uniq | awk '{print "valueOf_"$$1"="$$1}' >> config.c
	@echo "# Autogenerated by Makefile, DON'T EDIT" > .config
	@$(ARM_GCC_TOOLCHAIN)arm-none-eabi-gcc -E config.c | grep '^valueOf_' | sed 's/valueOf_//' >> .config
	@sed -i '/_SYS_CONFIG_H_/d' .config
	@-rm -f config.c

endif

export GREEN RED NC ECHO

.PHONY: help
help: 
	@echo "Usage of build with Beken SDK with Makefile"
	@echo ""
	@echo "ip              build wifi library"
	@echo "ble             build ble  library"
	@echo "clean           clean project"
	@echo "bk7231          build bk7231 default project"
	@echo "bk7231u         build bk7231u default project"
	@echo "bk7231n         build bk7231n default project"
	@echo "bk7251          build bk7251 default project"
	@echo "bk7271          build bk7271 default project"

.PHONY: ip
ip: 
	@$(MAKE) -f application.mk ip

.PHONY: ble
ble: 
	@$(MAKE) -f application.mk ble

.PHONY: usb
usb: 
	@$(MAKE) -f application.mk usb

.PHONY: sensor
sensor: 
	@$(MAKE) -f application.mk sensor

.PHONY: cal 
cal: 
	@$(MAKE) -f application.mk cal 

.PHONY: supplicant 
supplicant: 
	@$(MAKE) -f application.mk supplicant

.PHONY: uart_debug
uart_debug: 
	@$(MAKE) -f application.mk uart_debug

.PHONY: rf_test
rf_test: 
	@$(MAKE) -f application.mk rf_test

.PHONY: rf_use
rf_use: 
	@$(MAKE) -f application.mk rf_use

.PHONY: clean
clean:
	@$(MAKE) -f application.mk clean

.PHONY: cleanlib
cleanlib:
	@$(MAKE) -f application.mk cleanlib
	
.PHONY: flash out ramdebug setup
setup:
	@$(MAKE) -f application.mk $(MAKECMDGOALS)

flash: toolchain
	@$(MAKE) -f application.mk flashburn
	
out: toolchain
	@$(MAKE) -f application.mk out

ramdebug: toolchain
	@$(MAKE) -f application.mk ramdebug	

%:
	@$(ECHO) "Build for $(GREEN)$@$(NC)..."
	@$(call update_sys_config_if_needed, $@)
	@$(MAKE) -f application.mk application
