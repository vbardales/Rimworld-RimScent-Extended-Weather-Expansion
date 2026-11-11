@requires:nelim.pickletools.colonistrace
Feature: RimScent Weather Expansion, hard snow gives the cold air scent (S8)

  Scenario: hard snow gives the cold air scent (S8)
    Given the save "test-colony" is loaded
    And Nelim's Pickle Tools: "Jet" waits in place
    And Nelim's Pickle Tools: the weather is set at once to "SnowHard"
    When I wait 600 ticks
    Then Nelim's Pickle Tools: "Jet" currently feels the mood thought "RimScentExtended_Scent_ColdAir"
    And no errors were logged
