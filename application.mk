# Add path of toolchain to system path first, or enable ARM_GCC_TOOLCHAIN 
# -------------------------------------------------------------------
#ARM_GCC_TOOLCHAIN = toolchain/gcc-arm-none-eabi-4_9-2015q1/bin/

ARM_GCC_TOOLCHAIN = ${FREERTOS_EXEC_PATH}
CROSS_COMPILE = $(ARM_GCC_TOOLCHAIN)arm-none-eabi-

# Compilation tools
AR = $(CROSS_COMPILE)ar
CC = $(CROSS_COMPILE)gcc
AS = $(CROSS_COMPILE)as
NM = $(CROSS_COMPILE)nm
LD = $(CROSS_COMPILE)gcc
GDB = $(CROSS_COMPILE)gdb
OBJCOPY = $(CROSS_COMPILE)objcopy
OBJDUMP = $(CROSS_COMPILE)objdump

Q := @
ifeq ($(V),1)
Q := 
endif
OS := $(shell uname)
CFG_MBEDTLS ?= 0


ENCRYPT_ARGS = 
ifeq ($(findstring MINGW32_NT, $(OS)), MINGW32_NT) 
ENCRYPT = "./tools/crc_binary/encrypt.exe"
else ifeq ($(findstring CYGWIN, $(OS)), CYGWIN) 
ENCRYPT = "./tools/crc_binary/encrypt.exe"
else ifeq ($(findstring Darwin, $(OS)), Darwin) 
ENCRYPT = "./tools/crc_binary/encrypt.darwin"
ENCRYPT_ARGS = 0 0 0
else
ENCRYPT = "./tools/crc_binary/encrypt"
ENCRYPT_ARGS = 0 0 0
endif

ifeq ($(ECHO),)
ECHO=echo
endif

-include .config

# -------------------------------------------------------------------
# Initialize target name and target object files
# -------------------------------------------------------------------

all: application 

TARGET=out

OBJ_DIR=$(TARGET)
BIN_DIR=$(TARGET)

# -------------------------------------------------------------------
# Include folder list
# -------------------------------------------------------------------
INCLUDES =

INCLUDES += -I./config
INCLUDES += -I./release

INCLUDES += -I./FreeRTOSv9.0.0/FreeRTOS/Source/portable/Keil/ARM968es
INCLUDES += -I./FreeRTOSv9.0.0/FreeRTOS/Source/include

#demo module
INCLUDES += -I./demos
INCLUDES += -I./demos/application/ap_sta
INCLUDES += -I./demos/application/light/common
INCLUDES += -I./demos/application/light/light_client
INCLUDES += -I./demos/application/light/light_server
INCLUDES += -I./demos/application/param_manage
INCLUDES += -I./demos/common/base64
INCLUDES += -I./demos/common/json
INCLUDES += -I./demos/helloworld
INCLUDES += -I./demos/net/iperf
INCLUDES += -I./demos/net/mqtt
INCLUDES += -I./demos/net/mqtt
INCLUDES += -I./demos/net/tcp_client
INCLUDES += -I./demos/net/tcp_server
INCLUDES += -I./demos/net/uart1_tcp_server
INCLUDES += -I./demos/net/udp
INCLUDES += -I./demos/os/os_mutex
INCLUDES += -I./demos/os/os_queue
INCLUDES += -I./demos/os/os_sem
INCLUDES += -I./demos/os/os_thread
INCLUDES += -I./demos/os/os_timer
INCLUDES += -I./demos/peripheral
INCLUDES += -I./demos/peripheral/flash
INCLUDES += -I./demos/peripheral/gpio
INCLUDES += -I./demos/peripheral/pwm
INCLUDES += -I./demos/peripheral/uart
INCLUDES += -I./demos/peripheral/psram
INCLUDES += -I./demos/wifi/airkiss_station
INCLUDES += -I./demos/wifi/scan
INCLUDES += -I./demos/wifi/softap
INCLUDES += -I./demos/wifi/station
INCLUDES += -I./demos/wifi/station_power_save

# -------------------------------------------------------------------
# Source file list
# -------------------------------------------------------------------
SRC_C =
DRAM_C =
SRC_OS =
SRC_S =

#demo module
SRC_C += ./demos/application/ap_sta/ap_sta_demo.c
SRC_C += ./demos/application/light/common/light_commond.c
SRC_C += ./demos/application/light/common/light_commun_protocol.c
SRC_C += ./demos/application/light/light_client/light_client_app_demo.c
SRC_C += ./demos/application/light/light_client/light_client_sockt.c
SRC_C += ./demos/application/light/light_server/light_server_app.c
SRC_C += ./demos/application/light/light_server/light_socket.c
SRC_C += ./demos/application/param_manage/param_manage.c
SRC_C += ./demos/common/base64/base64_enc.c
SRC_C += ./demos/common/base64/base64_enc.c
SRC_C += ./demos/common/json/cJSON.c
SRC_C += ./demos/common/json/cJsontest.c
SRC_C += ./demos/helloworld/helloworld.c
SRC_C += ./demos/net/iperf/iperf.c
SRC_C += ./demos/net/mqtt/mqtt_echo.c
SRC_C += ./demos/net/mqtt/mqtt_test.c
SRC_C += ./demos/net/tcp_client/tcp_client_demo.c
SRC_C += ./demos/net/tcp_server/tcp_server_demo.c
SRC_C += ./demos/net/uart1_tcp_server/uart1_tcp_server_demo.c
SRC_C += ./demos/net/udp/udp_client_demo.c
SRC_C += ./demos/net/udp/udp_server_demo.c
SRC_C += ./demos/os/os_mutex/os_mutex.c
SRC_C += ./demos/os/os_queue/os_queue.c
SRC_C += ./demos/os/os_sem/os_sem.c
SRC_C += ./demos/os/os_thread/os_thread.c
SRC_C += ./demos/os/os_timer/os_timer.c
SRC_C += ./demos/peripheral/adc/test_adc.c
SRC_C += ./demos/peripheral/flash/test_flash.c
SRC_C += ./demos/peripheral/psram/test_psram.c
SRC_C += ./demos/peripheral/gpio/test_gpio.c
SRC_C += ./demos/peripheral/pwm/test_pwm.c
SRC_C += ./demos/peripheral/uart/test_uart.c
SRC_C += ./demos/wifi/airkiss_station/wifi_Airkiss_station.c
SRC_C += ./demos/wifi/scan/wifi_scan.c
SRC_C += ./demos/wifi/softap/wifi_delete_softap.c
SRC_C += ./demos/wifi/softap/wifi_softap.c
SRC_C += ./demos/wifi/station/wifi_station.c
SRC_C += ./demos/wifi/station_power_save/wifi_station_ps_demo.c
SRC_C += ./demos/demos_start.c

ifeq ($(CFG_BK_AWARE),1)
SRC_C += ./demos/wifi/bk_aware/bk_aware_demo.c
SRC_C += ./demos/wifi/bk_aware/bk_aware_crc.c
endif

ifeq ("${CFG_MBEDTLS}", "1")
SRC_C += ./demos/components/tls_demo/src/tls_demo.c
endif
#SRC_C += ./demos/components/mqtt_demo/src/mqtt_demo.c

#operation system module
SRC_OS += ./FreeRTOSv9.0.0/FreeRTOS/Source/croutine.c
SRC_OS += ./FreeRTOSv9.0.0/FreeRTOS/Source/event_groups.c
SRC_OS += ./FreeRTOSv9.0.0/FreeRTOS/Source/list.c
SRC_OS += ./FreeRTOSv9.0.0/FreeRTOS/Source/portable/Keil/ARM968es/port.c
SRC_OS += ./FreeRTOSv9.0.0/FreeRTOS/Source/portable/MemMang/heap_4.c
SRC_OS += ./FreeRTOSv9.0.0/FreeRTOS/Source/queue.c
SRC_OS += ./FreeRTOSv9.0.0/FreeRTOS/Source/tasks.c
SRC_OS += ./FreeRTOSv9.0.0/FreeRTOS/Source/timers.c

# Beken SDK include folder and source file list
-include ./beken378/beken_src.mk


# Generate obj list
# -------------------------------------------------------------------
OBJ_LIST = $(SRC_C:%.c=$(OBJ_DIR)/%.o)
DEPENDENCY_LIST = $(SRC_C:%.c=$(OBJ_DIR)/%.d)

OBJ_S_LIST = $(SRC_S:%.S=$(OBJ_DIR)/%.O)
DEPENDENCY_S_LIST = $(SRC_S:%.S=$(OBJ_DIR)/%.d)

OBJ_OS_LIST = $(SRC_OS:%.c=$(OBJ_DIR)/%.marm.o)
DEPENDENCY_OS_LIST = $(SRC_OS:%.c=$(OBJ_DIR)/%.d)

OBJ_BLE_LIST = $(SRC_BLE_C:%.c=$(OBJ_DIR)/%.o)
DEPENDENCY_LIST += $(SRC_BLE_C:%.c=$(OBJ_DIR)/%.d)

OBJ_RWNX_LIST = $(SRC_IP_C:%.c=$(OBJ_DIR)/%.o)
DEPENDENCY_LIST += $(SRC_IP_C:%.c=$(OBJ_DIR)/%.d)

OBJ_WPA_LIST = $(SRC_WPA_C:%.c=$(OBJ_DIR)/%.o)
DEPENDENCY_LIST += $(SRC_WPA_C:%.c=$(OBJ_DIR)/%.d)

OBJ_USB_LIST = $(SRC_USB_C:%.c=$(OBJ_DIR)/%.o)
DEPENDENCY_LIST += $(SRC_USB_C:%.c=$(OBJ_DIR)/%.d)

OBJ_SENSOR_LIST = $(SRC_SENSOR_C:%.c=$(OBJ_DIR)/%.o)
DEPENDENCY_LIST += $(SRC_SENSOR_C:%.c=$(OBJ_DIR)/%.d)

OBJ_CAL_LIST = $(SRC_CAL_C:%.c=$(OBJ_DIR)/%.o)
DEPENDENCY_LIST += $(SRC_CAL_C:%.c=$(OBJ_DIR)/%.d)

OBJ_SUPPLICANT_LIST = $(SRC_SUPPLICANT_C:%.c=$(OBJ_DIR)/%.o)
DEPENDENCY_LIST += $(SRC_SUPPLICANT_C:%.c=$(OBJ_DIR)/%.d)

OBJ_UART_DEBUG_LIST = $(SRC_UART_DEBUG_C:%.c=$(OBJ_DIR)/%.o)
DEPENDENCY_LIST += $(SRC_UART_DEBUG_C:%.c=$(OBJ_DIR)/%.d)

OBJ_RF_TEST_LIST = $(SRC_RF_TEST_C:%.c=$(OBJ_DIR)/%.o)
DEPENDENCY_LIST += $(SRC_RF_TEST_C:%.c=$(OBJ_DIR)/%.d)

OBJ_RF_USE_LIST = $(SRC_RF_USE_C:%.c=$(OBJ_DIR)/%.o)
DEPENDENCY_LIST += $(SRC_RF_USE_C:%.c=$(OBJ_DIR)/%.d)

ifeq ($(CFG_SOC_NAME), 1)
SOC_NAME_ELF = beken7231.elf
SOC_NAME_BIN = beken7231.bin
SOC_NAME_MAP = beken7231.map
SOC_NAME_LDS = bk7231.ld
SOC_NAME_BSP_LDS = bk7231_bsp.ld
else ifeq ($(CFG_SOC_NAME), 2)
SOC_NAME_ELF = beken7231u.elf
SOC_NAME_BIN = beken7231u.bin
SOC_NAME_MAP = beken7231u.map
SOC_NAME_LDS = bk7231.ld
SOC_NAME_BSP_LDS = bk7231_bsp.ld
else ifeq ($(CFG_SOC_NAME), 3)
SOC_NAME_ELF = beken7251.elf
SOC_NAME_BIN = beken7251.bin
SOC_NAME_MAP = beken7251.map
SOC_NAME_LDS = bk7231.ld
SOC_NAME_BSP_LDS = bk7231_bsp.ld
else ifeq ($(CFG_SOC_NAME), 5)
SOC_NAME_ELF = beken7231n.elf
SOC_NAME_BIN = beken7231n.bin
SOC_NAME_MAP = beken7231n.map
SOC_NAME_LDS = bk7231n.lds
SOC_NAME_BSP_LDS = bk7231n_bsp.lds
endif
SOC_NAME_BSP_ELF = beken7231_bsp.elf
SOC_NAME_BSP_BIN = beken7231_bsp.bin
SOC_NAME_BSP_MAP = beken7231_bsp.map

# Compile options
# -------------------------------------------------------------------
CFLAGS = -DCFG_OS_FREERTOS=1
CFLAGS += -g -mthumb -mcpu=arm968e-s -march=armv5te -mthumb-interwork -mlittle-endian -Os -std=c99 -ffunction-sections -Wall -Werror -Wno-format -Wno-unknown-pragmas -fsigned-char -fdata-sections -nostdlib -fno-strict-aliasing
#CFLAGS += -g -mthumb -mcpu=arm968e-s -march=armv5te -mthumb-interwork -mlittle-endian -Os -std=c99 -ffunction-sections -Wall -Wno-unused-function -fsigned-char -fdata-sections -Wunknown-pragmas -nostdlib -Wl,--gc-sections
CFLAGS += -DWIFI_BLE_COEXIST

ifeq ("${CFG_MBEDTLS}", "1")
CFLAGS += -DMBEDTLS_CONFIG_FILE=\"tls_config.h\"
endif

OSFLAGS = -DCFG_OS_FREERTOS=1
OSFLAGS += -g -marm -mcpu=arm968e-s -march=armv5te -mthumb-interwork -mlittle-endian -Os -std=c99 -ffunction-sections -Wall -fsigned-char -fdata-sections -Wunknown-pragmas
#OSFLAGS += -g -mthumb -mcpu=arm968e-s -march=armv5te -mthumb-interwork -mlittle-endian -Os -std=c99 -ffunction-sections -Wall -fsigned-char -fdata-sections -Wunknown-pragmas -Wl,--gc-sections

ASMFLAGS = 
ASMFLAGS += -g -marm -mthumb-interwork -mcpu=arm968e-s -march=armv5te -x assembler-with-cpp

LFLAGS = 
LFLAGS += -g -Wl,--gc-sections -marm -mcpu=arm968e-s -mthumb-interwork -nostdlib  -Xlinker -Map=beken.map
LFLAGS += -Wl,-wrap,malloc -Wl,-wrap,_malloc_r -Wl,-wrap,free -Wl,-wrap,_free_r -Wl,-wrap,zalloc -Wl,-wrap,calloc -Wl,-wrap,realloc  -Wl,-wrap,_realloc_r
LFLAGS += -Wl,-wrap,printf -Wl,-wrap,vsnprintf -Wl,-wrap,snprintf -Wl,-wrap,sprintf -Wl,-wrap,puts
#LFLAGS += -g -Wl,--gc-sections -mthumb -mcpu=arm968e-s -mthumb-interwork -nostdlib

# For WPA3
ifeq ($(CFG_WPA3),1)
WOLFSSL_CFLAGS += -DWOLFSSL_BEKEN
CFLAGS += $(WOLFSSL_CFLAGS)
endif

RWNX_LIB = ./beken378/lib/librwnx.a
WPA_LIB  = ./beken378/lib/libwpa.a
USB_LIB  = ./beken378/lib/libusb.a
SENSOR_LIB  = ./beken378/lib/libsensor.a
BLE_LIB  = ./beken378/lib/libble.a
CAL_LIB  = ./beken378/lib/libcal.a
SUPPLICANT_LIB  = ./beken378/lib/libsupplicant.a
UART_DEBUG_LIB  = ./beken378/lib/libuart_debug.a
RF_TEST_LIB  = ./beken378/lib/librf_test.a
RF_USE_LIB  = ./beken378/lib/librf_use.a

LIBFLAGS =
LIBFLAGS += -L./beken378/lib -lrwnx -lwpa
LIBFLAGS += -L./beken378/func/airkiss -lairkiss
LIBFLAGS += -L./beken378/lib -lusb
LIBFLAGS += -L./beken378/lib -lsensor
LIBFLAGS += -L./beken378/lib -lble
LIBFLAGS += -L./beken378/lib -lcal
LIBFLAGS += -L./beken378/lib -lsupplicant
LIBFLAGS += -L./beken378/lib -luart_debug
LIBFLAGS += -L./beken378/lib -lrf_test
LIBFLAGS += -L./beken378/lib -lrf_use

CUR_PATH = $(shell pwd)
.PHONY: application
application: $(OBJ_LIST) $(OBJ_S_LIST) $(OBJ_OS_LIST) $(WPA_LIB) $(RWNX_LIB) $(USB_LIB) $(SENSOR_LIB)  $(BLE_LIB) $(CAL_LIB) $(SUPPLICANT_LIB) $(UART_DEBUG_LIB) $(RF_TEST_LIB) $(RF_USE_LIB)

	@$(ECHO) "  $(GREEN)LD   $(BIN_DIR)/$(SOC_NAME_ELF)$(NC)"
	$(Q)$(LD) $(LFLAGS) -o $(BIN_DIR)/$(SOC_NAME_ELF) $(OBJ_LIST) $(OBJ_S_LIST) $(OBJ_OS_LIST) $(LIBFLAGS) -T./build/$(SOC_NAME_LDS) -Xlinker -Map=$(BIN_DIR)/$(SOC_NAME_MAP)
	$(Q)$(OBJCOPY) -O binary $(BIN_DIR)/$(SOC_NAME_ELF) $(BIN_DIR)/$(SOC_NAME_BIN)
#	$(OBJDUMP) -d $(BIN_DIR)/$(SOC_NAME_ELF) >> $(BIN_DIR)/beken7231.asm
#	@$(ECHO) "                                                        "
	@$(ECHO) "  $(GREEN)CRC  $(BIN_DIR)/$(SOC_NAME_BIN)$(NC)"
	$(Q)$(ENCRYPT) $(BIN_DIR)/$(SOC_NAME_BIN) 0 $(ENCRYPT_ARGS) > /dev/null
	$(Q)$(LD) $(LFLAGS) -o $(BIN_DIR)/$(SOC_NAME_BSP_ELF) $(OBJ_LIST) $(OBJ_S_LIST) $(OBJ_OS_LIST) $(LIBFLAGS) -T./build/$(SOC_NAME_BSP_LDS) -Xlinker -Map=$(BIN_DIR)/$(SOC_NAME_BSP_MAP)
	$(Q)$(OBJCOPY) -O binary $(BIN_DIR)/$(SOC_NAME_BSP_ELF) $(BIN_DIR)/$(SOC_NAME_BSP_BIN)
	$(Q)(cd ./tools/beken_packager; ./beken_packager_wrapper -i $(CFG_SOC_NAME))

	
# Generate build info
# -------------------------------------------------------------------	
ble: $(BLE_LIB)

$(BLE_LIB): $(OBJ_BLE_LIST)
	$(Q)$(ECHO) "  $(GREEN)AR   $@$(NC)"
	$(Q)$(AR) -rcs $@ $^

ip: $(RWNX_LIB)

$(RWNX_LIB): $(OBJ_RWNX_LIST)
	$(Q)$(ECHO) "  $(GREEN)AR   $@$(NC)"
	$(Q)$(AR) -rcs $@ $^

$(WPA_LIB): $(OBJ_WPA_LIST)
	$(Q)$(ECHO) "  $(GREEN)AR   $@$(NC)"
	$(Q)$(AR) -rcs $@ $^

usb: $(USB_LIB)

$(USB_LIB): $(OBJ_USB_LIST)
	$(Q)$(ECHO) "  $(GREEN)AR   $@$(NC)"
	$(Q)$(AR) -rcs $@ $^	

sensor: $(SENSOR_LIB)

$(SENSOR_LIB): $(OBJ_SENSOR_LIST)
	$(Q)$(ECHO) "  $(GREEN)AR   $@$(NC)"
	$(Q)$(AR) -rcs $@ $^

cal: $(CAL_LIB)

$(CAL_LIB): $(OBJ_CAL_LIST)
	$(Q)$(ECHO) "  $(GREEN)AR   $@$(NC)"
	$(Q)$(AR) -rcs $@ $^	

supplicant: $(SUPPLICANT_LIB)

$(SUPPLICANT_LIB): $(OBJ_SUPPLICANT_LIST)
	$(Q)$(ECHO) "  $(GREEN)AR   $@$(NC)"
	$(Q)$(AR) -rcs $@ $^	

uart_debug: $(UART_DEBUG_LIB)

$(UART_DEBUG_LIB): $(OBJ_UART_DEBUG_LIST)
	$(Q)$(ECHO) "  $(GREEN)AR   $@$(NC)"
	$(Q)$(AR) -rcs $@ $^	

rf_test: $(RF_TEST_LIB)

$(RF_TEST_LIB): $(OBJ_RF_TEST_LIST)
	$(Q)$(ECHO) "  $(GREEN)AR   $@$(NC)"
	$(Q)$(AR) -rcs $@ $^	

rf_use: $(RF_USE_LIB)

$(RF_USE_LIB): $(OBJ_RF_USE_LIST)
	$(Q)$(ECHO) "  $(GREEN)AR   $@$(NC)"
	$(Q)$(AR) -rcs $@ $^	

$(OBJ_DIR)/%.o: %.c
	$(Q)if [ ! -d $(dir $@) ]; then mkdir -p $(dir $@); fi
	$(Q)$(ECHO) "  $(GREEN)CC   $<$(NC)"
	$(Q)$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@
	$(Q)$(CC) $(CFLAGS) $(INCLUDES) -c $< -MM -MT $@ -MF $(patsubst %.o,%.d,$@)

$(OBJ_DIR)/%.O: %.S
	$(Q)if [ ! -d $(dir $@) ]; then mkdir -p $(dir $@); fi
	$(Q)$(ECHO) "  $(GREEN)AS   $<$(NC)"
	$(Q)$(CC) $(ASMFLAGS) $(INCLUDES) -c $< -o $@
	$(Q)$(CC) $(ASMFLAGS) $(INCLUDES) -c $< -MM -MT $@ -MF $(patsubst %.O,%.d,$@)

$(OBJ_DIR)/%.marm.o: %.c
	$(Q)if [ ! -d $(dir $@) ]; then mkdir -p $(dir $@); fi
	$(Q)$(ECHO) "  $(GREEN)CC   $<$(NC)"
	$(Q)$(CC) $(OSFLAGS) $(INCLUDES) -c $< -o $@
	$(Q)$(CC) $(OSFLAGS) $(INCLUDES) -c $< -MM -MT $@ -MF $(patsubst %.marm.o,%.d,$@)

-include $(DEPENDENCY_LIST)
-include $(DEPENDENCY_S_LIST)
-include $(DEPENDENCY_OS_LIST)

.PHONY: clean
clean:
	$(Q)-rm -rf $(TARGET)
	$(Q)-rm -f .config
	@$(ECHO) "$(GREEN)Done$(NC)"

.PHONY: cleanlib
cleanlib:
	$(Q)-rm -rf $(RWNX_LIB) $(WPA_LIB) $(USB_LIB) $(BLE_LIB) $(SENSOR_LIB) $(CAL_LIB) $(SUPPLICANT_LIB) $(UART_DEBUG_LIB) $(RF_TEST_LIB) $(RF_USE_LIB)
	@$(ECHO) "$(GREEN)Done$(NC)"
