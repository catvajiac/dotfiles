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
  ABS_PATH=$HOME/${FILES[$FILE]} 
  if [ ! -f $ABS_PATH ] && [ ! -d $ABS_PATH ]; then
    echo "$HOME/${FILES[$FILE]}..."
    ln -s $DIR/$FILE $ABS_PATH
  fi
done
