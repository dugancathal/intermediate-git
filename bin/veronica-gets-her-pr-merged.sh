#!/bin/bash
curdir=$(dirname $0)
source $curdir/helpers.sh
source $curdir/veronica-config.sh

inpane 0
echo "Tim: Looks over Veronica's changes"
telltmux "git remote add veronica $repo"
telltmux "git fetch veronica"
telltmux "git checkout veronica/pings-have-creation-times"
telltmux "git show"

echo 'Explain detached head'
echo 'Explain that git has GREAT help messages'
echo 'Explain the issue we created - one line caused problems'
echo ''
echo 'Resolve the merge conflict'

wait_for_input

telltmux 'git push -u origin master'
