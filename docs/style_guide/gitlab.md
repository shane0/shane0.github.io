---
tags:
  - workflow 
  - templates 
---
# gitlab workflow

## upload

```sh
# upload.sh
#!/usr/bin/env bash
git init
git add .
git commit -m 'setup folder'
git push --set-upstream git@gitlab.com:shane0/project.git master
git remote add origin git@gitlab.com:shane0/project
start git@gitlab.com:shane0/project
```

## push

```sh
# push.sh 'comment'
#!/usr/bin/env bash
# ./push.sh commit_message

function addcommitpush () {
  message=(\'"$@"\')
  current=$(git branch | grep "*" | cut -b 3-)
  # read -r -i "$current" -e branch
  remote=$(git remote -v | head -1 | cut -d ' ' -f 1 )
  echo push local branch "$current" to "$remote" y n ?
  read -r yn
  if [ "$yn" = y ]; then
    # echo "$current" "$remote"
    git add -A && git commit -a -m "$message"
    git push origin "$current"
  else
    echo "nope"
  fi
}

addcommitpush "$1"
mkdocs gh-deploy
```

## workflow

<https://docs.gitlab.com/ee/topics/gitlab_flow.html>

[new to gitlab](https://docs.gitlab.com/ee/index.html#new-to-git-and-gitlab)

## branch

<https://docs.gitlab.com/ee/gitlab-basics/start-using-git.html#create-a-branch>

```sh
git checkout -b <name-of-branch>
git checkout <name-of-branch>
git diff
git status
git add <file or folder>
git status
git commit -am "message"
git push <remote> <name-of-branch>
git merge ?
git branch -l
```

discard changes git checkout .
