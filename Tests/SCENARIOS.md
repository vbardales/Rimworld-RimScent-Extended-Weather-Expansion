# Test scenarios

One scenario per behaviour the mod promises (`Mod/About/About.xml` description). Numbers come from
`Mod/Defs/Scents_Weather.xml` and the patches. Offline, `Tests/Test-Xml.ps1` already proves the 11
mood effects, the dependency split and the VEE gate; the scenarios below need a running game.
None has run: no RimWorld run has been submitted for this revision.

Common preconditions: RimScent and RimScent Extended active, clean Pickle configuration, English,
an observing colonist standing within scent range of the target.

## S1 Minimal load, no settings page
**Actions:** load a colony, read the log, open Mod options, look at the MainButtons bar.
**Expected:** no error; no empty Mod options page; no visible or greyed MainButtons shortcut. This is
the runtime evidence for `settings_audit: not_applicable`.

## S2 Fresh water (+1, stack 3)
Terrain `WaterShallow`, `WaterDeep`, `WaterMovingShallow`, `WaterMovingChestDeep`, `ShallowFloodwater`.
**Expected:** `RimScentExtended_Scent_Water` felt, mood +1; with five water cells in range the stack stays at 3.

## S3 The sea (+2)
Terrain `WaterOceanShallow`, `WaterOceanDeep`. **Expected:** `RimScentExtended_Scent_Ocean`, mood +2.

## S4 Stagnant water (-3), only above 18 C
Terrain `Marsh`, `MarshyTerrain`, `Mud`, `MarshFlood`.
**Expected:** at 20 C `RimScentExtended_Scent_Stagnant` felt, mood -3; at 10 C the cell does not count and
the thought is absent.

## S5 Hot spring (+3, stack 2, Odyssey)
Terrain `HotSpring`. **Expected:** `RimScentExtended_Scent_HotSpring`, mood +3, never above stack 2.

## S6 Toxic water and lava (Odyssey, reused thoughts)
Terrain `ToxicWater*` gives `RimScent_ToxicScent`; `LavaShallow`, `LavaDeep`, `CooledLava` give
`RimScent_AshScent`. **Expected:** the RimScent thought is felt; no `RimScentExtended_*` duplicate.

## S7 The forest (+2, stack 4)
Any tree with `plant/treeCategory`, and terrain `MossyTerrain`, `GlowforestSoil`.
**Expected:** `RimScentExtended_Scent_Forest`, mood +2, stack 4. Excluded: `Plant_TreeAnima`,
`Plant_TreeArchean`, `Plant_TreeBonsai`, `Plant_TreeGauranlen`, `Plant_TreeHarbinger`, `Plant_TreePolux` give
no forest scent.

## S8 Weather and conditions
| Trigger | Thought | Mood |
|---|---|---|
| `DryThunderstorm`, `Flashstorm` | `RimScentExtended_Scent_Ozone` | +2 |
| `SnowGentle`, `SnowHard`, `Blizzard`, `ColdSnap`, `DeepFreeze` | `RimScentExtended_Scent_ColdAir` | +1 |
| `HeatWave`, `UnnaturalHeat`, `HeatVentHeat` | `RimScentExtended_Scent_Swelter` | -2 |
| `Drought`, `DroughtInitial` | `RimScentExtended_Scent_Drought` | -2 |
| `BioluminescentSpores` | `RimScentExtended_Scent_Spores` | -1 |
| `TorrentialRain` | `RimScent_PetrichorScent` | reused |
| `BloodRain` | `RimScent_BloodScent` | reused |
| `GrayPall` | `RimScent_GrayFleshScent` | reused |
| `NoxiousHaze` | `RimScent_ToxicScent` | reused |
| `VolcanicAsh`, `VolcanicDebris`, `LavaFlow` | `RimScent_AshScent` | reused |

**Expected:** the thought is felt while the trigger runs, stack 1 even when a weather and a condition
carry the same scent. Run the DLC rows with and without the DLC: absent DLC means no error and no scent.

## S9 Vanilla Events Expanded (conditional folder)
VEE active. `VEE_Drought` gives Drought, `VEE_Scorch`, `VEE_Swelter`, `VEE_Inferno` give Swelter,
`VEE_PsychicBloom` gives PsychicBloom (+2), `VEE_PsychicRain` gives Petrichor, `SpaceBattle` gives
`RimScent_ExplosionScent`. **Expected:** each thought felt, log clean. Without VEE: the `VEE` folder
does not load and the log stays clean.

## S10 French display
**Actions:** repeat S2, S4, S7, S8 in French and read every thought label and description.
**Expected:** text resolved, complete, readable, unclipped; no raw key, no English fallback.
