---
tags:
  - complexity
  - quality
---

# cognitive complexity

--8<-- "snippets/cognitive_complexity.md"

## docs

| Technique                            | Description                                                                                                                                                                                                                          |
| ------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| 1. Use consistent naming conventions | Consistent naming conventions make code more readable and easier to understand. Follow the guidelines for your language or framework. For example, in Python, use snake_case for variables and functions, and CamelCase for classes. |
| 2. Use descriptive names             | Use descriptive and meaningful names for variables, functions, classes, and other identifiers. Avoid using single-letter or abbreviated names, unless they are commonly accepted in the context.                                     |
| 3. Avoid misleading names            | Names should not mislead the reader about the purpose or behavior of the code. Avoid using names that are too general or too specific, or that suggest a behavior that does not match the implementation.                            |
| 4. Use meaningful comments           | Use comments to describe the purpose and behavior of the code, especially in complex or non-obvious parts. Avoid comments that repeat the code or that are too general to be useful.                                                 |
| 5. Use consistent formatting         | Consistent formatting makes code more readable and easier to understand. Follow the guidelines for your language or framework, and use tools like linters or formatters to enforce consistency.                                      |
| 6. Use consistent capitalization     | Consistent capitalization makes code more readable and easier to understand. Follow the guidelines for your language or framework, and use tools like linters or formatters to enforce consistency.                                  |
| 7. Use consistent terminology        | Consistent terminology makes                                                                                                                                                                                                         |

## magic values

Assigning magic values to named constants or enums can improve code readability and maintainability by avoiding hard-coded values in the code. Here are some examples:

Example 1: HTTP Status Codes

```js
// Using named constants for HTTP status codes
const HTTP_STATUS_CODE_OK = 200;
const HTTP_STATUS_CODE_CREATED = 201;
const HTTP_STATUS_CODE_BAD_REQUEST = 400;
const HTTP_STATUS_CODE_UNAUTHORIZED = 401;
const HTTP_STATUS_CODE_NOT_FOUND = 404;
```

```js
// Using enums for directions
enum DIRECTION {
  UP = "UP",
  DOWN = "DOWN",
  LEFT = "LEFT",
  RIGHT = "RIGHT",
}
```

```js
// Using named constants for colors
const COLOR_RED = "#FF0000";
const COLOR_GREEN = "#00FF00";
const COLOR_BLUE = "#0000FF";
const COLOR_YELLOW = "#FFFF00";
```

## documentation

| Technique                                                      | Description                                                                                                                |
| -------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------- |
| 1. Use clear, concise, and consistent naming conventions       | Use names that describe what the code is doing and that are easy to understand. Avoid abbreviations and overly long names. |
| 2. Write comments that explain the why, not just the what      | Comments should explain the purpose and intention of the code, not just restate what the code is doing.                    |
| 3. Use comments to explain complex or non-obvious code         | If the code is complex or hard to understand, add comments to explain what it's doing and why.                             |
| 4. Use JSDoc-style comments to document functions and classes  | JSDoc-style comments provide a standard way to document the inputs, outputs, and behavior of functions and classes.        |
| 5. Use inline comments to provide context or clarify code      | Use inline comments sparingly to explain why certain decisions were made or to provide context for what the code is doing. |
| 6. Use README files to provide an overview of the project      | The README should provide a high-level overview of the project, its purpose, and how to use it.                            |
| 7. Use code examples to demonstrate usage                      | Provide code examples that show how to use the code in different situations.                                               |
| 8. Keep the documentation up to date                           | Ensure that the documentation is kept up to date as the code changes.                                                      |
| 9. Use tools like JSDoc and Doxygen to generate documentation  | Use tools like JSDoc or Doxygen to automatically generate documentation from your code.                                    |
| 10. Consider including diagrams or visual aids to explain code | Use diagrams or visual aids to help explain complex concepts or algorithms.                                                |

## long functions

- Split a long function into multiple smaller functions that each have a specific purpose, such as handling input, processing data, and outputting results.
- Create helper functions for repetitive code blocks or calculations.
- Separate the logic for each component of a program into its own function.
- Refactor a large function into a class with smaller methods, each responsible for a specific task.
- Use functional programming techniques to break a function into smaller, more modular functions.
- Move large switch statements or if/else blocks into separate functions that can be more easily maintained and tested.
- Use callback functions or event-driven programming to separate the control flow of a function into smaller, more manageable pieces.
- Encapsulate complex logic into a separate function to improve readability and maintainability.
- Break up long loops or iteration blocks into separate functions to improve performance and readability.
- Use recursion to break down complex algorithms into smaller, more manageable functions. 

## abstraction

Examples of keeping abstractions simple and only using them when necessary:

- Avoid creating unnecessary abstract classes or interfaces. Only create them when there are multiple concrete classes that share the same behavior.
- Avoid creating too many layers of abstraction in your code. Each layer adds complexity and can make it harder to understand the code.
- Use the simplest data structures and algorithms that will solve the problem. Don't over-engineer solutions with unnecessary complexity.
- Avoid overusing design patterns. While design patterns can be helpful in solving certain problems, overusing them can add unnecessary complexity to your code.
- Keep your code as straightforward as possible. Use clear and concise naming conventions and avoid unnecessary comments and complexity.

## readme example

- don't be afraid to bust out a huge readme to `docs/`

````markdown
# Project Title

A short description of what this project does.

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)
- [Credits](#credits)
- [License](#license)

## Installation

Instructions for installing the project, including any necessary dependencies or prerequisites.

## Usage

Instructions for using the project, including any relevant examples or screenshots.

## Contributing

Guidelines for contributing to the project, including any code of conduct or instructions for submitting pull requests.

## Credits

A list of any contributors or sources of inspiration for the project.

## License

Information about the project's license and any relevant terms or conditions.
````

### mkdocs

- if you bust out into `docs/` with almost 0 additional effort you can run mkdocs

| Advantages of MkDocs Material |
| ---------------------------- |
| - Easy to install and use    |
| - Customizable and flexible  |
| - Responsive and mobile-friendly |
| - Supports syntax highlighting and code blocks |
| - Built-in search function   |
| - Integrates with version control systems like Git |
| - Large and active community |
