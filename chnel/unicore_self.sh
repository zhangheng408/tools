#!/bin/bash

ifconfig eth0 192.168.20.55 up
echo "clean up old downloads"
rm -rf li* boot/ uImage
umount /dev/mmcblk0p2 2>/dev/null
echo "download new kernel packet"
scp ZhangHeng@192.168.20.27:~/linux-2.6.32-uc32/linux*.tar.gz .
scp ZhangHeng@192.168.20.27:~/linux-2.6.32-uc32/arch/unicore/boot/uImage .
echo "decompress the kernal packet"
tar xmzf linux*.tar.gz
echo "mount dev"
mount /dev/mmcblk0p2 /boot
echo "remove old kernel"
cd /boot
rm -f uImage
cd -
cd /lib/modules/
rm -rf 2.*
cd -
sync
echo "copy uImage"
cp uImage /boot/
echo "copy modules"
cp -a lib/modules/2.* /lib/modules
sync
echo "depmod"
cd /lib/modules/
depmod -a 2.*
sync
echo "done!"
