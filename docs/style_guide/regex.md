---
tags:
  - regex 
  - grep
  - bash 
---
# regex

## between

- Here's a regular expression to capture
- anything after "000," and anything before ",111"
- in the string "000, this is before and this i want to capture and this is after ,111"
- `(?<=000,).*?(?=,111)`

## jargon detector

To match abbreviations that are often used as jargon, you could use a regular expression that looks for sequences of uppercase letters with optional periods in between:

```sh
[A-Z](?:\.[A-Z])+\.?
```

Explanation:

- [A-Z] matches any uppercase letter
- (?:\.[A-Z])+ is a non-capturing group that matches a period followed by an uppercase letter, one or more times
- \. matches a period
- \.? matches zero or one period at the end, to account for cases where the abbreviation is at the end of a sentence and followed by a period.
- This regular expression should match common abbreviations such as "CEO", "U.S.", "DNA", etc. However, it may miss some less common or specialized abbreviations, and may also capture some non-jargon words that happen to be written in all uppercase letters.

## timestamps

Here's a regular expression that matches timestamps in common formats such as "2022-02-04 14:15:16", "2022/02/04 14:15:16", "2022-02-04T14:15:16Z", etc.:

```sh
\d{4}([-/])\d{2}\1\d{2}[T ]\d{2}:\d{2}:\d{2}(Z|[-+]\d{2}:\d{2})?
```

Explanation:

- \d{4} matches four digits for the year
- ([-/])\d{2}\1\d{2} matches a separator (either "-" or "/") followed by two digits for the month, another separator that matches the first separator, and two digits for the day
- [T ] matches either a "T" or a space character, which separates the date from the time
- \d{2}:\d{2}:\d{2} matches two digits for the hour, minute, and second respectively, separated by colons
- (Z|[-+]\d{2}:\d{2})? optionally matches either the letter "Z" to indicate a UTC timezone, or a plus or minus sign followed by two digits for the offset from UTC, separated by a colon.

Note that this regular expression assumes that the timestamp is in the correct format, but does not validate whether the date and time are valid or make logical sense.

## verbs

Here's a simple regular expression that captures verbs:

```sh
\w+ing\b|\b\w+ed\b
```

Explanation:

- \w+ing\b matches any word character one or more times, followed by "ing" at the end of a word boundary (e.g. "running", "singing", "dancing").
- \b\w+ed matches any word character one or more times, preceded by a word boundary and followed by "ed" (e.g. "walked", "jumped", "played").

This regular expression may not capture all verbs, particularly irregular verbs that do not follow the standard "-ed" or "-ing" patterns. However, it should capture many common verbs in their past tense or present participle forms.

## csv

Assuming the CSV file has a header row with comma-separated field names, here's a regular expression that matches the header row:

```sh
^([^\n,]+)(,[^\n,]+)*$
```

Explanation:

- ^ matches the start of the string (i.e., the beginning of the header row)
- ([^\n,]+) matches one or more characters that are not commas or line breaks, capturing the field name in a group
- (,[^\n,]+)* matches zero or more comma-separated field names, where each field name consists of a comma followed by one or more non-comma and non-line break characters
- $ matches the end of the string (i.e., the end of the header row)

You can use this regular expression to extract the field names from the header row of a CSV file. Note that this regular expression assumes that the header row is a single line and that there are no commas or line breaks within the field names. If your CSV file has different formatting or field name rules, you may need to modify the regular expression accordingly.

### py csv

You can use the built-in csv module in Python to parse a CSV file. Here's an example code snippet that reads a CSV file named example.csv and prints its contents:

```py
import csv

with open('example.csv', newline='') as csvfile:
    reader = csv.reader(csvfile, delimiter=',', quotechar='"')
    for row in reader:
        print(', '.join(row))
```

This code opens the file example.csv using a with statement, which automatically closes the file after reading. It then creates a csv.reader object, which reads the CSV file and separates the fields using commas. The quotechar argument specifies that fields within double quotes should be treated as a single field, even if they contain commas. Finally, the code iterates over each row of the CSV file and prints its contents as a comma-separated string.

You can modify this code to perform other operations on the CSV data, such as storing it in a database or performing calculations on the fields. The csv module in Python provides a flexible and easy-to-use interface for working with CSV files.

### js csv

To parse a CSV file in JavaScript, you can use the csv-parser package, which is available through npm. Here's an example code snippet that reads a CSV file named example.csv and logs its contents to the console:

```js
const csv = require('csv-parser')
const fs = require('fs')

fs.createReadStream('example.csv')
  .pipe(csv())
  .on('data', (row) => {
    console.log(row)
  })
  .on('end', () => {
    console.log('CSV file successfully processed.')
  })
```

This code first imports the csv-parser package and the built-in fs module in Node.js. It then creates a readable stream from the example.csv file using fs.createReadStream. The pipe method is used to pass the stream through the csv() function, which parses the CSV data and returns an object for each row.

The on('data', ...) method is used to handle each row of the CSV file, logging it to the console in this case. Finally, the on('end', ...) method is used to indicate that the CSV file has been fully processed.

You can modify this code to perform other operations on the CSV data, such as storing it in a database or performing calculations on the fields. The csv-parser package in JavaScript provides a flexible and easy-to-use interface for working withgg CSV files.

## grep logs

| Command | Description |
| --- | --- |
| `grep "search_string" file.log` | Search for a specific string in a file |
| `grep "search_string" *.log` | Search for a string in multiple files |
| `grep -n "search_string" file.log` | Search for a string and display line numbers |
| `grep -o "search_string" file.log` | Search for a string and display only matching lines (without context) |
| `grep -C 3 "search_string" file.log` | Search for a string and display surrounding lines |
| `grep -B 2 "search_string" file.log` | Search for a string and display lines before the matching line |
| `grep -A 2 "search_string" file.log` | Search for a string and display lines after the matching line |
| `grep -i "search_string" file.log` | Search for a string case-insensitively |
| `grep -r "search_string" /path/to/directory/` | Search for a string recursively in a directory and subdirectories |

| Command | Description |
| --- | --- |
| `grep -E "regex_pattern" file.log` | Search for lines that contain a regular expression |
| `grep -E "^\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}" file.log` | Search for lines that match a specific timestamp format |
| `grep -E "(DEBUG\|INFO\|WARNING\|ERROR\|CRITICAL)" file.log` | Search for lines that match a specific log level |
| `grep -E "regex_pattern.*\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}" file.log` | Search for lines that contain a regular expression and a specific timestamp |
| `grep -E "regex_pattern.*(DEBUG\|INFO\|WARNING\|ERROR\|CRITICAL)" file.log` | Search for lines that contain a regular expression and a specific log level |
| `grep -E "^\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}.*(DEBUG\|INFO\|WARNING\|ERROR\|CRITICAL)" file.log` | Search for lines that match a specific timestamp and log level |
| `grep -v "ERROR" file.log` | Search for lines that do not match a specific log level |

| Command | Description |
| --- | --- |
| `ls` | List directory contents |
| `cd` | Change directory |
| `pwd` | Print working directory |
| `mkdir` | Make a new directory |
| `rmdir` | Remove a directory |
| `cp` | Copy files and directories |
| `mv` | Move or rename files and directories |
| `rm` | Remove files and directories |
| `touch` | Create an empty file |
| `cat` | Concatenate and display files |
| `less` | Display contents of a file one page at a time |
| `tail` | Display the last lines of a file |
| `head` | Display the first lines of a file |
| `grep` | Search for a pattern in a file |
| `find` | Search for files in a directory hierarchy |
| `ps` | Report a snapshot of current processes |
| `kill` | Send a signal to a process |
| `sudo` | Execute a command as a superuser |
| `chmod` | Change the permissions of files and directories |
| `chown` | Change the owner and group of files and directories |
| `top` | Display system resource usage |
| `df` | Report file system disk space usage |
| `du` | Estimate file space usage |
| `tar` | Archive files into a tarball |
| `zip` | Archive files into a zip file |
| `unzip` | Unzip files from a zip file |

| Command | Description |
| --- | --- |
| `grep pattern file` | Search for a pattern in a file |
| `grep -r pattern directory` | Search for a pattern recursively in a directory |
| `find directory -name pattern` | Search for files in a directory hierarchy by name |
| `find directory -type f -mtime +7 -exec rm {} \;` | Delete files older than 7 days in a directory |
| `du -h --max-depth=1 directory` | Display the disk usage of files and directories in a directory |
| `tar -cvzf archive.tar.gz directory` | Create a gzip compressed tarball of a directory |
| `tar -xvzf archive.tar.gz` | Extract a gzip compressed tarball |
| `tail -f logfile` | Display the last lines of a log file and follow the file as it grows |
| `ps -ef | grep processname` | Find a running process by name |
| `kill -9 pid` | Kill a process by PID |
| `lsof -i tcp:port` | List all processes listening on a specific TCP port |
| `netstat -tuln` | List all listening TCP and UDP ports |
| `curl ifconfig.me` | Display the public IP address of the machine |
| `wget -O /dev/null http://speedtest.wdc01.softlayer.com/downloads/test10.zip` | Test network bandwidth by downloading a file |
| `history | awk '{print $2}' | sort | uniq -c | sort -rn | head` | Show the most commonly used commands from Bash history |

## sql

| Query | Description |
| --- | --- |
| `SELECT column1, column2 FROM table` | Select specific columns from a table |
| `SELECT * FROM table` | Select all columns from a table |
| `SELECT column1, column2 FROM table WHERE condition` | Select specific columns from a table based on a condition |
| `SELECT column1, column2 FROM table ORDER BY column1 ASC, column2 DESC` | Select specific columns from a table and order the results by column1 ascending and column2 descending |
| `SELECT COUNT(*) FROM table` | Count the number of rows in a table |
| `SELECT AVG(column) FROM table` | Calculate the average value of a column in a table |
| `SELECT SUM(column) FROM table` | Calculate the sum of values in a column in a table |
| `SELECT MAX(column) FROM table` | Find the maximum value in a column in a table |
| `SELECT MIN(column) FROM table` | Find the minimum value in a column in a table |
| `SELECT column1, COUNT(*) FROM table GROUP BY column1` | Group rows in a table by column1 and count the number of rows in each group |
| `SELECT column1, AVG(column2) FROM table GROUP BY column1` | Group rows in a table by column1 and calculate the average value of column2 in each group |
| `SELECT column1, column2 FROM table1 JOIN table2 ON table1.column = table2.column` | Join two tables on a common column |
| `SELECT column1, column2 FROM table1 LEFT JOIN table2 ON table1.column = table2.column` | Join two tables and include all rows from the left table, even if there is no matching row in the right table |
| `SELECT column1, column2 FROM table1 RIGHT JOIN table2 ON table1.column = table2.column` | Join two tables and include all rows from the right table, even if there is no matching row in the left table |
| `INSERT INTO table (column1, column2) VALUES (value1, value2)` | Insert a new row into a table |
| `UPDATE table SET column1 = value1, column2 = value2 WHERE condition` | Update rows in a table based on a condition |
| `DELETE FROM table WHERE condition` | Delete rows from a table based on a condition |

## log levels

```sh
\b(DEBUG|INFO|WARN|ERROR)\b
```

If you want to capture the log level along with the message that follows it, you can modify the regular expression I provided earlier by adding a capture group for the message:

```sh
\b(DEBUG|INFO|WARN|ERROR)\b\s*(.*)
```

Explanation:

- \b(DEBUG|INFO|WARN|ERROR)\b matches one of the four log level options inside a capture group, with word boundaries to ensure it's not part of a longer word
- \s* matches zero or more whitespace characters
- (.*) matches the message that follows the log level, which can contain any characters except for line breaks, and captures it in a separate group

You can use this regular expression to find log levels along with their corresponding messages in log files or other text that follows this format. Note that this regular expression assumes that the log levels are in uppercase letters. If log levels are in lowercase or mixed case, you can modify the regular expression accordingly.

## json

you can write a regular expression that matches basic JSON syntax, but this will not be able to handle more complex cases like nested objects, arrays, or escaped characters:

```sh
\{\s*("[^"]*"\s*:\s*(?:"[^"]*"|\d+)\s*,?\s*)*\}
```

Explanation:

- \{ matches a left curly brace
- \s* matches zero or more whitespace characters
- ("[^"]*"\s*:\s*(?:"[^"]*"|\d+)\s*,?\s*)* is a group that matches zero or more key-value pairs separated by commas. Each key-value pair consists of a string (in quotes) followed by a colon, followed by either another string in quotes or a number.
- "[^"]*" matches a string in quotes
- \s*:\s* matches a colon with optional whitespace before and after
- (?:"[^"]*"|\d+) matches either a string in quotes or a number
- \s*,?\s* matches optional whitespace followed by an optional comma, followed by optional whitespace
- \} matches a right curly brace.

This regular expression should match simple JSON structures like {"key": "value", "number": 123}, but it will not be able to handle more complex JSON structures with nested objects or arrays, or escaped characters inside strings.

## winston format

```sh
^\[(\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}(\.\d{3})?)\]\s*(\w+)\s*:\s*(.*)$
```

Explanation:

- ^ matches the start of the line
- \[(\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}(\.\d{3})?)\] matches a timestamp in square brackets. The timestamp can be in the format "YYYY-MM-DD HH:mm:ss" with an optional fraction of a second.
- \s* matches zero or more whitespace characters
- (\w+) matches one or more word characters, which represents the log level (e.g. "info", "warn", "error")
- \s*:\s* matches a colon surrounded by optional whitespace characters
- (.*) matches the JSON message itself, which can contain any characters except for line breaks
- $ matches the end of the line

This regular expression captures the timestamp, log level, and JSON message as separate capture groups, which can then be parsed further. Note that this regular expression assumes that the w logs are in a consistent format and do not contain additional information or non-JSON messages.

```js
const logRegex = /^\[(\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}(\.\d{3})?)\]\s*(\w+)\s*:\s*(.*)$/;

function parseWinstonLog(logString) {
  const match = logString.match(logRegex);
  if (!match) {
    return null; // not a valid log
  }
  const timestamp = match[1];
  const logLevel = match[3];
  const message = match[4];
  let data;
  try {
    data = JSON.parse(message);
  } catch (e) {
    data = message;
  }
  return {
    timestamp,
    logLevel,
    data
  };
}

// Example usage
const logString = '[2023-02-04 10:00:00.123] info: {"message": "Hello, world!"}';
const parsedLog = parseWinstonLog(logString);
console.log(parsedLog);
// Output: { timestamp: '2023-02-04 10:00:00.123', logLevel: 'info', data: { message: 'Hello, world!' } }
```
