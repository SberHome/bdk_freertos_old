***********
Overview
***********

SDK overview
---------------

SDK with FreeRTOS
*******************

The BDK FreeRTOS contains the following directories::

    |- beken378               # Beken SDK directory
    |  |- alios               # AliOS adapter layer
    |  |- APP                 # applications
    |  |- common              # common C header files
    |  |- demo                # ieee80211 demo
    |  |- driver              # drivers, audio, ble, i2c, i2s, etc.
    |  |- func                # functions: airkiss, calibration, wpa, cli, etc
    |  |- ip                  # wifi ip C header files
    |  |- lib                 # libraries
    |  |- release             # the release related info such as SDK revision
    |  |- rttos               # RT-Thread adapter layer
    |- build                  # build link scripts
    |- demos                  # demos
    |- FreeRTOSv9.0.0         # FreeRTOS source
    |- release                # the release related info such as the OSK revision and documents
    |- tools                  # tools to manipulate firmware

SDK with RT-Thread
********************

The BDK RTT contains the following directories.::

    |- applications                    # upper layer application code
    |- beken378                        # Beken SDK directory
    |  |- app                          # applications
    |  |- common                       # common C header files
    |  |- demo                         # ieee80211 demo
    |  |- driver                       # drivers, audio, ble, i2c, i2s, etc.
    |  |- func                         # functions: airkiss, calibration, wpa, cli, etc
    |  |- ip                           # wifi ip C header files
    |  |- ip_ax                        # wifi6 ip C header files
    |  |- lib                          # libraries
    |  |- release                      # the release related info such as SDK revision
    |  |- rttos                        # RT-Thread adapter layer
    |- components                      # components: player, codec, etc.
    |- config                          # link script and config files
    |- docs                            # document files for beken chipwith RT-Thread
    |- drivers                         # driver layer of RT-Thread
    |- function                        # function code like mixer, VBAT detector
    |- libcpu                          # bootstrap code of beken chip on RT-Thread
    |- packages                        # configurable third-party packages
    |- release                         # the release related info such as OSK revision and documents
    |- rt-thread
    |  |- components                   # necessary components: dfs, finsh, libc, net, etc.
    |  |- examples                     # examples of RT-Thread
    |  |- include                      # major header files of RT-Thread
    |  |- src                          # major source files of RT-Thread
    |  |- tools                        # build scripts with SCons of RT-Thread
    |- samples                         # example code
    |- test                            # test code
    |- tools                           # tools to manipulate firmware

SDK with AliOS
*******************

The following directories in AliOS related with beken::

    |- Living_SDK                # Smartliving SDK directory
    |  |- board                  # beken platform, such as bk7231u, bk7231n and so on
    |  |- bk7231udevkitc         # bk7231u enter interface
    |  |- bk7231ndevkitc         # bk7231n enter interface
    |  |- platform/mcu           # beken bsp driver
    |  |- bk7231u                # bk7231u bsp
    |  |- bk7231n bsp
    |- Products/example          # demo apps and user can add new app here
    |- release                   # the release related info such as OSK revision and documents
    |- tools                     # tools to manipulate firmware
    |- bk7231udevkitc.sh         # config bk7231u
    |- bk7231ndevkitc.sh         # config bk7231n

Configuration
-----------------

There are several default configurations under BDK/beken378/app/config with sys_config_xxx prefix.

+---------------------------+-----------------------------------+
| Configuration             | Description                       |
+===========================+===================================+
| sys_config_bk7231n.h      | Configuration for BK7231n         |
+---------------------------+-----------------------------------+
| sys_config_bk7231u.h      | Configuration for BK7231u         |
+---------------------------+-----------------------------------+
| sys_config_bk7251.h       | Configuration for BK7251          |
+---------------------------+-----------------------------------+

Build system will automatically choose these configurations, for example, make bk7231n will automatically uses sys_config_bk7231n.h.

Libraries
----------------

+---------------------------+------------------------------------------------------------------------------+
| Libraries                 | Description                                                                  |
+===========================+==============================================================================+
| librwnx.a                 | Wifi lib, the lib name could be librwnx_bkxxxx.a which depend on HW platform |
+---------------------------+------------------------------------------------------------------------------+
| libsupplicant.a           | Wifi lib, the lib name could be librwnx_bkxxxx.a which depend on HW platform |
+---------------------------+------------------------------------------------------------------------------+
| libcal.a                  | Wifi lib, the lib name could be librwnx_bkxxxx.a which depend on HW platform |
+---------------------------+------------------------------------------------------------------------------+
| librf_test.a              | Wifi lib, the lib name could be librwnx_bkxxxx.a which depend on HW platform |
+---------------------------+------------------------------------------------------------------------------+
| librf_use.a               | Wifi lib, the lib name could be librwnx_bkxxxx.a which depend on HW platform |
+---------------------------+------------------------------------------------------------------------------+
| libuart_debug.a           | Wifi lib, the lib name could be librwnx_bkxxxx.a which depend on HW platform |
+---------------------------+------------------------------------------------------------------------------+
| libble.a                  | BLE lib, the lib name could be libble_bkxxxx.a which depend on HW platform   |
+---------------------------+------------------------------------------------------------------------------+
| libbt.a                   | BT lib, the lib name could be libbt_bkxxxx.a which depend on HW platform     |
+---------------------------+------------------------------------------------------------------------------+
| libble_mesh.a             | BLE mesh lib, the lib name could be libble_mesh_bkxxxx.a                     |
|                           | which depend on HW platform                                                  |
+---------------------------+------------------------------------------------------------------------------+
| libairkiss.a              | Airkiss lib                                                                  |
+---------------------------+------------------------------------------------------------------------------+
| libusb.a                  | USB lib, the lib name could be libusb_bkxxxx.a which depend on HW platform   |
+---------------------------+------------------------------------------------------------------------------+
| libsensor.a               | WiFi Sensor lib                                                              |
+---------------------------+------------------------------------------------------------------------------+

Build system will automatically choose these libraries, for example, make bk7231n will automatically uselibrwnx_bk7231n.a and libble_bk7231n.a.
