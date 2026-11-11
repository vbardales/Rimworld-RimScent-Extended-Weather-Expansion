Feature: RimScent Weather Expansion loads with its two hard dependencies only

  Scenario: the minimal dependency set loads every owned scent definition
    Given the save "test-colony" is loaded
    Then mod "nelim.rimscent.extended.weather" is loaded
    And def "RimScentExtended_Scent_Drought" of type "ThoughtDef" exists
    And def "RimScentExtended_Scent_Swelter" of type "ThoughtDef" exists
    And def "RimScentExtended_Scent_PsychicBloom" of type "ThoughtDef" exists
    And def "RimScentExtended_Scent_Ozone" of type "ThoughtDef" exists
    And def "RimScentExtended_Scent_ColdAir" of type "ThoughtDef" exists
    And def "RimScentExtended_Scent_Spores" of type "ThoughtDef" exists
    And def "RimScentExtended_Scent_Forest" of type "ThoughtDef" exists
    And def "RimScentExtended_Scent_Water" of type "ThoughtDef" exists
    And def "RimScentExtended_Scent_Ocean" of type "ThoughtDef" exists
    And def "RimScentExtended_Scent_Stagnant" of type "ThoughtDef" exists
    And def "RimScentExtended_Scent_HotSpring" of type "ThoughtDef" exists
    And no errors were logged
