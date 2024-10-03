# todo cli

- this page integrates two apps
- mkdos + todo cli
- it is a simple plain text or command line interface for task management
- [this is included in my workflow app template](https://shanenull.com/workflow/)

## this projects tasks

```text
-8<- "todocli/todo.txt"
```

```text
-8<- "todocli/done.txt"
```

## screencast

<iframe width="800" height="600" src="https://www.youtube.com/embed/_ssPIi9q4yI" title="shanenull.com workflow page + troubleshooting deployments" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

- [todo cli repo](https://github.com/todotxt/todo.txt-cli)

## todo cli relative shortcuts

- this seems obvious
- configured to use `todocli/`
- alias shortcuts that work relative to any folder
- this page you are reading embeds the todo and done file here

```sh
alias t='clear && ./todocli/todo.sh'
alias d='clear && t listpri a'
alias done='clear && cat ./todocli/done.txt'
alias snooze='clear && t listpri'
alias tedit='vim ./todocli/todo.txt'
alias tall='clear && find . -name "todo.txt" | xargs grep "+"'
alias tpri='clear && find . -name "todo.txt" | xargs grep "(A"'
alias tprib='clear && find . -name "todo.txt" | xargs grep "(B"'
alias tpric='clear && find . -name "todo.txt" | xargs grep "(C"'
alias thelp='clear && ./todocli/todo.sh shorthelp'
```
