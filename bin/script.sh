#!/bin/bash

curdir=$(dirname $0)

echo 'Setting up the scene'
./$curdir/set-the-scene.sh

echo 'Chapter 1: Tim, Ruby, and Git'
echo 'Tim is a new developer at PongCorp'
echo 'Decides to work on a small project before his first day'
./$curdir/tim-starts-a-project.sh

echo "Tim's first feature"
./$curdir/tim-adds-a-feature.sh

echo "Chapter 2: Tim's first day"
./$curdir/veronica-wants-to-help.sh
