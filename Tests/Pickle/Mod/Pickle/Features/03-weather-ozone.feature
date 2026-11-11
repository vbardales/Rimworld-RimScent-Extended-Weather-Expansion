@requires:nelim.pickletools.colonistrace
Feature: RimScent Weather Expansion, a dry thunderstorm gives the ozone scent (S8)

  Scenario: a dry thunderstorm gives the ozone scent (S8)
    Given the save "test-colony" is loaded
    And Nelim's Pickle Tools: "Jet" waits in place
    And Nelim's Pickle Tools: the weather is set at once to "DryThunderstorm"
    When I wait 600 ticks
    Then Nelim's Pickle Tools: "Jet" currently feels the mood thought "RimScentExtended_Scent_Ozone"
    And no errors were logged
