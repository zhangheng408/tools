#!/bin/bash
while [ '' == '' ]
do
    ssh_d_process_num=`ps aux|grep -E 'ssh \-fCNR 112.74.61.203:4823' |grep -v grep |wc -l`
    #echo $ssh_d_process_num
    if [ "$ssh_d_process_num" == "0" ]
    then
        ssh -fCNR 112.74.61.203:4823:localhost:22 root@112.74.61.203 -o "ConnectTimeout 5" -o "ServerAliveInterval 5"
    fi
    sleep 120
done
