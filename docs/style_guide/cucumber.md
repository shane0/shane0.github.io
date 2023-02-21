# cucumber tests

## api

```text
project/
├── features/
│   ├── api.feature
│   ├── steps/
│   │   └── api_steps.py
│   └── environment.py
├── requirements.txt
└── README.md
```

- requirements.txt = behave requests

- `api.feature`

```gherkin
Feature: API Test

  Scenario: Get User
    Given a user with ID 123
    When I make a GET request to /users/123
    Then the response should have status code 200
    And the response should contain the user's name

  Scenario: Add User
    Given a new user with name "John Doe"
    When I make a POST request to /users
    Then the response should have status code 201
    And the response should contain the new user's ID

```

- `environment.py`

```py
import requests

def before_scenario(context, scenario):
    context.base_url = "https://api.example.com"

def after_scenario(context, scenario):
    pass

def before_step(context, step):
    pass

def after_step(context, step):
    pass

def before_feature(context, feature):
    pass

def after_feature(context, feature):
    pass

def before_all(context):
    pass

def after_all(context):
    pass

```

## basic example

- example using python

```gherkin
Feature: Test function

  Scenario: Add two numbers
    Given two numbers x and y
    When I call the function with x and y
    Then the result should be the sum of x and y
```

```py
from behave import *
from mymodule import function

@given("two numbers x and y")
def step_impl(context):
    context.x = 2
    context.y = 3

@when("I call the function with x and y")
def step_impl(context):
    context.result = function(context.x, context.y)

@then("the result should be the sum of x and y")
def step_impl(context):
    expected_result = context.x + context.y
    assert context.result == expected_result, f"Expected {expected_result}, but got {context.result}"

```

```sh
project/
├── features/
│   └── test_function.feature
├── steps/
│   └── test_function_steps.py
├── mymodule.py
└── behave.ini
```

<iframe width="710" height="399" src="https://www.youtube.com/embed/VwvrGfWmG_U" title="Introducing Example Mapping" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
