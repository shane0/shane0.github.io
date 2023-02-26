# dotfiles

## git

```sh
git config --global alias.logline "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
git logline
```

## bash

- `bash_aliases` macos version

```sh
#!/usr/bin/env bash
export PATH=$HOME/.local/bin:$PATH
set -o vi
# set -o emacs
alias c='clear'
alias ea='vim ~/.bash_aliases'
alias sa='source ~/.bashrc'
alias linode='ssh present@45.79.105.23'

# bullet journaling 
alias ea='vim ~/.bash_aliases'
alias sa='source ~/.bashrc'
alias c='clear'
alias r='ranger'
alias rd="vim ./readme.md"
alias cl="vim ./changelog.md"
alias jf='mkdir "$(date +%F)" && cd "$(date +%F)"'
alias ft='vim ./future.md'
alias in='vim ./index.md'
alias fj='vim ./"$(date +%F)".md'
alias bj='cd ./bujo && fj || echo "there is no bujo folder"'
alias bujo='cd ./bujo && fj || mkdir bujo && cd ./bujo && vim ./"$(date +%F)".md'
# alias lt='du -sh * | sort -h'
# alias howmany='find . -type f -print | wc -l'
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias ta='tmux attach -t'
alias tl='tmux list-sessions'
alias tksv='tmux kill-server'
alias tkss='tmux kill-session -t'
# todocli app
alias t='clear && ./todocli/todo.sh'
alias d='clear && t listpri a'
alias snooze='clear && t listpri'
alias done='clear && cat ./todocli/done.txt'
alias tedit='vim ./todocli/todo.txt'
alias tall='clear && find . -name "todo.txt" | xargs grep "+"'
alias tpri='clear && find . -name "todo.txt" | xargs grep "(A"'
alias tprib='clear && find . -name "todo.txt" | xargs grep "(B"'
alias tpric='clear && find . -name "todo.txt" | xargs grep "(C"'
alias thelp='clear && ./todocli/todo.sh shorthelp'

# free space
# alias freespace='df -H --output=size,used,avail'
# alias fspace='sudo du -Sh | sort -rh | head -5'
# alias cports='sudo lsof -i -P -n | grep LISTEN'
# commenting for shellcheck fixme later
#alias trace='mtr --report-wide --curses $1'
#alias killtcp='sudo ngrep -qK 1 $1 -d wlan0'
# alias usage='ifconfig wlan0 | grep bytes'
# alias connections='sudo lsof -n -P -i +c 15'
# alias ducks='du -cks -- * | sort -rn | head\'alias ducks=\'du -cks -- * | sort -rn | head'
# alias myip='ip addr | grep inet'
alias v='vi $(fzf)'
#alias vba='. venv/bin/activate'
alias vvv='virtualev venv'
alias vv='source venv/bin/activate'
alias vf='pip install --editable .'
alias vr='pip install -r requirements.txt'
alias lt='ls --human-readable --size -1 -S --classify'

# more bujo
alias day='date +%D && date +%j && date +%A && date +%d && date +%u'
alias fday='mkdir "$(date +%j)" && cd "$(date +%j)"'
alias mday='vim ./"$(date +%j)".md'
alias fj='vim ./"$(date +%F)".md'
alias week='date +%V'
alias month='date +%B && date +%m'
alias year='date +%Y'

# macos find what is listening
# sudo lsof -i -P | grep LISTEN | grep :$PORT

# django
alias dr='python manage.py runserver 8000'
# flask stuff
# alias efl='export FLASK_ENV=development'
# alias eefl='echo $FLASK_ENV'
# alias fdm='flask db migrate'
# alias fdu='flask db upgrade'
alias fold='mkdir {utils,bujo,data,docs,features,results,scripts,srcrtests}'
```

- `bashrc` macos version

```sh
#!/usr/bin/env bash
case $- in
    *i*) ;;
    *) return;;
esac
shopt -s histappend
shopt -s checkwinsize
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac
force_color_prompt=yes
if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        color_prompt=yes
    else
        color_prompt=
    fi
fi
case "$TERM" in
    xterm*|rxvt*)
        PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
    *)
    ;;
esac
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
fi
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

```
