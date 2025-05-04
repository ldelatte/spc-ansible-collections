#!/usr/bin/sh
##### Adding by SPC v{{ version_spc }}
##### secured-pc ##### auteur: Laurent Delatte, 2024

cd /home
for user in `ls` ;do
  [ "$user" = "lost+found" ] && continue
  /usr/bin/chmod -R g+rw /home/$user/Téléchargements
  /usr/bin/chown --reference=/home/$user/Téléchargements /home/$user/Téléchargements/*.* 2>/dev/null
  /usr/bin/chcon --reference=/home/$user/Téléchargements /home/$user/Téléchargements/*.* 2>/dev/null
  /usr/bin/chown -R --reference=/home/$user/Téléchargements/FF-tec /home/$user/Téléchargements/FF-*
  /usr/bin/chcon -R --reference=/home/$user/Téléchargements/FF-tec /home/$user/Téléchargements/FF-*
done

##### Added by SPC v{{ version_spc }}
