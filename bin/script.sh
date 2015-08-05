#!/bin/bash

curdir=$(dirname $0)
source $curdir/helpers.sh

echo 'Setting up the scene'
./$curdir/set-the-scene.sh

echo 'Chapter 1: Tim, Ruby, and Git'
echo 'Tim is a new developer at PongCorp'
echo 'Decides to work on a small project before his first day'
wait_if_presenting
./$curdir/tim-starts-a-project.sh

echo "Chapter 2: Tim's first feature"
wait_if_presenting
./$curdir/tim-adds-a-feature.sh

echo "Chapter 3: Tim's first day"
wait_if_presenting
./$curdir/veronica-wants-to-help.sh

echo 'Chapter 4: Tim fixes a bug'
wait_if_presenting
./$curdir/tim-fixes-a-bug.sh

echo "Chapter 5: Veronica's PR"
wait_if_presenting
./$curdir/veronica-gets-her-pr-merged.sh
