# python test file contents

```text
| features/
|---- environment.py
|---- steps/
|-------- my_steps.py
|---- support/
|-------- test_data/
|------------ file1.txt
|------------ file2.txt
|-------- __init__.py
|---- __init__.py
|---- my_feature.feature
```

```gherkin
Feature: Verify Text in Files

  Scenario Outline: Verify files for specific content using regex
    Given I have a file "<filename>"
    When I search for regex pattern "<regex_pattern>"
    Then I should see content "<expected_content>"

    Examples:
    | filename | regex_pattern | expected_content |
    | file1.txt | regex1       | content1         |
    | file2.txt | regex2       | content2         |

```

```py
import re

from behave import given, when, then


@given('I have a file "{filename}"')
def step_impl(context, filename):
    context.file_path = f'support/test_data/{filename}'


@when('I search for regex pattern "{regex_pattern}"')
def step_impl(context, regex_pattern):
    with open(context.file_path, 'r') as f:
        context.file_content = f.read()
    context.matches = re.findall(regex_pattern, context.file_content)


@then('I should see content "{expected_content}"')
def step_impl(context, expected_content):
    assert expected_content in context.matches, f"Expected {expected_content} but found {context.matches}"

```

- environment.py

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

- skip schedule

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
    - if [ "$SKIP_TESTS" != "true" ]; then behave; fi
  only:
    refs:
      - schedules
  except:
    variables:
      - $SKIP_TESTS
```

You can define the $SKIP_TESTS variable in GitLab by going to your project's "Settings" page, selecting "CI/CD" from the left-hand menu, and then selecting "Variables" from the sub-menu.

From there, you can add a new variable by clicking the "Add variable" button, entering SKIP_TESTS as the key, and setting its value to true or false.

When you run your pipeline, GitLab will automatically set the $SKIP_TESTS environment variable to the value you defined in the project's variables settings.
