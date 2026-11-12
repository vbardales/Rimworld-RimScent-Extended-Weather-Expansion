@requires:nelim.pickletools.colonistrace
@requires:nelim.pickletools.stagedecor
Feature: RimScent Weather Expansion, shallow water gives the fresh water scent (S2)

  Scenario: standing in shallow water gives the fresh water scent (S2)
    Given the save "test-colony" is loaded
    And Nelim's Pickle Tools: I lay the floor "WaterShallow" from (112, 201) to (116, 205)
    And Nelim's Pickle Tools: "Jet" stands at (114, 203)
    And Nelim's Pickle Tools: "Jet" waits in place
    When I wait 600 ticks
    Then Nelim's Pickle Tools: "Jet" currently feels the mood thought "RimScentExtended_Scent_Water"
    And no errors were logged
