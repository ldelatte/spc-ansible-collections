#!/usr/bin/sh
##### Adding by SPC v{{ version_spc }}
##### secured-pc ##### auteur: Laurent Delatte, 2024

/usr/bin/chown -R {{ ff_ct_user }}:{{ ansible_user }} {{ data_dir }}/msOneDrive/*
/usr/bin/chmod -R o-rwx {{ data_dir }}/msOneDrive/*
/usr/bin/chcon -R --reference={{ data_dir }}/msOneDrive {{ data_dir }}/msOneDrive

##### Added by SPC v{{ version_spc }}
