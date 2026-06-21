#!/usr/bin/env bash

# pip install mike
# mike list
# mike deploy 2023
mike deploy --push --update-aliases 2026 latest
mike set-default 2026
# mike serve