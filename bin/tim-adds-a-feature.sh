#!/bin/bash
curdir=$(dirname $0)
source $curdir/helpers.sh
source $curdir/tim-config.sh

cp -R $curdir/../igitit-ping/ $workdir
telltmux "cd $workdir"
telltmux 'git status'
telltmux 'rackup'
intmux split-window -v
telltmux "cd $workdir"
telltmux 'cat app.rb'

echo 'Tim: Prove it via ping'
wait_if_presenting
inpane 1
telltmux 'curl localhost:8080/ping'

echo 'Tim: Cleaning up'
wait_if_presenting
intmux kill-pane
telltmux C-c

echo 'Tim: about to commit'
wait_if_presenting
telltmux 'git add .'
telltmux 'git commit -m "As a user, I can ping"'

echo 'Tim: about to add remote and push'
wait_if_presenting
telltmux 'git push -u origin master'
