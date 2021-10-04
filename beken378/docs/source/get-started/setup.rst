*****************
Environment Setup
*****************

Install Toolchain
-------------------

.. note::

   If the BDK you download doesn't contain the toolchain, please goto http://bbs.bekencorp.com:8191/forum.php?mod=forumdisplay&fid=57 to download the toolchain.

Cross-compiler is in the toolchain directory, it is used to build the libraries, to use the existed libraries, please use
the same toolchain for your build. Here is an example of how to setup the compiling environment for FreeRTOS
and RT-Thread based SDK::

     $ sudo mkdir -p /usr/local/share/toolchain/
     $ tar xf gcc-arm-none-eabi-5_4-2016q3-20160926-linux.tar.bz2 -C /usr/local/share/toolchain/

Add the following environment to ~/.bashrc if you are using bash or ~/.zshrc if you are using zsh::

     export RTT_EXEC_PATH=/usr/local/share/toolchain/gcc-arm-none-eabi-5_4-2016q3/bin
     export FREERTOS_EXEC_PATH=/usr/local/share/toolchain/gcc-arm-none-eabi-5_4-2016q3/bin/

For AliOS based SDK, here is the example::

     $ tar xf smartliving-1.6.0-compiler-linux.tar.bz2 -C /usr/local/share/toolchain/

Add the following environment to ~/.bashrc if you are using bash or ~/.zshrc if you are using zsh::

     export ALIOS_COMPILER_PATH=/usr/local/share/toolchain/smartliving-1.6.0-compiler

You may install the toolchain to directory you want, the environment RTT_EXEC_PATH, FREERTOS_EXEC_PATH and ALIOS_COMPILER_PATH must be changed accordingly.

RT-thread environment setup
----------------------------

 - Install python 2.x, python 3 is not supported now.
 - Install scons. In Debian/Ubuntu/LinuxMint, you can install scons with::

     $ sudo apt-get install scons

Also you can manually install from source code.

AliOS environment setup
------------------------

 - Install python 2.x and aos-cube, you can use the following commands to install python 2.x under Debian/Ubuntu/LinuxMint::

     $ sudo apt-get install python python-pip
     $ pip install setuptools wheel aos-cube

 - If you cannot install python2 with these commands, you must manually install python2 from source code. You can use change the pip mirrors to speed up install progress::

     $ pip install setuptools wheel aos-cube --trusted-host=mirrors.aliyun.com -i https://mirrors.aliyun.com/pypi/simple/

 - Or you can change the global pip mirrors by modify ~/.pip/pip.conf::

    [global]
    index-url = https://mirrors.ustc.edu.cn/pypi/web/simple
    format = columns
