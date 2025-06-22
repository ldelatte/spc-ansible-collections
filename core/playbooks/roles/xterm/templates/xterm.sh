#!/usr/bin/sh
##### Adding by SPC v{{ version_spc }}
##### secured-pc ##### auteur: L. Delatte, 2024

# execute un pod dedie xterm
#
# SELinux:
#
# ... (valable aussi pour FF ...)
#
# Cree un socket X11 dedie:
#
no_display="21"
nohup /usr/bin/socat -dd unix-connect:/tmp/.X11-unix/X0 unix-listen:/tmp/.X11-unix/X$no_display,unlink-early=1 1>/tmp/xterm.log 2>&1 &
sleep 1
sudo /usr/bin/chcon system_u:object_r:container_file_t:{{ se_ct_level.xt }} /tmp/.X11-unix/X$no_display
sudo /usr/bin/chgrp {{ xt_ct_user }} /tmp/.X11-unix/X$no_display
sudo /usr/bin/chmod 770 /tmp/.X11-unix/X$no_display
#
xhost +local: >/dev/null
#
# Execute le pod concerne
#
nohup podman kube play --replace -w {{ pods_dir }}/pod-xterm.yml 1>/tmp/xterm.log 2>&1 &

##### Added by SPC v{{ version_spc }}
