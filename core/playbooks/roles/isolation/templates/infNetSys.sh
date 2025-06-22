#!/usr/bin/sh
##### Adding by SPC v{{ version_spc }}
##### secured-pc ##### auteur: L. Delatte, 2024
##### system version #####

# Create network infra for podman: n subnets and n zones:
# - pmInX:	10.10.1Y.0/24	servers accessed from the outside
# - pmOutX:	10.10.3Y.0/24	clients to outside
# - pmInX:	10.10.5Y.0/24	particular servers accessed from the outside
# - pmOutX:	10.10.7Y.0/24	particular clients to outside
# - pmNoneX:10.10.9Y.0/24	local only apps
#
# Create the zone:
#podman network create --ignore --subnet --gateway --ip-range -o isolate=1 -o no_default_route=1 nomres
#
dns="--disable-dns"
#
# FF:
zone=pmOutF && cidrZone="10.10.31.0/24"
podman network create --ignore -o isolate=1 --subnet $cidrZone $dns $zone
# Xterm & spc-sshd:
zone=pmOutX && cidrZone="10.10.32.0/24"
podman network create --ignore -o isolate=1 --subnet $cidrZone $dns $zone
# msOneDrive:
zone=pmOutO && cidrZone="10.10.33.0/24"
podman network create --ignore -o isolate=1 --subnet $cidrZone $dns $zone
# libreoffice:
zone=pmNoneL && cidrZone="10.10.91.0/24"
podman network create --ignore -o isolate=1 --subnet $cidrZone $dns $zone

##### Added by SPC v{{ version_spc }}
