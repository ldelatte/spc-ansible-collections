#!/usr/bin/sh
##### Adding by SPC v{{ version_spc }}
##### secured-pc ##### auteur: L. Delatte, 2024

# execute un pod dedie viewer
#
# SELinux:
#
# cf xterm
#
xhost + LOCAL: >/dev/null
#
# Execute le pod concerne

lst() {
    sed 's|\(\w\.\w*\) |\1\n|g' |
    while read l ;do [ -f "$l" ] && echo -n "$dir/" && basename "$l" ;done |
	sed -e 's|^/home/\w*||' -e 's|^|/home/user|'
}

flt() {
    if [ "$ext" = 1 ] ;then    # extraction ...
        echo $* | sed 's/.$//' |
        sed -e 's/\([^.]*\)\.\([^ ]*\) /\1.\2\n/g' |
        sed "s/^/$dir\//"
    else
        echo $* |
        lst
    fi |
    grep -v -i -e "\.pgp" -e "\.gpg" -e "\.zip" |
    grep -i -e "\.png" -e "\.jpg" -e "\.gif" -e "\.pdf" -e "\.txt" -e "\.sh" -e "\.log" |
    sed -e 's/^/file:/' -e 's/ /%20/g'
}

dir="`echo $* | sed 's|\(\w\.\w*\) |\1\n|g' | head -1`"
dir=`dirname "$dir"`
echo $dir | grep -q "^\.\." && { pwd=`echo $PWD | sed 's|/[^/]*$||'`; dir="`echo $dir | sed 's|..|'$pwd'|'`"; }
echo $dir | grep -q "^\." && dir="`echo $dir | sed 's|.|'$PWD'|'`"
echo $dir | grep -q "^\w" && dir="`echo $dir | sed 's|^|'$PWD'/|'`"

ext=0
if [ `echo $* | lst | wc -l` = 1 ] && echo $* | lst | grep -q -i -e "\.pgp$" -e "\.gpg" ;then    # pgp ...
    pgp=`echo $* | lst| sed 's/ /\\\ /g'`
    podman exec -it pk-view-pk-gpgext sh -c "rm -rf * && gpgtar -d $pgp >ext.log 2>&1"
    unique=$?
    set `podman exec -it pk-view-pk-gpgext sh -c "ext.sh $unique $pgp | xargs"`
    dir="\/home\/user\/ext"
    ext=1
elif [ `echo $* | lst | wc -l` = 1 ] && echo $* | lst | grep -q -i "\.zip$" ;then    # zip ...
    zip=`echo $* | lst| sed 's/ /\\\ /g'`
    podman exec -it pk-view-pk-gpgext sh -c "rm -rf * && unzip -d extdir $zip >ext.log 2>&1"
    unique=$?
    [ $unique = 0 ] && unique=99
    set `podman exec -it pk-view-pk-gpgext sh -c "ext.sh $unique $zip | xargs"`
    dir="\/home\/user\/ext"
    ext=1
fi

doc=`flt $*`
{ echo ===${doc}=== && echo ""; } >/tmp/viewer.log
nohup podman exec -it pk-view-pk-okular okular $doc 1>>/tmp/viewer.log 2>&1 &

##### Added by SPC v{{ version_spc }}
