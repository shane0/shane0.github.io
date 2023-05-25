#!/usr/bin/env bash
# pandoc -t revealjs -s -o ./slides/daily.html ./slides/daily.md -V revealjs-url=https://unpkg.com/reveal.js@3.9.2/ -V theme=solarized
pandoc -t revealjs -s -o ./slides/daily.html ./slides/daily.md -V revealjs-url=https://unpkg.com/reveal.js@3.9.2/ -V theme=moon
cp ./slides/daily.html ./docs/