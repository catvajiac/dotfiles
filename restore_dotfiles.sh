#!/bin/bash
DIR=`pwd`
NOTIFYD=".config/notifyd/scripts"
BIN="$HOME/.local/bin"

link_script() {
  if [ -f $2 ] || [ -d $2 ]; then
    rm $2
  fi
  echo "Linking $2..."
  ln -s $1 $2
}

declare -A FILES=(
  [i3conf]=".config/i3/config"
  [polybar]=".config/polybar"
  [ssh_config]=".ssh/config"
  [term_conf]=".config/terminator/config"
  [user-dirs]=".config/user-dirs.dirs"
)


SCRIPTS=`ls scripts/`
for SCRIPT in $SCRIPTS; do
  link_script "$DIR/scripts/$SCRIPT" "$BIN/$SCRIPT"
done

for FILE in `ls rc_files`; do
  link_script "$DIR/rc_files/$FILE" "$HOME/$FILE"
done

for FILE in "${!FILES[@]}"; do
  ABS_PATH=$HOME/${FILES[$FILE]} 
  link_script "$DIR/$FILE" "$ABS_PATH"
done

#link_script "$HOME/$NOTIFYD/notifyd-toggle.sh" "$HOME/$BIN/toggle-notifications"
