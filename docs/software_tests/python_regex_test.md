---
tags:
  - python
  - cucumber
  - software testing 
---
# python tests with regex

## example

- `touch features/users.features`

```gherkin
Feature: Users

  Scenario: Add users
    Given the following users
      | name  | email              | password |
      | Alice | alice@example.com | secret   |
      | Bob   | bob@example.com   | password |
    When I enter the email "alice@example.com"
    Then the user should be in the list
```

- `touch features/steps/steps.py`

```py
from behave import *

@given('the following users')
def step_impl(context):
    for row in context.table:
        name = row['name']
        email = row['email']
        password = row['password']
        context.users.append({'name': name, 'email': email, 'password': password})

@when('I enter the email "{email}"')
def step_impl(context, email):
    context.email = email

@then('the user should be in the list')
def step_impl(context):
    for user in context.users:
        if user['email'] == context.email:
            return
    assert False, f"User with email '{context.email}' not found"

```

## example

- requirements.txt

```text
behave
```

```gherkin
Feature: Greeting

  Scenario: Greet the user by name
    When I enter the name "Alice"
    Then the greeting should say "Hello, Alice!"

  Scenario: Greet the user with a different name
    When I enter the name "Bob"
    Then the greeting should say "Hello, Bob!"
```

```python
from behave import *

@when('I enter the name "{name}"')
def step_impl(context, name):
    context.name = name

@then('the greeting should say "{greeting}"')
def step_impl(context, greeting):
    assert f"Hello, {context.name}!" == greeting
```
