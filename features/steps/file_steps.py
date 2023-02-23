#!/usr/bin/env python3
import os
import re

from behave import given, when, then


@given('I have a log file named "{filename}"')
def step_impl(context, filename):
    context.log_file = os.path.join(os.getcwd(), 'logs', f'{filename}.txt')


@when('I check the file for "{content}"')
def step_impl(context, content):
    with open(context.log_file, 'r') as f:
        context.file_contents = f.read()


@then('the file should contain "{content}"')
def step_impl(context, content):
    regex = re.compile(content)
    assert regex.search(context.file_contents) is not None, f"Expected '{content}' in file '{context.log_file}'"
