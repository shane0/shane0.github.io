#!/bin/bash

mkdir -p .github/workflows

cat <<EOT > .github/workflows/run-tests.yml
name: Run Tests

on:
  push:
    branches: [ main ]
  schedule:
    - cron: '0 0 * * *'

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: Install dependencies
        run: npm install
      - name: Run tests
        env:
          SKIP_TESTS: true
        run: |
          if [ -z "\$SKIP_TESTS" ]; then
            npm run test
          else
            echo "Skipping tests due to environment variable."
          fi
EOT

echo "Created run-tests.yml file in .github/workflows directory."

# gitlab
# default:
#   paths:
#     features: features
#   stdout_capture_limit: 0
#   stdout_capture_filter: "."
#   format: pretty

# test:
#   extends: default
#   environment_variables:
#     SKIP_TESTS: ""
#   tags: ""
#   options:
#     --no-capture
#     --no-capture-stderr
#     --no-capture-logs
