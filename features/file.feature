Feature: Verify log files
    As a developer
    I want to ensure the logs contain specific content
    So that I can confirm the application is running correctly

    Scenario Outline: Check log file <filename> for <content>
        Given I have a log file named "<filename>"
        When I check the file for "<content>"
        Then the file should contain "<content>"

        Examples:
            | filename | content            |
            | file1    | expected content 1 |
            | file2    | expected content 2 |
