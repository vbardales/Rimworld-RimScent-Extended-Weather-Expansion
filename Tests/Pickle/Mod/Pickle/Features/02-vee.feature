@requires:vanillaexpanded.vee
Feature: RimScent Weather Expansion with Vanilla Events Expanded

  Scenario: the conditional VEE folder loads and the log stays clean
    Given the save "test-colony" is loaded
    Then mod "nelim.rimscent.extended.weather" is loaded
    And mod "vanillaexpanded.vee" is loaded
    And def "RimScentExtended_Scent_PsychicBloom" of type "ThoughtDef" exists
    And no errors were logged
