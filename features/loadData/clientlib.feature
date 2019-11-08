Feature: Load Data - Client Libs
  As a user I want to Read Create Update and Delete Client Libraries
  So that I can manage the stores used with Influxdbv2

  Scenario: Load Initial Client Lib Tab
    Given I reset the environment
    Given run setup over REST "DEFAULT"
    When API sign in user "DEFAULT"
    When API create a bucket named "Duchamp" for user "DEFAULT"
    When open the signin page
    When UI sign in user "DEFAULT"
    When hover over the "loadData" menu item
    When click nav sub menu "Client Libraries"
    Then the Client Libraries tab is loaded

  Scenario: Open C# Popup
    When click the "csharp" client library tile
    Then the csharp info popup is loaded
    Then dismiss the popup

  Scenario: Open Go Popup
    When click the "go" client library tile
    Then the go info popup is loaded
    Then dismiss the popup

  Scenario: Open Java Popup
    When click the "java" client library tile
    Then the java info popup is loaded
    Then dismiss the popup

  Scenario: Open Node Popup
    When click the "javascript-node" client library tile
    Then the node info popup is loaded
    Then dismiss the popup

  Scenario: Open Python Popup
    When click the "python" client library tile
    Then the python info popup is loaded
    Then dismiss the popup
