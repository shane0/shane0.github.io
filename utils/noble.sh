#!/usr/bin/env bash
# pandoc -t revealjs -s -o ./slides/daily.html ./slides/daily.md -V revealjs-url=https://unpkg.com/reveal.js@3.9.2/ -V theme=solarized
rm  ./docs/noble.html
pandoc -t revealjs -s -o ./slides/noble.html ./slides/noble.md -V revealjs-url=https://unpkg.com/reveal.js@3.9.2/ -V theme=solarized
cp ./slides/noble.html ./docs/