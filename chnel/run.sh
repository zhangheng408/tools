#!/bin/bash

echo "clean up old downloads"
rm -rf bzImage
umount 3 2>/dev/null
umount /dev/sdc3 2>/dev/null
echo "download new bzImage"
scp ZhangHeng@192.168.20.27:~/P86/working/linux-3.10/arch/x86/boot/bzImage .
sync
echo "mount dev"
mount /dev/sdc3 3
echo "remove old kernel"
cd 3/boot
rm bzImageZ
cd -
sync
echo "copy bzImage"
cp bzImage 3/boot/bzImageZ
ls -l 3/boot/bzImageZ
date
sync
echo "umount"
umount 3 2>/dev/null
