# python test with regex

```text
├── features
│   └── log_file.feature
├── environment.py
└── steps
    └── log_file.py
```

```gherkin
Feature: Test Log File

  Scenario: Check log file for specific content
    Given I have a log file "<log_file>"
    When I search for "<search_term>" in the log file
    Then I should see "<expected_content>" in the log file

    Examples:
      | log_file   | search_term | expected_content |
      | myapp.log  | ERROR      | Database failure |
      | myapp.log  | WARNING    | Out of memory     |
      | myapp2.log | INFO       | Successful login |
```

- steps.py

```py
import os
import re

from behave import given, when, then

@given('I have a log file "{log_file}"')
def step_impl(context, log_file):
    log_path = os.path.join(os.getcwd(), 'logs', log_file)
    context.log_path = log_path

@when('I search for "{search_term}" in the log file')
def step_impl(context, search_term):
    with open(context.log_path, 'r') as f:
        context.log_contents = f.read()
    context.search_results = re.findall(search_term, context.log_contents)

@then('I should see "{expected_content}" in the log file')
def step_impl(context, expected_content):
    assert expected_content in context.search_results

```

- environment.py

```py
def before_feature(context, feature):
    os.makedirs('logs', exist_ok=True)
    context.log_file = 'myapp.log'
    with open(os.path.join(os.getcwd(), 'logs', context.log_file), 'w') as f:
        f.write('INFO: Successful login\nWARNING: Out of memory\nERROR: Database failure\n')

```

## example 2

```text
| features/
|---- environment.py
|---- steps/
|-------- my_steps.py
|---- support/
|-------- test_data/
|------------ file1.txt
|-------- __init__.py
|---- __init__.py
|---- my_feature.feature

```

```gherkin
Feature: Log Verification

  Scenario: Verify logs for specific content using regex
    Given I have a log file "file1.txt"
    When I search for regex pattern "regex_pattern"
    Then I should see content "expected_content"

```

```py
import re

from behave import given, when, then


@given('I have a log file "{filename}"')
def step_impl(context, filename):
    context.log_file = f'support/test_data/{filename}'


@when('I search for regex pattern "{regex_pattern}"')
def step_impl(context, regex_pattern):
    with open(context.log_file, 'r') as f:
        context.log_content = f.read()
    context.matches = re.findall(regex_pattern, context.log_content)


@then('I should see content "{expected_content}"')
def step_impl(context, expected_content):
    assert expected_content in context.matches, f"Expected {expected_content} but found {context.matches}"

```

```py
from selenium import webdriver


def before_scenario(context, scenario):
    # This code will be executed before each scenario is run
    context.driver = webdriver.Chrome()


def after_scenario(context, scenario):
    # This code will be executed after each scenario is run
    context.driver.quit()

```

```yml
stages:
  - test

behave_test:
  image: python:3.9
  stage: test
  before_script:
    - pip install selenium
    - pip install behave
  script:
    - behave
```
