#!/bin/bash
for host in `cat hosts.txt`
do
   HOSTNAME=`ssh ibmadmin@$host "sudo hostname"`
   DISKS=`ssh ibmadmin@$host "sudo ls /sys/block/ | egrep -i ^sd"`
	
   echo "========================================"
   echo "---------- Host : $HOSTNAME------------"

	for i in `echo $DISKS`
	do
	Q=`ssh ibmadmin@$host "cat /sys/block/$i/device/queue_depth"`
	echo"			"
	echo "Phisical disk /dev/$i has a queue depth of: $Q"
	echo "			"
	echo "			"
	done
	echo "========================================"
	echo "========================================"
done

