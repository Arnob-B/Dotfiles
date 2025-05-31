#! /bin/bash

choice=$(echo "float\nsticky" | dmenu -b)
kitty=~/.local/share/kitty.app/bin/kitty

title="terminal"

case "$choice" in
  "float")
		 $kitty --title "float"
		;;
 "sticky")
		$kitty --title "stickyfloat"
   ;;
 *)
	 notify-send "$title" "invalid command" --expire-time=1000
   ;;
esac
