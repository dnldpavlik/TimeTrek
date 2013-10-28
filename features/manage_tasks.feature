Feature: Manage Tasks
    In order to get work done
    As an author
    I want to create and manage tasks

    Scenario: Taks list
        Given I have no tasks
        When I do to the list of tasks
        Then I should not see any tasks
