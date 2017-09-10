#!/bin/bash
DIR=`pwd`

declare -A FILES=(
  [anyconnect]=".anyconnect"
  [bashrc]=".bashrc"
  [i3conf]=".config/i3/config"
  [i3statusconf]=".i3statusconf"
  [lfptrc]=".lfptrc"
  [ssh_config]=".ssh/config"
  [vim]=".vim"
  [vimrc]=".vimrc"
)

for FILE in "${!FILES[@]}"; do
  if [ ! -e $FILE ]; then
    echo "restoring $FILE..."
    ln -s $FILE $HOME/${FILES[$FILE]}
  fi
done
