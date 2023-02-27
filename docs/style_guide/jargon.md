---
tags:
  - style guide 
---
# jargon

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