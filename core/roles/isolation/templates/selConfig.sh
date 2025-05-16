#!/usr/bin/sh
##### Adding by SPC v{{ version_spc }}
##### secured-pc ##### auteur: Laurent Delatte, 2024
#
# SELinux module config:
#
cmd="$*"
[ "$cmd" ] || { echo "usage: $0 \"<commande a autoriser>\""; exit 1; }
cmd_=`echo "$cmd" | sed 's/ /_/g'`
[ -f $cmd_.pp ] && cmd_=${cmd_}_
[ -f $cmd_.pp ] && cmd_=${cmd_}_
[ -f $cmd_.pp ] && cmd_=${cmd_}_
#
echo ""
echo To be launched after a $cmd launch attempt !!!!!
echo ""
sleep 5
#
cd /root
ausearch -c "$cmd" --raw |audit2allow -w
ausearch -c "$cmd" --raw |audit2allow -v
sleep 5
#
ausearch -c "$cmd" --raw |audit2allow -M spc-sel-${cmd_}
#
if [ -f spc-sel-${cmd_}.te ] ;then
  cat spc-sel-${cmd_}.te
  echo ""
  echo ""
  echo To launch:     semodule -X 300 -i spc-sel-${cmd_}.pp
  echo ""
  echo ""
else
  echo ""
  echo ""
  echo "ERROR It seems xterm command attempt has not yet been performed"
  echo ""
  echo ""
  exit 1
fi

##### Added by SPC v{{ version_spc }}
