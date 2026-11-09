#!/bin/sh
# Ctrl+H/J/K/L in herdr, vim-tmux-navigator style: if the focused pane runs
# vim/nvim or fzf, hand the key to it (nvim moves to the next herdr pane itself
# when it hits its edge); otherwise focus the neighbouring herdr pane.
# Usage: navigate.sh left|down|up|right

case $1 in
  left) key=ctrl+h ;;
  down) key=ctrl+j ;;
  up) key=ctrl+k ;;
  right) key=ctrl+l ;;
  *) echo "usage: $0 left|down|up|right" >&2; exit 2 ;;
esac

herdr=${HERDR_BIN_PATH:-herdr}

# Without --pane, process-info targets the UI-focused pane.
info=$("$herdr" pane process-info) || exit 1
pane=$(printf '%s' "$info" | jq -r '.result.process_info.pane_id')

if printf '%s' "$info" | jq -e 'any(.result.process_info.foreground_processes[]?.name; test("^(view|n?vim?x?|fzf)(diff)?$"))' >/dev/null; then
  exec "$herdr" pane send-keys "$pane" "$key"
else
  exec "$herdr" pane focus --pane "$pane" --direction "$1"
fi
