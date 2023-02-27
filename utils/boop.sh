#!/usr/bin/env bash

# grep -rno '\b[A-Z]{2,}\b' docs/
sed -n '/\b[A-Z]{2,}\b/=' docs/index.md


# find /docs -type f -exec sed -i 's/replace me//g' {} +

# touch docs/pipelines.md
# touch docs/dotfiles.md

# mkdir -p features/steps
# touch features/steps/file_steps.py
# touch features/file.feature
# mkdir logs
# touch logs/{file1.txt,file2.txt}

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
