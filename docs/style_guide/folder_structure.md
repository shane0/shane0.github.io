---
tags:
  - style guide 
---
# folder structure

gitlab doc structure[^1]

```sh
#!/bin/bash

# Create user documentation directories
mkdir -p doc/user/project
mkdir -p doc/user/group
mkdir -p doc/user/profile
mkdir -p doc/user/dashboard
mkdir -p doc/user/admin_area/settings

# Create subdirectories for admin area settings
mkdir -p doc/user/admin_area/settings/visibility_and_access_controls
mkdir -p doc/user/admin_area/settings/general
mkdir -p doc/user/admin_area/settings/preferences

# Create topic-related directories
mkdir -p doc/topics/topic_name/subtopic_name

# Create placeholder files
touch doc/user/project/index.md
touch doc/user/group/index.md
touch doc/user/profile/account.md
touch doc/user/profile/applications.md
touch doc/user/profile/emails.md
touch doc/user/dashboard/index.md
touch doc/user/admin_area/index.md
touch doc/user/admin_area/settings/index.md
touch doc/user/admin_area/settings/visibility_and_access_controls.md
touch doc/user/admin_area/settings/general.md
touch doc/user/admin_area/settings/preferences.md
touch doc/topics/topic_name/index.md
touch doc/topics/topic_name/subtopic_name/index.md
```

```text
doc/
├── topics/
│   ├── topic_name/
│   │   ├── subtopic_name/
│   │   │   └── index.md
│   │   └── index.md
│   └── index.md
├── university/         # deprecated
└── user/
    ├── admin_area/
    │   ├── index.md
    │   ├── settings/
    │   │   ├── general.md
    │   │   ├── index.md
    │   │   ├── preferences.md
    │   │   └── visibility_and_access_controls.md
    │   └── index.md
    ├── dashboard/
    │   └── index.md
    ├── group/
    │   └── index.md
    ├── profile/
    │   ├── account.md
    │   ├── applications.md
    │   ├── emails.md
    │   └── index.md
    └── project/
        └── index.md

```

> example

```text
gitlab-style-guide/
├── docs/
│   ├── img/
│   └── src/
│   └── index.md
└── theme/
    ├── assets/
    ├── layouts/
    └── index.md
```

```sh
#!/bin/bash

# Define variables for project and directory names
PROJECT_NAME="gitlab-style-guide"
DOCS_DIR_NAME="docs"
IMG_DIR_NAME="img"
SRC_DIR_NAME="src"
THEME_DIR_NAME="theme"

# Create the project directory
mkdir $PROJECT_NAME

# Create the documentation directory and subdirectories
mkdir -p $PROJECT_NAME/$DOCS_DIR_NAME/$IMG_DIR_NAME
mkdir -p $PROJECT_NAME/$DOCS_DIR_NAME/$SRC_DIR_NAME
touch $PROJECT_NAME/$DOCS_DIR_NAME/index.md

# Create the theme directory and subdirectories
mkdir -p $PROJECT_NAME/$THEME_DIR_NAME/assets
mkdir -p $PROJECT_NAME/$THEME_DIR_NAME/layouts
touch $PROJECT_NAME/$THEME_DIR_NAME/index.md

# Display success message
echo "GitLab style guide project folder structure created!"
```

[^1]:<https://docs.gitlab.com/ee/development/documentation/site_architecture/folder_structure.html>
