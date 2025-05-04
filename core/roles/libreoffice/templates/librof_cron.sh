#!/usr/bin/sh
##### Adding by SPC v{{ version_spc }}
##### secured-pc ##### auteur: Laurent Delatte, 2024

cd /home
for user in `ls` ;do
  [ "$user" = "lost+found" ] && continue
  /usr/bin/chown -R --reference=/home/$user/Téléchargements/libreoffice /home/$user/Téléchargements/libreoffice
  /usr/bin/chcon -R --reference=/home/$user/Téléchargements/libreoffice /home/$user/Téléchargements/libreoffice
done

##### Added by SPC v{{ version_spc }}
