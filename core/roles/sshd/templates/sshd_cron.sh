#!/usr/bin/sh
##### Adding by SPC v{{ version_spc }}
##### secured-pc ##### auteur: Laurent Delatte, 2024

cd /home
/usr/bin/chown -R --reference={{ ansible_user_dir }}/Téléchargements/sshd {{ ansible_user_dir }}/Téléchargements/sshd
/usr/bin/chcon -R --reference={{ ansible_user_dir }}/Téléchargements/sshd {{ ansible_user_dir }}/Téléchargements/sshd

##### Added by SPC v{{ version_spc }}
