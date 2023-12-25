---
tags:
  - cucumber
  - python
  - software testing 
  - javascript
---
# python cucumber api test with mock

```text
project/
  features/
    api.feature
    steps/
      __init__.py
      api_steps.py
  requirements.txt
  .gitlab-ci.yml
```

> feature

```gherkin
Feature: Test API endpoint
  As a user
  I want to verify that the API returns the expected data

  Scenario: Get user by ID
    Given a user with ID 123
    When I make a GET request to "users/123"
    Then the response should have status code 200
    And the response should contain the user's name and ID
    | name       | id   |
    | John Doe   | 123  |

```

> steps

import requests
from behave import *
from unittest.mock import patch

@given("a user with ID {user_id}")
def step_impl(context, user_id):
    context.user_id = user_id

@when("I make a GET request to {endpoint}")
def step_impl(context, endpoint):
    url = f"{context.base_url}/{endpoint}"
    with patch("requests.get") as mock_get:
        mock_get.return_value.status_code = 200
        mock_get.return_value.json.return_value = {
            "id": context.user_id,
            "name": "John Doe",
            "email": "johndoe@example.com"
        }
        response = requests.get(url)
        context.response = response

@then("the response should have status code {status_code}")
def step_impl(context, status_code):
    assert context.response.status_code == int(status_code)

@then("the response should contain the user's name and ID")
def step_impl(context):
    expected = {"name": "John Doe", "id": context.user_id}
    actual = context.response.json()
    assert all(actual[k] == v for k, v in expected.items())

```
