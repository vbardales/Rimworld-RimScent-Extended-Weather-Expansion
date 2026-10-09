# Test scenarios

These scenarios are intentionally not marked as completed: no RimWorld run has
been submitted for this revision.  Each has to produce a terminal green report
before `tested` can be claimed.

## Minimal load and no-settings observation

**Preconditions:** RimScent and RimScent Extended are staged; no optional
integration is active; clean Pickle configuration; English.

**Actions:** Load a colony, inspect the log, open Mod options, then inspect the
normal MainButtons bar.

**Expected:** The expansion loads without errors; it has no empty Mod options
page and no visible or disabled MainButtons shortcut. This is the required
runtime evidence for `settings_audit: not_applicable`.

## Vanilla terrain and weather

**Preconditions:** Same minimal load; a map exposes water, forest and weather
conditions represented by the shipped patches.

**Actions:** Place an observing colonist within scent range of each target and
exercise dry thunderstorm, snow/cold, heat and the relevant terrains.

**Expected:** Each expected thought resolves with its documented mood effect;
no unrelated error or duplicated thought occurs.

## DLC conditions

**Preconditions:** Run separately with each available DLC condition targeted
by the patches, including Odyssey terrain and weather content.

**Actions:** Trigger or load each condition and inspect the active thought and
the log.

**Expected:** Direct targets apply where present and harmlessly no-op where the
DLC is absent; reused RimScent thoughts remain reused rather than duplicated.

## Vanilla Events Expanded integration

**Preconditions:** Vanilla Events Expanded is staged and active.

**Actions:** Load a colony and exercise its drought, swelter and psychic bloom
paths.

**Expected:** The conditional VEE folder loads, the three owned thoughts
resolve, and the log stays clean.

## French display

**Preconditions:** Repeat the applicable minimal, vanilla and optional runs in
French.

**Actions:** Inspect every thought label and description surfaced above.

**Expected:** French text is resolved, complete, readable and unclipped; no raw
key or English fallback appears.

