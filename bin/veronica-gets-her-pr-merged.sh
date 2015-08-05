#!/bin/bash
curdir=$(dirname $0)
source $curdir/helpers.sh
source $curdir/veronica-config.sh

inpane 0
telltmux "git remote add veronica $repo"
telltmux "git fetch veronica"
telltmux "git checkout veronica/pings-have-creation-times"
telltmux "git show"

wait_for_input
