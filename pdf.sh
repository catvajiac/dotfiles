#!/usr/bin/sh

usage() {
  cat <<EOF
usage: `basename "$0"` [options] filename
  -h Display usage message
EOF
  exit $1
}

if [ $# -eq 0 ]; then
  usage 1
fi

if [ "$1" = '-h' ]; then
  usage 0
fi

evince $1 >/dev/null 2>&1 &
