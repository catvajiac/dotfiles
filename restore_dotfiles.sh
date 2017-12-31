#!/bin/bash
DIR=`pwd`

declare -A FILES=(
  [anyconnect]=".anyconnect"
  [bashrc]=".bashrc"
  [i3conf]=".config/i3/config"
  [i3statusconf]=".i3status.conf"
  [lfptrc]=".lfptrc"
  [ssh_config]=".ssh/config"
  [vim]=".vim"
  [vimrc]=".vimrc"
  [tmux_conf]=".tmux.conf"
  [vpn.sh]=".local/bin/vpn"
  [polybar]=".config/polybar"
)

for FILE in "${!FILES[@]}"; do
  ABS_PATH=$HOME/${FILES[$FILE]} 
  if [ -f $ABS_PATH ] || [ -d $ABS_PATH ]; then
    echo "Removing old $ABS_PATH..."
    rm -rf $ABS_PATH
  fi
  echo "Linking      $ABS_PATH..."
  ln -s $DIR/$FILE $ABS_PATH
done
