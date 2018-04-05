#!/bin/bash
DIR=`pwd`
NOTIFYD=".config/notifyd/scripts"
BIN=".local/bin"

declare -A FILES=(
  [anyconnect]=".anyconnect"
  [bashrc]=".bashrc"
  [i3conf]=".config/i3/config"
  [i3statusconf]=".i3status.conf"
  [le_petit_prince.sh]="$BIN/le_petit_prince"
  [lfptrc]=".lfptrc"
  [pdf.sh]="$BIN/pdf"
  [polybar]=".config/polybar"
  [signal.sh]="$BIN/signal"
  [ssh_config]=".ssh/config"
  [term_conf]=".config/terminator/config"
  [tmux_conf]=".tmux.conf"
  [user-dirs]=".config/user-dirs.dirs"
  [vim]=".vim"
  [vimrc]=".vimrc"
  [vpn.sh]="$BIN/vpn"
)

for FILE in "${!FILES[@]}"; do
  ABS_PATH=$HOME/${FILES[$FILE]} 
  if [ -f $ABS_PATH ] || [ -d $ABS_PATH ]; then
    echo "Removing old $FILE..."
    rm -rf $ABS_PATH
  fi
  echo "Linking      $FILE..."
  ln -s $DIR/$FILE $ABS_PATH
done

ln -s "$HOME/$NOTIFYD/notifyd-toggle.sh" "$HOME/$BIN/toggle-notifications"
