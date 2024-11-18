# push.sh 'comment'
#!/usr/bin/env bash
# ./push.sh commit_message

function addcommitpush () {
  git pull
  message=(\'"$@"\')
  current=$(git branch | grep "*" | cut -b 3-)
  # read -r -i "$current" -e branch
  remote=$(git remote -v | head -1 | cut -d ' ' -f 1 )
  echo push local branch "$current" to "$remote" y n ?
  read -r yn
  if [ "$yn" = y ]; then
    git pull
    git add -A
    cz c
    mike deploy --push --update-aliases 2024 latest
    mike set-default 2024
    git push origin "$current"
  else
   echo "$current" "$remote"
    echo "nope"
  fi
}

addcommitpush "$1"
# mkdocs gh-deploy
open https://github.com/shane0/shane0.github.io/actions
