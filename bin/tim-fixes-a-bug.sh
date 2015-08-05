#!/bin/bash
curdir=$(dirname $0)
source $curdir/helpers.sh
source $curdir/tim-config.sh

echo 'Tim: PM found a bug'
wait_if_presenting
inpane 0
cp -R $curdir/../igitit-pong/ $workdir
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

echo 'Tim: About to commit and push bugfix'
telltmux 'git add .'
telltmux 'git commit -m "Riiiiight, pings __pong__"'
telltmux 'git push origin master'
