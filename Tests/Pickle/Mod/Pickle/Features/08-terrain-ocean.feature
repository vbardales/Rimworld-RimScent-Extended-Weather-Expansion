@requires:nelim.pickletools.colonistrace
@requires:nelim.pickletools.stagedecor
Feature: RimScent Weather Expansion, shallow sea water gives the ocean scent (S3)

  Scenario: standing in shallow sea water gives the ocean scent (S3)
    Given the save "test-colony" is loaded
    And Nelim's Pickle Tools: I lay the floor "WaterOceanShallow" from (112, 201) to (116, 205)
    And Nelim's Pickle Tools: "Jet" stands at (114, 203)
    And Nelim's Pickle Tools: "Jet" waits in place
    When I wait 600 ticks
    Then Nelim's Pickle Tools: "Jet" currently feels the mood thought "RimScentExtended_Scent_Ocean"
    And no errors were logged
