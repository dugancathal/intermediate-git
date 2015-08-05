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
telltmux "git remote add origin $repo"
telltmux 'git push -u origin master'

echo 'Tim: PM found a bug'
read
cp -R $curdir/../igitit-pong/ $workdir
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

echo 'Tim: About to commit and push bugfix'
telltmux 'git add .'
telltmux 'git commit -m "Riiiiight, pings __pong__"'
telltmux 'git push origin master'

