# todo cli

```text
-8<- "todocli/todo.txt"
```

```text
-8<- "todocli/done.txt"
```

- [todo cli repo](https://github.com/todotxt/todo.txt-cli)

## how I use todo cli

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
