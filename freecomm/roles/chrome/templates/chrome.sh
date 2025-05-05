#!/usr/bin/sh
##### Adding by SPC v{{ version_spc }}
##### secured-pc ##### auteur: Laurent Delatte, 2024

categ=chrome
# execute un pod dedie chrome
#
# SELinux:
#
#
xhost + LOCAL: >/dev/null
#
# Cree un socket audio dedie Firefox:
main_ip=`ip route | awk '/default / { print $9; exit }'`
pactl load-module module-native-protocol-tcp  port=33500 auth-ip-acl=$main_ip 1>/tmp/chrome.log 2>&1 	# / socket audio
# autorise la camera:
sudo chown {{ ch_ct_user }} /dev/video0
#
# Execute le pod concerne
#
nohup sed "s/MAIN_IP/$main_ip/" {{ pods_dir }}/pod-chrome.yml 2>/dev/null | podman kube play --replace -w - 1>>/tmp/chrome.log 2>&1 && sudo chown root /dev/video0 1>>/tmp/chrome.log 2>&1 && pactl unload-module module-native-protocol-tcp 1>>/tmp/chrome.log 2>&1 &

##### Added by SPC v{{ version_spc }}
