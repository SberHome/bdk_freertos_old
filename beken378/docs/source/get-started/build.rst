***********
Build
***********

FreeRTOS Building
-------------------

Building commands
*******************

+----------------+-----------------------------------+
| command        | Description                       |
+================+===================================+
| make clean     | cleanup                           |
+----------------+-----------------------------------+
| make bk7231u   | build firmware for bk7231u        |
+----------------+-----------------------------------+
| make bk7231n   | build firmware for bk7231n        |
+----------------+-----------------------------------+
| make bk7251    | build firmware for bk7251         |
+----------------+-----------------------------------+

After building, firmware will be generated in out directory.

+----------------+-----------------------------------+
| platform       | bin name                          |
+================+===================================+
| bk7231u        | bk7231u_crc.bin                   |
+----------------+-----------------------------------+
| bk7231n        | bk7231n_crc.bin                   |
+----------------+-----------------------------------+
| bk7251         | bk7251_crc.bin                    |
+----------------+-----------------------------------+

Also, there will be firmware all_2M.1220.bin in out directory which include both the bootloader and app firmwares.

RT-thread Building
--------------------

Building commands
********************

+---------------------------+-----------------------------------+
| command                   | Description                       |
+===========================+===================================+
| scons -c                  | cleanup                           |
+---------------------------+-----------------------------------+
| scons --beken=bk7251 -j4  | build bk7251 with 4 CPU core      |
+---------------------------+-----------------------------------+
| scons --beken=bk7231u     | build bk7231u                     |
+---------------------------+-----------------------------------+
| scons --beken=bk7231n     | build bk7231n                     |
+---------------------------+-----------------------------------+

If you encounter compile errors about python, you may replace scons with python2 `which scons`, for example::

  $ python2 `which scons` -c # cleanup
  $ python2 `which scons` -j4 # build with 4 CPU core

After building, firmware all_2M.1220.bin will be generated under out directory.

AliOS Building
----------------

Build Commands
***************

+---------------------------+-----------------------------------+
| command                   | Description                       |
+===========================+===================================+
| ./build.sh clean          | cleanup                           |
+---------------------------+-----------------------------------+
| ./build.sh                | build                             |
+---------------------------+-----------------------------------+

Build example::

  ./build.sh example [APP] [BOARD] [ENV] ONLINE 0
  ./build.sh example smart_outlet bk7231udevkitc MAINLAND ONLINE 0

Or modify build.sh manually and run build.sh

Generated Images
******************

+---------------------------+------------------------------------------------------------------------------+
| bin                       | Description                                                                  |
+===========================+==============================================================================+
| Boot image                | out/<app>@<board>/ bootloader_*.bin\r\n                                      |
|                           |                                                                              |
|                           | eg. out/smart_outlet@bk7231udevkitc/smart_outlet@bk7231udevkitc_crc.bin      |
+---------------------------+------------------------------------------------------------------------------+
| Burn in image without boot| out/<app>@<board>/<app>@<board>_crc.bin                                      |
|                           | eg. out/smart_outlet@bk7231udevkitc/smart_outlet@bk7231udevkitc_crc.bin      |
+---------------------------+------------------------------------------------------------------------------+
| OTA image                 | out/<app>@<board>/<app>@<board>_ota.bin                                      |
|                           | eg. out/smart_outlet@bk7231udevkitc/smart_outlet@bk7231udevkitc_ota.bin      |
+---------------------------+------------------------------------------------------------------------------+

General building scripts
-------------------------

Except the dedicated build commands for Freertos/RTT/Alios, there are general build commands ®make_build.sh and clean_build.sh in directory tools/scripts, you can use these general build commands in OSK root directory instead if you use Linux build ENV.


