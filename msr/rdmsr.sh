#!/bin/bash

if [ -e msr_addr ];then
    while read line
    do
	echo -n "$line 0x"
        rdmsr $line
    done < msr_addr
else
    echo "no msr_addr"
fi
