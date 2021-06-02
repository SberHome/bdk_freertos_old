@echo off
@REM pick the libs according to the platform params
@REM example:
@REM pick_beken_libs.bat bk7231u

set lib_ip_src=beken378\lib\librwnx_%1.a
set lib_ble_src=beken378\lib\libble_%1.a
set lib_usb_src=beken378\lib\libusb_%1.a

set lib_ip_dst=beken378\lib\librwnx.a
set lib_ble_dst=beken378\lib\libble.a
set lib_usb_dst=beken378\lib\libusb.a

setlocal enabledelayedexpansion

echo "Copying %lib_ip_src% to %lib_ip_dst%"
copy %lib_ip_src% %lib_ip_dst%

echo "Copying %lib_ble_src% to %lib_ble_dst%"
copy %lib_ble_src% %lib_ble_dst%

echo "Copying %lib_usb_src% to %lib_usb_dst%"
copy %lib_usb_src% %lib_usb_dst%

endlocal
