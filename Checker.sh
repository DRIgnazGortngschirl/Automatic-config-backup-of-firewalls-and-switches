#!/bin/bash
date=`date +%d%m%y`
fortinethostfilecount=`egrep -v "^\s*(#|$)" ./Devices/Fortinet-Devices.txt | grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" | wc -l`
hphostfilecount=`egrep -v "^\s*(#|$)" ./Devices/HP-Devices.txt | grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" | wc -l`
ciscohostfilecount=`egrep -v "^\s*(#|$)" ./Devices/Cisco-Devices.txt | grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" | wc -l`
dellhostfilecount=`egrep -v "^\s*(#|$)" ./Devices/DELL-Devices.txt | grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" | wc -l`
dirsinachriv=`find ./Archiv -maxdepth 1 -type d | wc -l`

total=`expr $fortinethostfilecount + $hphostfilecount + $ciscohostfilecount + $dellhostfilecount`

echo "Fortinet : $fortinethostfilecount Hosts in Host File" &>> Log/log$date.txt
echo "HP : $hphostfilecount Hosts in Host File" &>> Log/log$date.txt
echo "Cisco $ciscohostfilecount Hosts in Host File" &>> Log/log$date.txt
echo "DELL : $dellhostfilecount Hosts in Host File" &>> Log/log$date.txt
echo "------------------------------------------------" &>> Log/log$date.txt
echo "Lines in Host file $total/$dirsinachriv Directorys in Archiv" &>> Log/log$date.txt
echo "These numbers should match!!!" &>> Log/log$date.txt
echo "Otherwise you did not got all configs listed in the host files" &>> Log/log$date.txt
echo "Start Fastdebug.sh to see more infos where those errors are" &>> Log/log$date.txt
