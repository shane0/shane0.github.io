---
tags:
  - software testing
  - java script
  - cucumber
---
# js api test

```gherkin
Feature: Test API response status codes

  Scenario Outline: Test API response for status codes
    Given I send a GET request to "<endpoint>"
    Then the response status code should be <status_code>

    Examples:
      | endpoint                | status_code |
      | /api/users              | 200        |
      | /api/users/123          | 404        |
      | /api/products           | 200        |
      | /api/products/456       | 404        |

```

```text
.
├── features
│   └── status-codes.feature
├── package.json
└── steps
    └── status-codes.js
```

```js
const { Given, Then } = require('cucumber');
const { expect } = require('chai');
const request = require('supertest');

let app;

Given('I send a GET request to {string}', async function(endpoint) {
  app = require('../app');
  this.response = await request(app).get(endpoint);
});

Then('the response status code should be {string}', function(statusCode) {
  expect(this.response.status).to.equal(parseInt(statusCode));
});

```

```json
{
  "scripts": {
    "test": "cucumber-js"
  }
}
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
      - cucumber_report/

```
