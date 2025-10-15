##### Adding by SPC v{{ version_spc }}
##### secured-pc ##### auteur: L. Delatte, 2024
## general addition to /etc/bashrc in profile.d

if [ "$PS1" ]; then
  #
  # vim:ts=4:sw=4
  #
  set -o vi
  #
  alias sctl='systemctl --no-pager -n 200'
  alias jctl='journalctl'
  #
  alias l='ls -lrt'
  alias la='ls -la'
  alias lh='ls -lh'
  alias lz='ls -alZ'
  alias tl='tail -80'
  alias msg='sudo tail -80 /var/log/messages'
  alias ntp='sudo systemctl restart chronyd.service'
  alias rstc='sudo nice -n -{{ nice }} /usr/local/bin/spc-restart_pods.sh clamd'
  alias rsts='/usr/local/bin/spc-restart_pods.sh pods'
  alias scrub='scrub -b 4K'
  #
  # containerized:
  alias aff='viewer.sh'
  alias dis='viewer.sh'
  alias lbo='~/.local/bin/librof.sh'
  alias tec='~/.local/bin/ffPod.sh tec'
  alias ach='~/.local/bin/ffPod.sh ach'
  alias buy='~/.local/bin/ffPod.sh ach'
  alias ste='~/.local/bin/ffPod.sh pro'
  alias pro='~/.local/bin/ffPod.sh pro'
  alias xterm='~/.local/bin/xterm.sh'
  alias glances='glances.sh'
  #
  # selfmonitoring:
  df -h|grep "[09][0-9]%" && echo ">>>>> WARNING: some disks are filled <<<<<"
  timeout 2 curl -s google.fr >/dev/null || echo ">>>>> ERROR: no network <<<<<"
  pgrep -x firewalld >/dev/null || echo ">>>>> ERROR: firewalld not running <<<<<"
  [ `pgrep clam | wc -l` -ge 3 ] || echo ">>>>> ERROR: some clamav process not running <<<<<"
  [ "`getenforce`" = "Enforcing" ] || echo ">>>>> WARNING: SElinux not enforcing <<<<<"
  #
fi

##### Added by SPC v{{ version_spc }}
