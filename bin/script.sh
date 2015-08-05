#!/bin/bash

curdir=$(dirname $0)

echo 'Setting up the scene'
./$curdir/set-the-scene.sh

echo 'Chapter 1: Tim, Ruby, and Git'
echo 'Tim is a new developer at PongCorp'
echo 'Decides to work on a small project before his first day'
read
./$curdir/tim-starts-a-project.sh

echo "Chapter 2: Tim's first feature"
read
./$curdir/tim-adds-a-feature.sh

echo "Chapter 3: Tim's first day"
read
./$curdir/veronica-wants-to-help.sh

echo 'Chapter 4: Tim fixes a bug'
read
./$curdir/tim-fixes-a-bug.sh

echo "Chapter 5: Veronica's PR"
read
./$curdir/veronica-gets-her-pr-merged.sh
