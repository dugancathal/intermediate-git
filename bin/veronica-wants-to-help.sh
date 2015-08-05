#!/bin/bash
curdir=$(dirname $0)
source $curdir/helpers.sh
source $curdir/veronica-config.sh

echo 'Veronica: Setting up local' $workdir
intmux split-window -h
telltmux 'exec bash'
rm -rf $workdir
mkdir -p $(dirname $workdir)

echo 'Veronica: Setting up github (forking)'
curl -s -u "${VERONICA_AUTH}" -XDELETE https://api.github.com/repos/${repopath} >/dev/null
curl -s -u "${VERONICA_AUTH}" -XPOST https://api.github.com/repos/${parent_repopath}/forks >/dev/null

echo 'Veronica: About to clone and make changes'
wait_if_presenting
telltmux "cd $(dirname $workdir)"
sleep 1
telltmux "git clone --quiet $repo"
sleep 1
telltmux "cd $workdir"
sleep 0.5

echo 'Veronica: Creating feature branch'
wait_if_presenting
telltmux 'git checkout -b pings-have-creation-times'

echo 'Veronica: About to apply changes'
wait_if_presenting
cp -R $curdir/../igitit-create-pings/ $workdir

telltmux 'git status'
telltmux 'rackup'
intmux split-window -v
telltmux "cd $workdir"
telltmux 'cat app.rb'

echo 'Veronica: Prove it via pings'
wait_if_presenting
inpane 2
telltmux 'curl -X POST localhost:8080/pings -d "{}"'
telltmux 'curl -X POST localhost:8080/pings -d "{}"'
telltmux 'curl -X POST localhost:8080/pings -d "{}"'
telltmux 'curl -X GET localhost:8080/pings'

echo 'Veronica: Cleaning up'
wait_if_presenting
intmux kill-pane
telltmux C-c

echo 'Veronica: about to commit'
wait_if_presenting
telltmux 'git add .'
telltmux 'git commit -m "As a user, I can see all pings"'

echo 'Veronica: about to push'
wait_if_presenting
telltmux 'git push -u origin pings-have-creation-times'
telltmux 'git checkout -'
