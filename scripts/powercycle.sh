#! /bin/sh

choice=$(echo "⏻ power\n↻ reboot" | dmenu -b)


title="powercycle initiated"

case "$choice" in
  "⏻ power")
		notify-send "$title" "poweroff ..." && poweroff
		;;
 "↻ reboot")
	 notify-send "$title" "rebooting ..." && reboot
   ;;
 *)
	 notify-send "$title" "invalid command" --expire-time=1000
   ;;
esac
