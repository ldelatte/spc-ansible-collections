#!/usr/bin/sh
##### Adding by SPC v{{ version_spc }}
##### secured-pc ##### auteur: Laurent Delatte, 2024

# execute un pod dedie glances
#
xhost +local: >/dev/null
#
# Execute le pod concerne
#
nohup podman kube play --replace -w {{ pods_dir }}/pod-glances.yml 1>/tmp/glances.log 2>&1 &

##### Added by SPC v{{ version_spc }}
