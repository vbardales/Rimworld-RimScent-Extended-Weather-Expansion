@requires:nelim.pickletools.colonistrace
Feature: RimScent Weather Expansion, a drought gives the drought scent (S8)

  Scenario: a drought gives the drought scent (S8)
    Given the save "test-colony" is loaded
    And Nelim's Pickle Tools: "Jet" waits in place
    And Nelim's Pickle Tools: the game condition "Drought" is started
    When I wait 600 ticks
    Then Nelim's Pickle Tools: "Jet" currently feels the mood thought "RimScentExtended_Scent_Drought"
    And no errors were logged
