---
tags:
  - style guide 
---
# documentation

## markdown libraries

| Library | Language | Website |
|---------|----------|---------|
| MkDocs | Python | <https://www.mkdocs.org/> |
| Docusaurus | JavaScript | <https://docusaurus.io/> |
| GitBook | Multiple Languages | <https://www.gitbook.com/> |
| Docsify | JavaScript | <https://docsify.js.org/> |
| Hugo | Go | <https://gohugo.io/> |
| Jekyll | Ruby | <https://jekyllrb.com/> |
| Gatsby | JavaScript | <https://www.gatsbyjs.com/> |
| VuePress | JavaScript | <https://vuepress.vuejs.org/> |
| Hexo | JavaScript | <https://hexo.io/> |
| Bookdown | R | <https://bookdown.org/> |

## python

| Library | Website |
|---------|---------|
| Flask | <https://flask.palletsprojects.com/en/2.1.x/> |
| PyTorch | <https://pytorch.org/docs/stable/index.html> |
| Django | <https://docs.djangoproject.com/en/3.2/> |
| FastAPI | <https://fastapi.tiangolo.com/> |
| Requests | <https://docs.python-requests.org/en/master/> |
| Scrapy | <https://docs.scrapy.org/en/latest/> |
| SQLAlchemy | <https://docs.sqlalchemy.org/en/14/> |
| Pandas | <https://pandas.pydata.org/docs/> |

## productivity

| Utility | Description | Link |
| --- | --- | --- |
| fzf | Command-line fuzzy finder used for quickly searching and opening files and directories | [Link](https://github.com/junegunn/fzf) |
| ripgrep | Line-oriented search tool that recursively searches directories for a regex pattern while respecting gitignore rules | [Link](https://github.com/BurntSushi/ripgrep) |
| bat | Syntax highlighting cat command | [Link](https://github.com/sharkdp/bat) |
| fd | Simple, fast and user-friendly alternative to find | [Link](https://github.com/sharkdp/fd) |
| tldr | Simplified and community-driven man pages | [Link](https://github.com/tldr-pages/tldr) |
| exa | Modern replacement for the `ls` command that provides a long list of information about files | [Link](https://github.com/ogham/exa) |
| entr | Runs arbitrary commands when files change | [Link](https://github.com/eradman/entr) |
| ag | Code-searching tool similar to grep but faster | [Link](https://github.com/ggreer/the_silver_searcher) |
| tokei | Code statistics generator | [Link](https://github.com/XAMPPRocky/tokei) |
| youtube-dl | Command-line program to download videos from YouTube and other video sites | [Link](https://github.com/ytdl-org/youtube-dl) |

| Command Line Utility | Description | Link |
| --- | --- | --- |
| taskwarrior | Command-line TODO list manager with a focus on GTD | [Link](https://taskwarrior.org/) |
| todo.txt-cli | Simple, todo.txt-based command line task manager | [Link](http://todotxt.org/) |
| t | Simple task tracking on the command line | [Link](https://github.com/sjl/t) |
| bugwarrior | Consolidate bugs from multiple services into one unified database | [Link](https://github.com/ralphbean/bugwarrior) |
| go-todoist | Command line tool for todoist | [Link](https://github.com/dixonwille/go-todoist) |

## command line

| Library Name | Description |
| --- | --- |
| Pandoc | A universal document converter that supports Markdown and many other markup languages |
| grip | A GitHub Readme Instant Preview tool that renders Markdown files locally before pushing them to GitHub |
| markdown-cli | A command-line interface for converting Markdown files to HTML or PDF |
| multimarkdown | A lightweight markup processor that supports many different output formats |
| marked | A fast and reliable Markdown parser and compiler |
| mdcat | A command-line utility that provides syntax highlighting and paging for Markdown files |
| mdp | A command-line based markdown presentation tool |
| cmark | A reference implementation of CommonMark, a standardized specification of Markdown syntax |

## gitlab style guide[^1]

GitLab has a comprehensive style guide that covers various aspects of software development, including coding, testing, and documentation. Here are some key points from the GitLab style guide:

- Code formatting: GitLab recommends using the standard formatting for the programming language you are using. It also suggests using tools like RuboCop, ESLint, or Prettier to automate formatting.
- Naming conventions: GitLab suggests using descriptive and meaningful names for variables, functions, and classes. It also recommends using camelCase for variables and functions in JavaScript, and snake_case for variables and functions in Ruby.
- Comments: GitLab advises developers to write comments that explain why the code is written in a certain way, rather than what the code does. It also recommends avoiding unnecessary comments, such as commenting out code instead of deleting it.
- Testing: GitLab suggests writing automated tests for your code, including unit tests, integration tests, and end-to-end tests. It also recommends using a testing framework like RSpec or Jest.
- Documentation: GitLab recommends writing documentation for your code, including README files, inline comments, and API documentation. It also suggests using tools like Swagger to generate API documentation automatically.
- Security: GitLab advises following secure coding practices, such as avoiding hard-coded passwords, using secure libraries, and validating user input.
- Code reviews: GitLab recommends using code reviews to ensure code quality and catch potential bugs before they make it into production.

These are just a few key points from the GitLab style guide. For more detailed information, you can check out the GitLab handbook on their website.

[^1]:<https://docs.gitlab.com/ee/development/documentation/styleguide/>
