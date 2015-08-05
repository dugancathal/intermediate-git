#!/bin/bash
curdir=$(dirname $0)
source $curdir/tmux-helpers.sh
source $curdir/tim-config.sh

cp -R $curdir/../igitit-ping/ $workdir
telltmux "cd $workdir"
telltmux 'git status'
telltmux 'rackup'
intmux split-window -v
telltmux "cd $workdir"
telltmux 'cat app.rb'

echo 'Tim: Prove it via ping'
read
inpane 1
telltmux 'curl localhost:8080/ping'

echo 'Tim: Cleaning up'
read
intmux kill-pane
telltmux C-c

echo 'Tim: about to commit'
read
telltmux 'git add .'
telltmux 'git commit -m "As a user, I can ping"'

echo 'Tim: about to add remote and push'
read
telltmux 'git push -u origin master'
