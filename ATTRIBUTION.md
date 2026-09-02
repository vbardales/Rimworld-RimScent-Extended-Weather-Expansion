# Attribution

## RimScent

by **reo / ocarina0001** — MIT.
[Workshop](https://steamcommunity.com/sharedfiles/filedetails/?id=3645569466)

A companion mod, not a fork. No file from RimScent is copied or redistributed. It is declared
as a hard dependency, and we use `RimScentReworked.ModExtension_Scent`, its own public extension
point, on `WeatherDef`s and `GameConditionDef`s — two of the types it accepts and that nobody
was using beyond six defs.

**Six of its `ThoughtDef`s are reused by `defName`**, never copied:
`RimScent_PetrichorScent`, `RimScent_BloodScent`, `RimScent_GrayFleshScent`,
`RimScent_ToxicScent`, `RimScent_AshScent`. Where it had already written the right smell, we
cite it rather than add one more.

## Mods read by this expansion

Nothing is copied from them. Targeted only by `PatchOperation`s, in a folder that loads only if
the mod is active:

- **Vanilla Events Expanded** (`vanillaexpanded.vee`)

The weather, terrain and forest patches target no mod at all: they aim at the base game and its
four DLCs, plus the `plant/treeCategory` marker, which catches trees from any mod without naming
or reading it.

## This mod

MIT, © nelim. Defs, patches, thresholds and translations are original work.
