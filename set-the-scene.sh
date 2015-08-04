#!/bin/bash

TMUX_SOCK=/tmp/intermediate-git.sock

# Open TMUX
osascript \
  -e 'tell application "Terminal"' \
  -e "do script \"tmux -S $TMUX_SOCK\"" \
  -e 'end tell'
sleep 1

tmux -S $TMUX_SOCK split-window -h
tmux -S $TMUX_SOCK split-window -v
