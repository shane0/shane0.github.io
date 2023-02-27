---
tags:
  - style guide 
---
# present tense

from the gitlab style guide[^1]

> regex

To find future tense using a regular expression, you can look for auxiliary verbs like "will" or "shall" followed by a base form of the verb. Here's an example regular expression:

```sh
\b(will|shall)\s+\w+\b
```

This regular expression matches a word boundary (\b), followed by either "will" or "shall" (will|shall), followed by one or more whitespace characters (\s+), followed by one or more word characters (\w+), followed by another word boundary (\b).

This pattern matches common constructions of future tense in English, such as "will go," "shall return," or "will have finished." However, keep in mind that some expressions of future tense may not include an auxiliary verb or may use alternative constructions, such as "going to" or the present continuous tense. Therefore, it's important to use your judgment and understanding of English grammar when interpreting the results.

> grep

To add line numbers to the output of grep when searching for future tense, you can use the -n flag to show line numbers and the -E flag to enable extended regular expressions. Here's an example command:

```sh
grep -nE '\b(will|shall)\s+\w+\b' myfile.txt
```

This command searches for lines in myfile.txt that match the regular expression pattern for future tense. The -n flag tells grep to include line numbers in its output, and the -E flag enables extended regular expressions.

The output of this command will be a list of line numbers and matching lines containing future tense. You can then review these lines manually to determine if they need to be revised.

Keep in mind that this command is not foolproof and may produce false positives or miss some instances of future tense, so it's important to use your judgment and understanding of English grammar when interpreting the results.

> sed

```sh
sed -n '/\b\(will\|shall\)\s\+\w\+\b/{=;}' myfile.txt
```

> python

```py
import re
import os

# Specify the directory to search
directory = '/path/to/directory'

# Specify the regular expression for future tense
future_tense_regex = r'\b(will|shall)\s+\w+\b'

# Specify the output file path
output_file = 'output.md'

# Open the output file in write mode
with open(output_file, 'w') as f:

    # Traverse the directory and search for future tense in each file
    for root, dirs, files in os.walk(directory):
        for file in files:
            if file.endswith('.txt'):  # Specify the file extension to search
                file_path = os.path.join(root, file)
                with open(file_path, 'r') as text_file:
                    for line_number, line in enumerate(text_file):
                        if re.search(future_tense_regex, line):
                            # Write the file name and line number to the output file
                            f.write(f'{file_path}:{line_number + 1}\n')
```

> module

```py
import re
import os


def find_future_tense(directory):
    """
    Find future tense in all files in the specified directory.
    Return a list of tuples containing the file path and line numbers where future tense is found.
    """
    # Specify the regular expression for future tense
    future_tense_regex = r'\b(will|shall)\s+\w+\b'

    # Create an empty list to store the results
    results = []

    # Traverse the directory and search for future tense in each file
    for root, dirs, files in os.walk(directory):
        for file in files:
            if file.endswith('.txt'):  # Specify the file extension to search
                file_path = os.path.join(root, file)
                with open(file_path, 'r') as text_file:
                    for line_number, line in enumerate(text_file):
                        if re.search(future_tense_regex, line):
                            # Append the file path and line number to the results list
                            results.append((file_path, line_number + 1))

    return results

```

```py
import future_tense

directory = '/path/to/directory'
results = future_tense.find_future_tense(directory)

# Write the results to an output file
with open('output.md', 'w') as f:
    for file_path, line_number in results:
        f.write(f'{file_path}:{line_number}\n')

```

[^1]:<https://docs.gitlab.com/ee/development/documentation/styleguide/>