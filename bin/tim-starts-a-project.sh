#!/bin/bash
curdir=$(dirname $0)
source $curdir/tmux-helpers.sh
source $curdir/tim-config.sh

echo 'Setting up local'
rm -rf $workdir
mkdir -p $workdir
echo 'Setting up github'
curl -s -u "${TIM_AUTH}" -XDELETE https://api.github.com/repos/${repopath} >/dev/null
curl -s -u "${TIM_AUTH}" -XPOST https://api.github.com/user/repos -d '{"name": "igitit"}' >/dev/null

echo 'Tim: About to create project locally.'
read
inpane 0
telltmux 'bash'
telltmux "cd $workdir"
telltmux "echo '# Imma project!' > README.md"
telltmux 'git init'
telltmux 'git status'
telltmux 'git add .'

echo 'Tim: about to commit'
read
telltmux 'git commit -m "Initial commit"'

echo 'Tim: about to add remote and push'
read
telltmux "git remote add origin $repo"
telltmux 'git push -u origin master'

