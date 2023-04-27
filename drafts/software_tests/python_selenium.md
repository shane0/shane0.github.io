---
tags:
  - python
  - selenium 
  - software testing 
---
# python cucumber test

```text
project/
│
├── features/
│   ├── steps/
│   │   └── steps.py
│   └── files.feature
│
└── environment.py
```

- files.feature

```gherkin
Feature: Files

  Scenario: Search for regex in files
    Given a file named "file1.txt" with content matching "other"
    Given a file named "file2.txt" with content matching "content$"
    When I search for the regex "content" in each file
    Then the following files should match
      | filename  | regex    |
      | file1.txt | other    |
      | file2.txt | content$ |
```

- steps.py

```py
import re

from behave import *

@given('a file named "{filename}" with content matching "{regex}"')
def step_impl(context, filename, regex):
    with open(filename, 'w') as f:
        f.write('Some content\nSome other content\nAnd some more content')
    with open(filename) as f:
        content = f.read()
        assert re.search(regex, content) is not None, f"Content does not match regex: {regex}"
    context.files.append({'filename': filename, 'content': content})

@when('I search for the regex "{regex}" in each file')
def step_impl(context, regex):
    for file in context.files:
        if re.search(regex, file['content']) is None:
            assert False, f"Regex '{regex}' not found in file '{file['filename']}'"

@then('the following files should match')
def step_impl(context):
    for row in context.table:
        filename = row['filename']
        regex = row['regex']
        found = False
        for file in context.files:
            if file['filename'] == filename and re.search(regex, file['content']) is not None:
                found = True
                break
        assert found, f"File '{filename}' with content matching regex '{regex}' not found"
```

- environment.py

```py
from selenium import webdriver

def before_all(context):
    # Set up the Selenium webdriver
    context.driver = webdriver.Chrome()

def after_all(context):
    # Clean up the Selenium webdriver
    context.driver.quit()

```

```py
from selenium import webdriver

def before_all(context):
    # Set up the Selenium webdriver
    context.driver = webdriver.Firefox()

def after_all(context):
    # Clean up the Selenium webdriver
    context.driver.quit()
```
