#!/usr/bin/env bash

# pip install mike
# mike list
# mike deploy 2023 
mike deploy --push --update-aliases 2025 latest
mike set-default 2025
# mike serve