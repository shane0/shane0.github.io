---
tags:
  - bullet journal
  - bujo 
  - pipelines 
---
# bujo python script with pipeline

- here's a python script to create a bullet journal folder structure for the year
- and these files, with headers in the file
- and pipeline options to run it once

```text
2023/
├── 01/
│   ├── 01.md
│   ├── collections.md
│   ├── future.md
│   ├── index.md
│   └── next.md
├── 02/
│   ├── 02.md
│   ├── collections.md
│   ├── future.md
│   ├── index.md
│   └── next.md
├── 03/
│   ├── 03.md
│   ├── collections.md
│   ├── future.md
│   ├── index.md
│   └── next.md
...
├── 12/
│   ├── 12.md
│   ├── collections.md
│   ├── future.md
│   ├── index.md
│   └── next.md
└── 2023.md
```

## bujo python script with pipeline

```yml
my_job:
  script:
    - echo "Running job"
  when:
    manual
    variables:
      - $RUN_ONCE
```

```yml
variables:
  RUN_ONCE: "true"

my_job:
  script:
    - echo "This job will run only once"
  rules:
    - if: '$RUN_ONCE == "true"'

```

```yml
build:
  script:
    - python bujo_setup.py
```

```py
import os
from datetime import datetime

def bujo_setup():
    year = str(datetime.now().year)
    months = ['January', 'February', 'March', 'April', 'May', 'June',
              'July', 'August', 'September', 'October', 'November', 'December']
    for month in months:
        month_dir = os.path.join(year, month)
        os.makedirs(month_dir, exist_ok=True)
        files = ['index.md', 'future.md', 'next.md', 'collections.md']
        for file in files:
            file_path = os.path.join(month_dir, file)
            with open(file_path, 'w') as f:
                f.write(f"# {month} {file.split('.')[0]}")

    year_file_path = os.path.join(year, f"{year}.md")
    with open(year_file_path, 'w') as f:
        f.write(f"# {year}")

if __name__ == "__main__":
    bujo_setup()
```
