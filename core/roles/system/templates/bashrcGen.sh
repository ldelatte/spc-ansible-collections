##### Adding by SPC v{{ version_spc }}
##### secured-pc ##### auteur: Laurent Delatte, 2024
## general addition to /etc/bashrc in profile.d

if [ "$PS1" ]; then
  #
  # vim:ts=4:sw=4
  #
  set -o vi
  #
  alias sctl='systemctl'
  alias jctl='journalctl'
  #
  alias l='ls -lrt'
  alias la='ls -al'
  alias lz='ls -alZ'
  alias tl='tail -80'
  alias msg='sudo tail -80 /var/log/messages'
  alias ntp='sudo systemctl restart chronyd.service'
  alias rstc='sudo nice -n -{{ nice }} /usr/local/bin/restart_pods.sh clamd'
  alias rsts='/usr/local/bin/restart_pods.sh pods'
  alias disp='viewer.sh'
  alias aff='viewer.sh'
  alias chrome='chrome.sh'
  alias glances='glances.sh'
  #
  df -h|grep "[09][0-9]%"
  #
fi

##### Added by SPC v{{ version_spc }}
