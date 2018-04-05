#!/bin/sh

usage() {
  cat << EOF
usage: `basename "$0"` [options]
  -c  Connect to vpnaccess.nd.edu
  -d  Disconnect from vpnaccess.nd.edu
EOF
  exit $1
}

if [ $# -eq 0 ]; then
  usage 1
fi

while [ $# -gt 0 ]; do
  if [ "$1" = '-h' ]; then
    usage 0
  elif [ "$1" = '-c' ]; then
    echo "Connecting..."
    sudo openconnect -q -u cvajiac -b vpnaccess.nd.edu
  elif [ "$1" = '-d' ]; then
    echo "Disconnecting..."
    sudo pkill openconnect
  else
    usage 1
  fi
  shift
done
