#!/usr/bin/env python3

import os
import sys
import json
import argparse

out_json = {
    "magic": "RT-Thread",
    "version": "0.1",
    "count": 2,
    "section": [
        {
            "firmware": "bootloader_bk7231n_uart2_v1.0.8.bin",
            "version": "2M.1220",
            "partition": "bootloader",
            "start_addr": "0x00000000",
            "size": "65280"
        },
        {
            "firmware": "../../out/beken7231_bsp.bin",
            "version": "2M.1220",
            "partition": "app",
            "start_addr": "0x00011000",
            "size": "1156K"
        }
    ]
}

chip_index = {
    1: 'bk7231',
    2: 'bk7231u',
    3: 'bk7251',
    4: 'bk7271',
    5: 'bl2028n'
}

default_info = {
    'bl2028n': {'boot': 'bootloader_bl2028n_uart2_v1.0.8.bin', 'firmware': '../../out/beken2028n_bsp.bin'},
    'bk7231u': {'boot': 'bootloader_bk7231u_uart2_v1.0.8.bin', 'firmware': '../../out/beken7231_bsp.bin'},
    'bk7231':  {'boot': 'bootloader_bk7231_uart2_v1.0.8.bin', 'firmware': '../../out/beken7231_bsp.bin'},
    'bk7251':  {'boot': 'bootloader_bk7251_uart2_v1.0.8.bin', 'firmware': '../../out/beken7231_bsp.bin'},
    'bk7271':  {'boot': 'bootloader_bk7271_uart2_v1.0.8.bin', 'firmware': '../../out/beken7231_bsp.bin'},
    'bk7236':  {'boot': 'bootloader_bk7236_uart2_v1.0.8.bin', 'firmware': '../../out/beken7231_bsp.bin'},
}

# parse commandline arguments
def parse_args():
    description = '''Beken HID Downloader.'''
    parser = argparse.ArgumentParser(description=description)
    parser.add_argument('-c', '--chip',
                        default='bk7231u',
                        choices=default_info.keys(),
                        help="chip type, defaults to bk7231u")
    parser.add_argument('-i', '--index', type=int,
                        default=-1,
                        choices=chip_index.keys(),
                        help="chip index: 1: bk7231, 2: bk7231u, 3: bk7251, 4: bk7271, 5: bk7231n 6:bk7236")
    parser.add_argument('-b', '--boot',
                        help='specify boot file')
    parser.add_argument('-f', '--firmware',
                        help='specify firmware file')
    parser.add_argument('-o', '--out_dir', help='output dir')
    args = parser.parse_args()

    return args

args = parse_args()
chip = chip_index[args.index] if args.index>=0 else args.chip
bootloader_str = args.boot if args.boot else default_info[chip]['boot']
firmware_str = args.firmware if args.firmware else default_info[chip]['firmware']
out_dir = args.out_dir if args.out_dir else '.'

out_path = "tmp.json"

out_json["section"][0]["firmware"] = bootloader_str
out_json["section"][1]["firmware"] = firmware_str
out_json = json.dumps(out_json, sort_keys=True, indent=4)

#print(out_json)

with open(str(out_path), "w") as f:
    f.write(out_json)

os.system("beken_packager.exe {}".format(out_path))
#os.system("move all_2M.1220.bin {}".format(out_dir))
#os.system("move beken7231_bsp_uart_2M.1220.bin {}".format(out_dir))
#print ("cp " + bootloader_str + " {}/".format(out_dir))
#os.system("cp " + bootloader_str +" {}/".format(out_dir))
os.remove(out_path)
