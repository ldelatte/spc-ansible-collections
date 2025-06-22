#!/usr/bin/sh
##### Adding by SPC v{{ version_spc }}
##### secured-pc ##### auteur: L. Delatte, 2024

#
# Restart services:
#
if [ `id -u` = 0 ] ;then	# as root
    echo On arrete clamd ...
    >/tmp/rst.log
    nohup systemctl stop clamd@scan.service >/dev/null 2>&1 &
    sleep 5
    pkill -9 clamd
    echo On relance clamd ...
    nohup sleep 20 >/dev/null 2>&1 && systemctl start clamd@scan.service >/dev/null 2>&1 && pidof clamd >>/tmp/rst.log 2>&1 && renice -n {{ nice }} -p `pidof clamd` >>/tmp/rst.log 2>&1 &
elif [ `id -u` -ge 1000 ] ;then	# as a user
    echo On redemarre les services ...
    podman pod stop -a
    podman rm -a
    for f in `ls ~/.config/systemd/user/default.target.wants` ;do
        systemctl --user restart $f
    done
fi

##### Added by SPC v{{ version_spc }}
