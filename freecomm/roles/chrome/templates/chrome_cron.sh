#!/usr/bin/sh
##### Adding by SPC v{{ version_spc }}
##### secured-pc ##### auteur: Laurent Delatte, 2024

cd /home
for user in `ls` ;do
  [ "$user" = "lost+found" ] && continue
  /usr/bin/chown -R --reference=/home/$user/Téléchargements/chrome /home/$user/Téléchargements/chrome
  /usr/bin/chcon -R --reference=/home/$user/Téléchargements/chrome /home/$user/Téléchargements/chrome
done

##### Added by SPC v{{ version_spc }}
