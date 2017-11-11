#!/bin/sh
# The script for updating U-boot
echo "usage: ./update_uboot.sh uboot_file_name"
if [ $# -ne 1 ]
then
	echo "please check the parameter"
	exit
fi
MTD_DEBUG=./mtd_debug
UBOOT_FILE="$1"
PROC_FILE="/proc/mtd"
START=0xC0000
FILE_LEN=`du -b $UBOOT_FILE | awk '{print $1}'`
SPI_DEVICE="spi0.0"
MTD_DEVICE=`grep "$SPI_DEVICE" $PROC_FILE | awk -F[:\s] '{print $1}'`
DEV_MTD_SPI=`echo "/dev/"$MTD_DEVICE`
echo "$1:$FILE_LEN"
echo $DEV_MTD_SPI
$MTD_DEBUG info $DEV_MTD_SPI
$MTD_DEBUG erase $DEV_MTD_SPI $START $FILE_LEN
$MTD_DEBUG write $DEV_MTD_SPI $START $FILE_LEN $UBOOT_FILE
$MTD_DEBUG read $DEV_MTD_SPI $START $FILE_LEN file_read
diff file_read $UBOOT_FILE > differ.log
if [ $? -eq 0 ]
then
	echo "update successful"
	rm file_read  differ.log
else
	echo "update failed, please try again"
fi
