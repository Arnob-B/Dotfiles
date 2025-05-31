#!/bin/bash

# Declare associative array of commands to script paths
declare -A command_map=(
  [blurlock]="$HOME/.config/scripts/blurlock.sh"
  [powercycle]="$HOME/.config/scripts/powercycle.sh"
  [float-term]="$HOME/.config/scripts/floatterm.sh"
)

# Use dmenu to select a command from the keys of the map
selected_command=$(printf '%s\n' "${!command_map[@]}" | dmenu -b -i -p "Select command:")

# If something was selected and it exists in the map, run it
#if [[ -n "$selected_command" && -n "${command_map[$selected_command]}" && -x "${command_map[$selected_command]}" ]]; then
  zsh "${command_map[$selected_command]}"
#else
#  echo "No valid command selected or script not executable."
#fi
