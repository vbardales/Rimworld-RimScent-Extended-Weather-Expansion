# RimScent Extended: Weather Expansion

The air outside, and the ground it rests on. For RimWorld 1.6.

## Terrain — new ground for RimScent

RimScent only reads the `thingGrid`: things sitting on cells. **Terrain is not a thing** — water,
marsh, sand and ice have no `ThingDef` — so none of what makes a place smell the way it does was
reachable.

The socle gained `ModExtension_TerrainScent` for this, and `ScentScan` reads the terrain grid on
the same cells it already walks: an indexed lookup, with no extra traversal cost.

| Terrain | Smell | Mood |
|---|---|---|
| fresh water (river, lake, flood) | cool water and wet stone | +1 |
| ocean | salt, iodine, open sea | +2 |
| marsh, swamp, mud | stagnant water, sulphurous and sweetish | −3 |
| hot spring (Odyssey), geyser | mineral steam, sulphur and iron | +3 |
| toxic water (Odyssey) | **reuses** `RimScent_ToxicScent` | |
| lava (Odyssey) | **reuses** `RimScent_AshScent` | |
| mossy ground, glowforest floor | the same smell as the trees | +2 |

**Marsh only smells above 18 °C.** It is the temperature that makes a swamp smell, not the swamp.
Below the threshold the cell does not count at all — which is distinct from the socle's global
temperature factor: that one damps a smell that is present, this one decides it does not exist.

### Counting per cell

Terrain is counted **per cell**, unlike weather, which is read once for the whole map. Three water
cells at the edge of a stream do not smell like a swamp stretching to the horizon, and the
thought's `stackLimit` caps the total. The cell count therefore becomes a measure of "how much of
it is around you", for free.

## The forest

Every tree, through the **`plant/treeCategory`** marker the game already uses to tell a tree from
a plant — not through a hand-written list. Since patch operations apply to raw XML, before
inheritance is resolved, targeting `TreeBase` is enough and covers all its children at once, mods
included. A mod that declares its own tree parent is caught by the same xpath without being named.

**Six trees are excluded by name**, because each declares its own `treeCategory` instead of
inheriting from `TreeBase`, and none of them smells of forest: the anima and gauranlen trees have
a presence of their own, the polux and archean are artefacts, Anomaly's harbinger is a horror, and
the bonsai is a piece of indoor decoration.

### The limit of the approach, accepted

Declaring your own `treeCategory` rather than inheriting from `TreeBase` is common among mods:
across the mods installed here, some sixty files do it. That is what makes the criterion useful —
those trees are caught without being named, and so will the next mod installed, with no update.

It is also the limit. **A modded cursed tree will smell of pleasant forest**, since there is no way
to tell it apart other than by naming it — and naming is precisely what this patch refuses to do.
The six vanilla exclusions are a special case, justified by being finite and known; there is no
equivalent for mods. If an awkward case shows up in play, the exclusion is one more
`not(defName="…")`.

## Weather and conditions

RimScent already covers six defs: `Rain`, `Fog`, `RainyThunderstorm` and `FoggyRain` for
petrichor, plus `ToxicFallout` and `VolcanicWinter`. Nothing here duplicates them.

| Target | Smell |
|---|---|
| dry thunderstorm, lightning storm | ozone, +1 |
| snow, blizzard, cold snap, deep freeze | cold clean air, +1 |
| heat wave, unnatural heat, heat vents | stifling air, −2 |
| drought (Odyssey) | parched air, −2 |
| bioluminescent spores (Odyssey) | spores, −1 |
| torrential rain (Odyssey) | **reuses** `RimScent_PetrichorScent` |
| blood rain (Anomaly) | **reuses** `RimScent_BloodScent` |
| grey pall (Anomaly) | **reuses** `RimScent_GrayFleshScent` |
| noxious haze (Biotech) | **reuses** `RimScent_ToxicScent` |
| ash, debris, lava flow (Odyssey) | **reuses** `RimScent_AshScent`, pyromaniacs exempt |
| Vanilla Events Expanded | drought, heat wave, psychic bloom |

The values stay low: weather and conditions are read at map scale, outside the cell loop, so each
smell hits the whole colony at once.

**No `MayRequire` anywhere.** A conditional operation whose xpath matches nothing does nothing and
raises no error: the Anomaly, Biotech and Odyssey defs are targeted directly, and the mod works
without them.

Many conditions **deliberately** have no smell: eclipse, solar flare, aurora, psychic drone,
unnatural darkness. A changing sky smells of nothing, and inventing one for it would be noise.

## What is not here, and why

**Pheromones.** On a neighbouring pawn RimScent reads only `HediffDef`s, and no vanilla hediff
marks them. A scent put on `Human` would simply be permanent for every colony — exactly what the
`ModExtension_PawnScent` threshold exists to avoid. It would need a trigger: not ruled out, just
waiting for an honest hook.

**Colonists who do not wash.** Already covered by RimScent itself, in its Dubs Bad Hygiene section
(`RimScent_BadHygiene`). Nothing to add.

**Illness on the breath.** RimScent reads a neighbour's hediffs, so patching diseases would work
natively, without a line of code. But that is decay, not weather — it belongs to **Decay
Expansion**, which already carries sickroom air.

## Requirements

- [RimScent](https://steamcommunity.com/sharedfiles/filedetails/?id=3645569466)
- RimScent Extended (the socle) — it is what carries `ModExtension_TerrainScent`

Vanilla Events Expanded is not required: its section loads only if it is active, through
`LoadFolders.xml`. Nothing is written to the save.

## Licence

MIT — see [LICENSE](LICENSE) and [ATTRIBUTION.md](ATTRIBUTION.md).
