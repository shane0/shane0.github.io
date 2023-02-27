---
tags:
  - style guide 
---
# active voice

In the GitLab style guide[^1] , one of the recommendations is to use active voice instead of passive voice when writing code and documentation.

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

[^1]:<https://docs.gitlab.com/ee/development/documentation/styleguide/>