#!/bin/bash
##### Adding by SPC v{{ version_spc }}
##### secured-pc ##### auteur: L. Delatte, 2024

#
# Change file permissions service:
#
TELE="/home/*/Téléchargements"
MSOD="{{ data_dir }}/msOneDrive"

inotifywait -mrq -e create -e moved_to --format "%w%f" --exclude lost+found $TELE $MSOD | while read FILENAME
do
  DIR=$(dirname "$FILENAME")
  FIC=$(basename "$FILENAME")
  echo $FIC | grep -q -e ".tmp$" -e "^.~lock" && continue
  echo ""
  ls -lZ "$FILENAME"
  #
  if echo $DIR | grep -q "Téléchargements/" ;then
    echo Télé/...:
	SDIR=$(echo $DIR | sed 's/\(.*Téléchargements.[^/]*\).*/\1/')
    echo réf $SDIR :
	/usr/bin/chown --reference=$SDIR "$FILENAME"
	/usr/bin/chcon --reference=$SDIR "$FILENAME"
    /usr/bin/chmod g+rw "$FILENAME"
  elif echo $DIR | grep -q "Téléchargements" ;then
    echo réf $DIR :
	/usr/bin/chown --reference=$DIR "$FILENAME"
	/usr/bin/chcon --reference=$DIR "$FILENAME"
    /usr/bin/chmod g+rw "$FILENAME"
  else # msod
    echo réf $DIR
	/usr/bin/chown 131099:{{ ansible_user }} "$FILENAME"
	/usr/bin/chcon --reference=$DIR "$FILENAME"
    /usr/bin/chmod o-rwx "$FILENAME"
  fi
  #
  ls -lZ "$FILENAME"
done >>/var/log/spc-file_change.log 2>&1

##### Added by SPC v{{ version_spc }}
