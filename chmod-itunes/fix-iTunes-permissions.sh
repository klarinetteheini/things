#!/bin/ksh

PATH=/usr/bin:/bin

# iTunes Library Location
ITLIBRARY=/Users/itunes/Music/iTunes

# must run as root
if [ $(id -u) -ne 0 ]; then
    print -u2 "Must run as root"
    exit 1
fi

# make sure the group is set to itunes on everything
chgrp -R itunes $ITLIBRARY

# and everything is group writeable
chmod -R g+w $ITLIBRARY

# make sure all directories are setgid
find $ITLIBRARY -type d \! -perm -02000 -exec chmod g+s \{\} \;
