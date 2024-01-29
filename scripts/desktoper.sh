#!/usr/bin/bash

if [ "$EUID" -ne 0 ] || [ "$1" == "-h" ] || [ "$#" -ne 4 ]; then
  echo "Usage: sudo desktoper [Name of .desktop file] [Name of application] [Path to exec] [Path to Icon]"
  exit 0
fi

location=/usr/share/applications/$1.desktop

touch $location

cat <<EOF >$location
[Desktop Entry]
Encoding=UTF-8
Version=1.0
Type=Application
Terminal=false
Exec=$3
Name=$2
Icon=$4
#Keywords=a;b;c;d;
EOF

nvim $location
