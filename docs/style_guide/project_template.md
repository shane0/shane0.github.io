---
tags:
  - template
---

# documentaiton templates

- see [gitlab workflow](gitlab.md)

## upload

```sh
# upload.sh
#!/usr/bin/env bash
git init
git add .
git commit -m 'setup folder'
git push --set-upstream git@gitlab.com:shane0/project.git master
git remote add origin git@gitlab.com:shane0/project
start git@gitlab.com:shane0/project
```

## folders

```sh
#!/bin/bash
# make folders using gitlab folder structure
# https://docs.gitlab.com/ee/development/documentation/styleguide/#folder-structure-overview


mkdir -p ./doc/{user,administration,api,development,legal,install,update,topics}
touch ./doc/index.md
touch ./doc/user
touch ./doc/administration/index..md
touch ./doc/api/index.md
touch ./doc/development/index.md
touch ./doc/legal/index.md
touch ./doc/install/index.md
touch ./doc/update/index.md
touch ./doc/topics/index.md
```

## concept

```text
# Title (a noun, like "Widgets")

A paragraph or two that explains what this thing is and why you would use it.

If you start to describe another concept, stop yourself.
Each concept should be about **one concept only**.

If you start to describe **how to use the thing**, stop yourself.
Task topics explain how to use something, not concept topics.

Do not include links to related tasks. The navigation provides links to tasks.
```

## task

```text
# Title (starts with an active verb, like "Create a widget" or "Delete a widget")

Do this task when you want to...

Prerequisites (optional):

- Thing 1
- Thing 2
- Thing 3

To do this task:

1. Location then action. (Go to this menu, then select this item.)
1. Another step.
1. Another step.

Task result (optional). Next steps (optional).
```

- task example

```text
# Create an issue

Create an issue when you want to track bugs or future work.

Prerequisites:

- You must have at least the Developer role for the project.

To create an issue:

1. On the top bar, select **Main menu > Projects** and find your project.
1. On the left sidebar, select **Issues > List**.
1. In the upper-right corner, select **New issue**.
1. Complete the fields. (If you have reference content that lists each field, link to it here.)
1. Select **Create issue**.

The issue is created. You can view it by going to **Issues > List**.
```

## reference

```text
# Title (a noun, like "Pipeline settings" or "Administrator options")

Introductory sentence.

| Setting | Description |
|---------|-------------|
| **Name** | Descriptive sentence about the setting. |
```

## Troubleshooting

```text
## Troubleshooting

When working with <x feature>, you might encounter the following issues.

### The error message or a description of it

You might get an error that states <error message>.

This issue occurs when...

The workaround is...

```

## tutorial

```text
# Title (starts with "Tutorial:" followed by an active verb, like "Tutorial: Create a website")

A paragraph that explains what the tutorial does, and the expected outcome.

To create a website:

1. [Do the first task](#do-the-first-task)
1. [Do the second task](#do-the-second-task)

Prerequisites (optional):

- Thing 1
- Thing 2
- Thing 3

## Do the first task

To do step 1:

1. First step.
1. Another step.
1. Another step.

## Do the second task

Before you begin, make sure you have [done the first task](#do-the-first-task).

To do step 2:

1. First step.
1. Another step.
1. Another step.

```
