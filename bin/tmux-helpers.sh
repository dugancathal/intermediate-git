#!/bin/bash
TMUX_SOCK=/tmp/intermediate-git.sock

function intmux() {
  tmux -S $TMUX_SOCK $@
}

function current_pane() {
  echo "$(intmux list-panes -F '#{pane_index} #{?pane_active,yes,no}' | grep yes | head -c 1)"
}

function inpane() {
  local pane=$1
  shift

  intmux select-pane -t $pane
}

function telltmux() {
  tmux -S $TMUX_SOCK send-keys "$@" C-m
}

