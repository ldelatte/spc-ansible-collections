#!/usr/bin/sh
##### Adding by SPC v{{ version_spc }}
##### secured-pc ##### auteur: Laurent Delatte, 2024
# Execute un pod dedie Firefox

#
categ="$1"	# tec / ach / bnq / pro (& admin)
[ "$categ" ] || { echo "argument \"categorie\" necessaire: tec / ach / pro / bnq + evt: video"; exit 1; }
Xdisplay="X20"
#
#
# SELinux:
#
# cf xterm
#
# Cree un socket pour X11 dedie Firefox:   X20
#
user=`id -un`
no_display=`ls -l /tmp/.X11-unix/X? | grep " $user\s*$user " | head -1 | sed 's/.*X//'`
nohup /usr/bin/socat -dd unix-connect:/tmp/.X11-unix/X$no_display unix-listen:/tmp/.X11-unix/$Xdisplay,unlink-early=1 1>/tmp/ffPod.$categ.log 2>&1 &
skd=$!
sleep 1
sudo /usr/bin/chcon system_u:object_r:container_file_t:{{ se_ct_level.ff }} /tmp/.X11-unix/$Xdisplay
sudo /usr/bin/chgrp {{ ff_ct_user }} /tmp/.X11-unix/$Xdisplay
sudo /usr/bin/chmod 770 /tmp/.X11-unix/$Xdisplay
#
xhost +local: >/dev/null
#
if [ "$2" = "video" -o $categ = "tec" ] ;then
	# Cree un socket audio dedie Firefox:
	Paudio="P$(id -u)"
	nohup /usr/bin/socat -dd unix-connect:/$XDG_RUNTIME_DIR/pulse/native unix-listen:/tmp/.X11-unix/$Paudio,unlink-early=1 1>>/tmp/ffPod.$categ.log 2>&1 &
	ska=$!
	sudo /usr/bin/chcon system_u:object_r:container_file_t:{{ se_ct_level.ff }} /tmp/.X11-unix/$Paudio
	sudo /usr/bin/chgrp {{ ff_ct_user }} /tmp/.X11-unix/$Paudio
	sudo /usr/bin/chmod 770 /tmp/.X11-unix/$Paudio
	# autorise la camera:
	sudo chown {{ ff_ct_user }} /dev/video0
	# Execute le pod concerne
	nohup podman kube play --replace -w --network=pmOutF {{ pods_dir }}/pod-$categ.yml 1>>/tmp/ffPod.$categ.log 2>&1 && kill $skd $ska 1>>/tmp/ffPod.$categ.log 2>&1 && sudo chown root /dev/video0 1>>/tmp/ffPod.$categ.log 2>&1 &
else
	# Execute le pod concerne
	if [ $categ = "bnq" ] ;then
		nohup podman exec -it pk-visu-pk-ff-$categ sh -c "umask 002 && firefox" 1>>/tmp/ffPod.$categ.log 2>&1 && kill $skd 1>>/tmp/ffPod.$categ.log 2>&1 &
	else
		nohup podman kube play --replace -w --network=pmOutF {{ pods_dir }}/pod-$categ.yml 1>>/tmp/ffPod.$categ.log 2>&1 && kill $skd 1>>/tmp/ffPod.$categ.log 2>&1 &
	fi
fi

##### Added by SPC v{{ version_spc }}
