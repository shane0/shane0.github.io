# GitLab has a comprehensive style guide

GitLab has a comprehensive style guide that covers various aspects of software development, including coding, testing, and documentation. Here are some key points from the GitLab style guide:

- Code formatting: GitLab recommends using the standard formatting for the programming language you are using. It also suggests using tools like RuboCop, ESLint, or Prettier to automate formatting.
- Naming conventions: GitLab suggests using descriptive and meaningful names for variables, functions, and classes. It also recommends using camelCase for variables and functions in JavaScript, and snake_case for variables and functions in Ruby.
- Comments: GitLab advises developers to write comments that explain why the code is written in a certain way, rather than what the code does. It also recommends avoiding unnecessary comments, such as commenting out code instead of deleting it.
- Testing: GitLab suggests writing automated tests for your code, including unit tests, integration tests, and end-to-end tests. It also recommends using a testing framework like RSpec or Jest.
- Documentation: GitLab recommends writing documentation for your code, including README files, inline comments, and API documentation. It also suggests using tools like Swagger to generate API documentation automatically.
- Security: GitLab advises following secure coding practices, such as avoiding hard-coded passwords, using secure libraries, and validating user input.
- Code reviews: GitLab recommends using code reviews to ensure code quality and catch potential bugs before they make it into production.

These are just a few key points from the GitLab style guide. For more detailed information, you can check out the GitLab handbook on their website.

## active voice

In the GitLab style guide, one of the recommendations is to use active voice instead of passive voice when writing code and documentation.

Using active voice makes the code and documentation more clear and easier to understand. In active voice, the subject of the sentence performs the action, while in passive voice, the subject receives the action. For example, instead of writing "The function was called by the user," you can write "The user called the function."

Here are a few more examples of active voice:

- Use "The function returns" instead of "A return value is provided by the function."
- Use "We tested the application" instead of "The application was tested by us."
- Use "The system handles errors" instead of "Errors are handled by the system."
- By using active voice, you can create more concise and direct statements, which can help improve the readability and maintainability of your code and documentation.

Detecting passive voice with a regular expression can be a challenging task because it requires analyzing the syntactic structure of the sentence. However, there are some common patterns that you can look for to identify passive voice.

One approach is to look for forms of the verb "to be" (such as "is," "are," "was," "were," etc.) followed by a past participle (such as "called," "tested," "handled," etc.). Here is an example regular expression that looks for passive voice in a sentence:

```sh
\b(be|am|is|are|was|were|been|being)\b\s+\w+\s+\w+ed\b
```

This regular expression matches a word boundary (\b), followed by any form of "to be" (be, am, is, are, was, were, been, or being), followed by one or more whitespace characters (\s+), followed by one or more word characters (\w+), followed by a past participle ending in "ed" (\w+ed\b).

To use this regular expression in practice, you can search for matches in your code or documentation and manually review the results to determine if they represent passive voice. Keep in mind that not all matches will necessarily be passive voice, and some instances of passive voice may not match this pattern. Therefore, it's important to use your judgment and understanding of English grammar when interpreting the results.

Detecting passive voice using a sed script is more complicated than using a regular expression because it requires analyzing the context of the sentence. However, you can still use sed to perform some basic checks and highlight lines that might contain passive voice.

Here's an example sed script that searches for lines containing forms of "to be" followed by a past participle and prints the line number:

```sh
#!/bin/bash
sed -n '/\b\(be\|am\|is\|are\|was\|were\|been\|being\)\b\s\+\w\+\s\+\w\+ed\b/{=;}' $1
```

This script takes a filename as a command-line argument and uses sed to search for lines that match the regular expression pattern described above. The n flag tells sed to suppress output by default, while the search pattern enclosed in slashes (/pattern/) tells sed to look for lines that match the regular expression.

The = command tells sed to print the line number for any lines that match the pattern. The semicolon (;) separates multiple commands on the same line.

To run this script, save it to a file (e.g., passive-voice-sed.sh) and make it executable using chmod +x passive-voice-sed.sh. Then, run the script with the filename as an argument:

```sh
./passive-voice-sed.sh myfile.txt
```

This will print a list of line numbers that might contain passive voice. You can then review these lines manually to determine if they need to be revised. Keep in mind that this script is not foolproof and may produce false positives or miss some instances of passive voice, so it's important to use your judgment and understanding of English grammar when interpreting the results.

To find line numbers containing passive voice using grep, you can combine it with the cat and nl commands to display the line numbers of matching lines. Here's an example command:

```sh
grep -nE '\b(be|am|is|are|was|were|been|being)\b\s+\w+\s+\w+ed\b' myfile.txt | nl
```

This command searches for lines in myfile.txt that match the regular expression pattern for passive voice. The -n flag tells grep to include line numbers in its output, and the -E flag enables extended regular expressions. The nl command adds line numbers to the output of grep.

The output of this command will be a list of line numbers and matching lines containing passive voice. You can then review these lines manually to determine if they need to be revised.

Keep in mind that this command is not foolproof and may produce false positives or miss some instances of passive voice, so it's important to use your judgment and understanding of English grammar when interpreting the results.

> python module

```py
import re
import os


def find_passive_voice(directory):
    """
    Find passive voice in all files in the specified directory.
    Return a list of tuples containing the file path and line numbers where passive voice is found.
    """
    # Specify the regular expression for passive voice
    passive_voice_regex = r'\b\w+\s+was|were\s+\w+ed\b'

    # Create an empty list to store the results
    results = []

    # Traverse the directory and search for passive voice in each file
    for root, dirs, files in os.walk(directory):
        for file in files:
            if file.endswith('.txt'):  # Specify the file extension to search
                file_path = os.path.join(root, file)
                with open(file_path, 'r') as text_file:
                    for line_number, line in enumerate(text_file):
                        if re.search(passive_voice_regex, line):
                            # Append the file path and line number to the results list
                            results.append((file_path, line_number + 1))

    return results

# Find passive voice in the specified directory
directory = '/path/to/directory'
results = find_passive_voice(directory)

# Write the results to an output file
with open('passive_voice.md', 'w') as f:
    for file_path, line_number in results:
        f.write(f'{file_path}:{line_number}\n')
```

## present tense

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

## jargon

> regex

```sh
r'\b[A-Z]{2,}\b'
```

> python

```py
import re

text = "The CPU is a critical component of the PC. It processes data using an ALU and stores it in the RAM."
pattern = r'\b[A-Z]{2,}\b'
matches = re.findall(pattern, text)

print(matches)
```

```sh
grep -rno '\b[A-Z]{2,}\b' /path/to/directory
```

- r: Search recursively in all files under the specified directory.
- n: Print the line number where the match occurs.
- o: Only print the matched part of the line, rather than the whole line.

```sh
sed -n '/\b[A-Z]{2,}\b/=' filename.txt
```

- -n: Suppresses the default behavior of sed to print every line.
- /\b[A-Z]{2,}\b/: Matches lines containing the regular expression \b[A-Z]{2,}\b.
- =: Prints the line number of the matched lines.

> python

```sh
python jargon_detector.py /path/to/folder
```

```py
import os
import re

def detect_jargon(folder):
    # Compile the regular expression for detecting jargon
    pattern = re.compile(r'\b[A-Z]{2,}\b')

    # Open the output file for writing
    with open('jibberjabber.md', 'w') as outfile:
        for root, dirs, files in os.walk(folder):
            for filename in files:
                # Ignore non-text files
                if not filename.endswith('.txt'):
                    continue

                # Construct the full path to the file
                filepath = os.path.join(root, filename)

                # Open the file for reading
                with open(filepath, 'r') as infile:
                    for linenum, line in enumerate(infile, start=1):
                        # Search for jargon in the line
                        matches = pattern.findall(line)
                        if matches:
                            # Write the match to the output file
                            outfile.write(f'{filepath}:{linenum} - {", ".join(matches)}\n')
```

```py
from jargon_detector import detect_jargon

detect_jargon('/path/to/folder')

```

> with google it link


```py
import os
import re
from urllib.parse import quote_plus

def detect_jargon(folder):
    # Compile the regular expression for detecting jargon
    pattern = re.compile(r'\b[A-Z]{2,}\b')

    # Open the output file for writing
    with open('jibberjabber.md', 'w') as outfile:
        for root, dirs, files in os.walk(folder):
            for filename in files:
                # Ignore non-text files
                if not filename.endswith('.txt'):
                    continue

                # Construct the full path to the file
                filepath = os.path.join(root, filename)

                # Open the file for reading
                with open(filepath, 'r') as infile:
                    for linenum, line in enumerate(infile, start=1):
                        # Search for jargon in the line
                        matches = pattern.findall(line)
                        if matches:
                            # Generate a Google search link for each match
                            links = [f'[Google search](https://www.google.com/search?q={quote_plus(match)})'
                                     for match in matches]
                            # Write the match and link to the output file
                            outfile.write(f'{filepath}:{linenum} - {", ".join(matches)} ({", ".join(links)})\n')
```