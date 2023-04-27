---
tags:
  - cucumber
  - software testing 
  - javascript
---

# javascript cucumber tests

## example

```sh
cucumber-js features/files.feature
```

```yml
stages:
  - test

test:
  image: node:latest
  stage: test
  script:
    - npm install
    - npm run test
  artifacts:
    paths:
      - test-results/
```

```json
{
  "scripts": {
    "test": "cucumber-js"
  }
}

// optional report

{
  "scripts": {
    "test": "cucumber-js && cucumber-html-reporter --json-report-dir=cucumber_report --output=cucumber_report/cucumber_report.html"
  }
}


```


```text
project/
│
├── features/
│   ├── step_definitions/
│   │   └── steps.js
│   └── files.feature
│
├── test-data/
│   └── file1.txt
│
├── package.json
├── node_modules/
└── package-lock.json
```

```gherkin
Feature: Testing file reading and matching

  Scenario: Read file and match content
    Given the file "file1.txt" exists
    When I read the file
    Then the file should contain the following data
      | data |
      | foo  |
      | bar  |
```

```js
const fs = require('fs');

Given('the file {string} exists', function (filename) {
  const filePath = `./test-data/${filename}`;

  if (!fs.existsSync(filePath)) {
    throw new Error(`File '${filePath}' does not exist`);
  }

  this.currentFile = filePath;
});

When('I read the file', function () {
  const fileContent = fs.readFileSync(this.currentFile, 'utf8');

  if (!fileContent) {
    throw new Error(`File '${this.currentFile}' is empty`);
  }

  this.currentFileContent = fileContent;
});

Then('the file should contain the following data', function (dataTable) {
  const expectedData = dataTable.raw().slice(1).map(row => row[0]);
  const actualData = this.currentFileContent.split('\n').map(line => line.trim());

  for (const data of expectedData) {
    if (!actualData.includes(data)) {
      throw new Error(`Expected data '${data}' not found in file '${this.currentFile}'`);
    }
  }
});
```

## example

```sh
cucumber-js --format json --format-options '{"colorsEnabled":false,"snippetInterface":"synchronous"}' > test-output.json
```

```text
project/
│
├── features/
│   ├── step_definitions/
│   │   └── steps.js
│   └── files.feature
│
├── test-data/
│   └── file1.txt
│
├── package.json
├── node_modules/
└── package-lock.json
```

```gherkin
Feature: Verify file content using regex

  Scenario Outline: Verify file content
    Given the file "<filename>" exists
    When I read the file
    Then the content should match "<content_regex>"

    Examples:
      | filename | content_regex |
      | file1.txt | Hello, (.*)!  |
      | file2.txt | (.*) World!   |
```

```js
const fs = require('fs');

Given('the file {string} exists', function (filename) {
  if (!fs.existsSync(filename)) {
    throw new Error(`File '${filename}' does not exist`);
  }
});

When('I read the file', function () {
  // Nothing to do here, file contents will be read in next step
});

Then('the content should match {string}', function (content_regex) {
  const fileContent = fs.readFileSync(this.currentFile, 'utf-8');
  const matches = fileContent.match(new RegExp(content_regex));

  if (!matches) {
    throw new Error(`File content does not match '${content_regex}'`);
  }
});

```
