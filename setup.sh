#!/bin/bash

# SETUP

# Phase 1 create all directorys
mkdir ./Achriv
mkdir ./Devices
mkdir ./Modules
mkdir ./SSH-Keys
echo "Directories where created"

# Phase 2 create all device list's
echo '# ______ ____  _____ _______ _____ _   _ ______ _______    _____             _' >> ./Devices/Fortinet-Devices.txt
echo '#|  ____/ __ \|  __ \__   __|_   _| \ | |  ____|__   __|  |  __ \           (_)' >> ./Devices/Fortinet-Devices.txt
echo '#| |__ | |  | | |__) | | |    | | |  \| | |__     | |     | |  | | _____   ___  ___ ___  ___' >> ./Devices/Fortinet-Devices.txt
echo '#|  __|| |  | |  _  /  | |    | | | . ` |  __|    | |     | |  | |/ _ \ \ / / |/ __/ _ \/ __|' >> ./Devices/Fortinet-Devices.txt
echo '#| |   | |__| | | \ \  | |   _| |_| |\  | |____   | |     | |__| |  __/\ V /| | (_|  __/\__ \' >> ./Devices/Fortinet-Devices.txt
echo '#|_|    \____/|_|  \_\ |_|  |_____|_| \_|______|  |_|     |_____/ \___| \_/ |_|\___\___||___/' >> ./Devices/Fortinet-Devices.txt
echo '# IP' >> ./Devices/Fortinet-Devices.txt
echo '# _    _ _____     _____             _' >> ./Devices/HP-Devices.txt
echo '#| |  | |  __ \   |  __ \           (_)' >> ./Devices/HP-Devices.txt
echo '#| |__| | |__) |  | |  | | _____   ___  ___ ___  ___' >> ./Devices/HP-Devices.txt
echo '#|  __  |  ___/   | |  | |/ _ \ \ / / |/ __/ _ \/ __|' >> ./Devices/HP-Devices.txt
echo '#| |  | | |       | |__| |  __/\ V /| | (_|  __/\__ \' >> ./Devices/HP-Devices.txt
echo '#|_|  |_|_|       |_____/ \___| \_/ |_|\___\___||___/' >> ./Devices/HP-Devices.txt
echo '# IP' >> ./Devices/HP-Devices.txt
echo '#   _____ _____  _____  _____ ____     _____             _ ' >> ./Devices/Cisco-Devices.txt
echo '#  / ____|_   _|/ ____|/ ____/ __ \   |  __ \           (_)' >> ./Devices/Cisco-Devices.txt
echo '# | |      | | | (___ | |   | |  | |  | |  | | _____   ___  ___ ___  ___ ' >> ./Devices/Cisco-Devices.txt
echo '# | |      | |  \___ \| |   | |  | |  | |  | |/ _ \ \ / / |/ __/ _ \/ __|' >> ./Devices/Cisco-Devices.txt
echo '# | |____ _| |_ ____) | |___| |__| |  | |__| |  __/\ V /| | (_|  __/\__ \' >> ./Devices/Cisco-Devices.txt
echo '#  \_____|_____|_____/ \_____\____/   |_____/ \___| \_/ |_|\___\___||___/' >> ./Devices/Cisco-Devices.txt
echo '# IP' >> ./Devices/Cisco-Devices.txt
echo '#  _____  ______ _      _         _____             _' >> ./Devices/DELL-Devices.txt
echo '# |  __ \|  ____| |    | |       |  __ \           (_)' >> ./Devices/DELL-Devices.txt
echo '# | |  | | |__  | |    | |       | |  | | _____   ___  ___ ___  ___ ' >> ./Devices/DELL-Devices.txt
echo '# | |  | |  __| | |    | |       | |  | |/ _ \ \ / / |/ __/ _ \/ __|' >> ./Devices/DELL-Devices.txt
echo '# | |__| | |____| |____| |____   | |__| |  __/\ V /| | (_|  __/\__ \' >> ./Devices/DELL-Devices.txt
echo '# |_____/|______|______|______|  |_____/ \___| \_/ |_|\___\___||___/' >> ./Devices/DELL-Devices.txt
echo '# IP' >> ./Devices/DELL-Devices.txt
echo "Devices List's where created"

# Phase 3 move all modules to ./Modules directory
mv Backup-Script-Fortinet.sh ./Modules/Backup-Script-Fortinet.sh
mv Backup-Script-Dell.sh ./Modules/Backup-Script-Dell.sh 
mv Backup-Script-Hp.sh ./Modules/Backup-Script-Hp.sh
mv Backup-Script-Cisco.sh ./Modules/Backup-Script-Cisco.sh
echo "Modules where moved"

# Phase 4 create the main lanucher for all modules
echo './Modules/Backup-Script-Fortinet.sh' >> ./Backup-Script-Module-Launcher.sh 
echo './Modules/Backup-Script-Dell.sh' >> ./Backup-Script-Module-Launcher.sh 
echo './Modules/Backup-Script-Hp.sh' >> ./Backup-Script-Module-Launcher.sh 
echo './Modules/Backup-Script-Cisco.sh' >> ./Backup-Script-Module-Launcher.sh 
echo "Main Launcher where created"

# Phase 5 make the files executable
chmod 700 ./Backup-Script-Module-Launcher.sh
chmod 700 ./Modules/Backup-Script-Fortinet.sh
chmod 700 ./Modules/Backup-Script-Dell.sh
chmod 700 ./Modules/Backup-Script-Hp.sh
chmod 700 ./Modules/Backup-Script-Cisco.sh
echo "Modules & Lanucher where modified"

# Phase 6 create SSH Key
ssh-keygen -t rsa -b 4096 -f ./SSH-Keys/Backup-SSH-Key

# Phase 7 show the new created Public SSH-Key
clear
echo "-----BEGIN PUBLIC KEY-----"
echo "$(cat ./SSH-Keys/Backup-SSH-Key.pub)" | awk '{print $2}' | sed 's/\=//g'
echo "-----END PUBLIC KEY-----"
echo " "
echo "IT'S DONE !"
