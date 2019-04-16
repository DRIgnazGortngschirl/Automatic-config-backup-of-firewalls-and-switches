#!/bin/bash

# INSTALLATION

# 1. Create a user "backup" on the network device
# 2. Add SSH Key for Authentification for the user

echo "Started Backup of Config's"

user=backup
date=`date +%d%m%y`

for device in `cat ./Devices/Fortinet-Devices.txt | egrep -v "^\s*(#|$)"` # Will have a look in the file "Fortinet-Devices.txt" for all fortinet devices
do
    echo -e "Host found in hostfile \e[35m$device\e[39m" &>> Log/Fortinet/log$date.txt
    scp -i ./SSH-Keys/Backup-SSH-Key $device:sys_config ./BackupConfigFortinet &>> Log/Fortinet/log$date.txt # Will copy to all devices in "Fortinet-Devices.txt" and copy it secure localy
    name=`grep -m1 'set hostname' BackupConfigFortinet | sed 's|["?]||g' | sed 's/\<set hostname\>//g' | sed 's/ //g' | tr -dc '[:print:]'`
    mkdir Archiv/$name 2>/dev/null
    mv BackupConfigFortinet ./Archiv/$name/$name-$(date +"%H_%M-%d_%m_%Y").conf
done
