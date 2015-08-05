#!/bin/bash
GITHUB_ENV_FILE=${curdir}/../tmp/github.env
if [[ -f $GITHUB_ENV_FILE ]]; then
  source ${curdir}/../tmp/github.env
else
  echo 'Unable to find github env file in tmp/github.env' 2>&1
  echo 'Create one, and set the environment vars there' 2>&1
  exit 1
fi

export repopath="${TIM_USERNAME}/igitit"
export repo="git@github.com:${repopath}"
export workdir='/tmp/tim/igitit'

