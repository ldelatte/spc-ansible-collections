#!/usr/bin/sh
##### Adding by SPC v{{ version_spc }}
##### secured-pc ##### auteur: Laurent Delatte, 2024

cd /home
/usr/bin/chown -R --reference={{ ansible_user_dir }}/Téléchargements/xterm {{ ansible_user_dir }}/Téléchargements/xterm
/usr/bin/chcon -R --reference={{ ansible_user_dir }}/Téléchargements/xterm {{ ansible_user_dir }}/Téléchargements/xterm

##### Added by SPC v{{ version_spc }}
