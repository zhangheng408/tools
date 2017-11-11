#!/bin/bash

echo "clean up old downloads"
rm -rf li* boot
umount 1 2 3 2>/dev/null
umount /dev/sdc* 2>/dev/null
echo "download new kernel"
scp zhangheng@192.168.200.31:P86/working/linux-tarball-310/*.tar.gz .
echo "tar kernel"
tar xmzf *.tar.gz
sync
echo "mount dev"
mount /dev/sdc1 1
mount /dev/sdc2 2
mount /dev/sdc3 3
echo "remove old kernel"
rm 2/b
rm 3/boot/bzImageZ
rm -rf 3/lib/modules/3.10*
sync
echo "copy kernel"
cp boot/vmlinuz* 2/b
cp boot/vmlinuz* 3/boot/bzImageZ
cp -a lib/modules/3.10* 3/lib/modules/
sync
echo "depmod"
chroot 3 <<EOF
cd lib/modules
depmod -a 3.10*
exit
EOF
sync
echo "umount"
umount /dev/sdc*
umount /dev/sdc*
