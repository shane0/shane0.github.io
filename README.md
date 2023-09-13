[![pages-build-deployment](https://github.com/shane0/shane0.github.io/actions/workflows/pages/pages-build-deployment/badge.svg)](https://github.com/shane0/shane0.github.io/actions/workflows/pages/pages-build-deployment) [![Run tests](https://github.com/shane0/shane0.github.io/actions/workflows/run-tests.yml/badge.svg)](https://github.com/shane0/shane0.github.io/actions/workflows/run-tests.yml) [![markdownlint](https://github.com/shane0/shane0.github.io/actions/workflows/markdownlint.yml/badge.svg)](https://github.com/shane0/shane0.github.io/actions/workflows/markdownlint.yml)

# shane0.github.io

- <https://shane0.github.io/>
- `./push.sh` deploys using:

```sh
mkdocs gh-deploy
```

## 2023-07-02

- wip: try lexi
- wip: setup release please
- install cli

```sh
npm i release-please -g
```

- add action
- <https://github.com/marketplace/actions/release-please-action>

```sh
touch .github/workflows/release-please.ymladd action
```

## 2023-02-03

- most of this content is my conversations with chatgpt
- so far: it finds decent answers and helps me learn to ask the right questions
- <https://virtualenv.pypa.io/en/latest/user_guide.html>

```sh
pip show mkdocs-material
# fix pixelbook
pip install --upgrade mkdocs-material 
virtualenv venv
pip install mkdocs-glightbox
```

- whoops

```sh
git pull --no-ff
```
