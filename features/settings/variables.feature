Feature: Settings - Variables
  As a user I want to Read Create Update and Delete Variables
  So that I can eventually reuse them in alerts and dashboards in Influxdbv2

  Scenario: Open Variables Tab
    Given I reset the environment
    Given run setup over REST "DEFAULT"
    When open the signin page
    When UI sign in user "DEFAULT"
    When hover over the "Settings" menu item
    When click nav sub menu "Variables"
    Then the variables Tab is loaded

  Scenario: Exercise Import Variable Popup
    When click create variable dropdown in header
    When click "import" variable dropdown item
    Then the import variable popup is loaded
    Then dismiss the popup
    Then popup is not loaded
    When click create variable dropdown empty
    When click "import" variable dropdown item
    Then the import variable popup is loaded
    When click the Import Variable popup paste JSON button
    Then the Import Variable JSON textarea is visible
    Then the Import JSON as variable button is enabled
    When click the Import Variable popup Upload File button
    Then the Import Variable JSON textarea is not visible
    Then the Import JSON as variable button is not enabled
    Then the Import JSON file upload area is present
    Then dismiss the popup
    Then popup is not loaded

  Scenario: Exercise Create Variable Popup
    When click create variable dropdown in header
    When click "new" variable dropdown item
    Then the create variable popup is loaded
    Then dismiss the popup
    Then popup is not loaded
    When click create variable dropdown empty
    When click "new" variable dropdown item
    Then the create variable popup is loaded
    Then the create variable popup selected type is "Query"
    Then the create variable popup create button is disabled
    Then the create variable popup script editor is visible
    When click the create variable popup type dropdown
    When click the create variable popup type dropdown item "Map"
    Then the create variable popup selected type is "Map"
    Then the create variable popup create button is disabled
    Then the create variable popup script editor is not visible
    Then the create variable popup textarea is visible
    Then the create variable popup default value dropdown is visible
    Then the create variable popup info line contains "0" items
    When click the create variable popup type dropdown
    When click the create variable popup type dropdown item "constant"
    Then the create variable popup selected type is "CSV"
    Then the create variable popup create button is disabled
    Then the create variable popup script editor is not visible
    Then the create variable popup textarea is visible
    Then the create variable popup default value dropdown is visible
    Then the create variable popup info line contains "0" items
    When click the create variable popup type dropdown
    When click the create variable popup type dropdown item "Query"
    Then the create variable popup selected type is "Query"
    Then the create variable popup create button is disabled
    Then the create variable popup script editor is visible
    Then the create variable popup textarea is not visible
    Then the create variable popup default value dropdown is not visible
    Then the create variable popup info line is not visible
    Then click popup cancel simple button
    Then popup is not loaded

  Scenario Outline: Import Variable
    When click create variable dropdown in header
    When click "import" variable dropdown item
    When upload the import variable file "<FILE>"
    Then the import variable drag and drop header contains success "<FILE>"
    When click the import variable import button
    Then popup is not loaded
    Then the success notification contains "Successfully created new variable: <NAME>"
    Then close all notifications
    Then there is a variable card for "<NAME>"

  Examples:
    |NAME|FILE|
    |Bucket|etc/test-data/variable-query-bucket.json|
    |Ryby|etc/test-data/variable-map-ryby.json|
    |Jehlicnany|etc/test-data/variable-map-jehlicnany.json|
    |Slavia|etc/test-data/variable-csv-slavia.json|
    |Arsenal|etc/test-data/variable-csv-arsenal.json|

  Scenario: Create Map Variable
    When click create variable dropdown in header
    When click "new" variable dropdown item
    When click the create variable popup type dropdown
    When click the create variable popup type dropdown item "map"
    When clear the create variable popup name input
    When enter the create variable popup name "Primaty"
    When enter the create variable popup values:
    """
    Human,homo sapiens
    Orangutan,pongo
    Chimpanzee,pan troglodytes
    Gorilla,gorilla
    Baboon,papio
    """
    When click the create variable popup title
    Then the create variable popup info line contains "5" items
    Then the selected default variable dropdown item is "Human"
    When click the create variable popup default dropdown
    When click the create variable popup default dropdown item "Chimpanzee"
    Then the selected default variable dropdown item is "Chimpanzee"
    When click the create variable popup create button
    Then popup is not loaded
    Then the success notification contains "Successfully created new variable: Primaty"
    Then close all notifications
    Then there is a variable card for "Primaty"

  Scenario: Create CSV Variable
    When click create variable dropdown in header
    When click "new" variable dropdown item
    When click the create variable popup type dropdown
    When click the create variable popup type dropdown item "constant"
    When clear the create variable popup name input
    When enter the create variable popup name "Obdobi"
    When enter the create variable popup values:
    """
    Antropocen,Holocen,Svrchni pleistocen,Stredni pleistocen,Spodni pleistocen
    """
    When click the create variable popup title
    Then the create variable popup info line contains "5" items
    Then the selected default variable dropdown item is "Antropocen"
    When click the create variable popup default dropdown
    When click the create variable popup default csv dropdown item "Holocen"
    Then the selected default variable dropdown item is "Holocen"
    When click the create variable popup create button
    Then popup is not loaded
    Then the success notification contains "Successfully created new variable: Obdobi"
    Then close all notifications
    Then there is a variable card for "Obdobi"

  Scenario: Create Query Variable
    When click create variable dropdown in header
    When click "new" variable dropdown item
    When click the create variable popup type dropdown
    When click the create variable popup type dropdown item "Query"
    When clear the create variable popup name input
    When enter the create variable popup name "Kybl"
    When enter the create variable popup CodeMirror text:
    """
    buckets()
   |> filter(fn: (r) => r.name !~ /^_/)
   |> rename(columns: {name: '_value'})
   |> keep(columns: ['_value'])
    """
    When click the create variable popup create button
    Then popup is not loaded
    Then the success notification contains "Successfully created new variable: Kybl"
    Then close all notifications
    Then there is a variable card for "Kybl"