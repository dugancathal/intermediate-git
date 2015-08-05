#!/bin/bash
curdir=$(dirname $0)
source $curdir/helpers.sh

# Open TMUX
if ! intmux list-sessions >/dev/null 2>&1; then
  osascript \
    -e 'tell application "Terminal"' \
    -e "do script \"tmux -S $TMUX_SOCK\"" \
    -e 'end tell'
  sleep 1
fi

rm -rf /tmp/{tim,veronica}

inpane 0
telltmux clear Enter
telltmux cd Space $PWD Enter
