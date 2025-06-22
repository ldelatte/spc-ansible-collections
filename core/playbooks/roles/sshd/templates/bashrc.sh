#!/usr/bin/sh
##### Adding by SPC v{{ version_spc }}
##### secured-pc ##### auteur: L. Delatte, 2024

if [ "$PS1" ]; then
  #
  # vim:ts=4:sw=4
  #
  set -o vi
  #
  alias l='ls -lrt'
  alias ll='ls -l'
  alias la='ls -al'
  alias lz='ls -alZ'
  alias tl='tail -80'
fi

export LANG=fr_FR.UTF-8 LC_ALL=fr_FR.UTF-8 CHARSET=fr_FR.UTF-8

##### Added by SPC v{{ version_spc }}
