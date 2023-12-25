#!/usr/bin/env bash

# pip install mike
# mike list
# mike deploy 2023 
mike deploy --push 2023 
mike list
mike serve
# mike set-default 2024
# mike serve