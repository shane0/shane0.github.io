#!/usr/bin/env bash

mkdir -p features/steps
touch features/steps/file_steps.py
touch features/file.feature
mkdir logs
touch logs/{file1.txt,file2.txt}

# .
# ├── features
# │   └── step_definitions
# │       └── file_steps.py
# │   └── file.feature
# ├── logs
# │   └── file1.txt
# │   └── file2.txt
# ├── environment.py
# ├── requirements.txt
# └── .gitlab-ci.yml
