Feature: Manage Tasks
    In order to get work done
    As an author
    I want to create and manage tasks

    Scenario: Tasks list
        Given I have no tasks
        When I go to the list of tasks
        Then I should not see any tasks
