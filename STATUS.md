---
settings_audit: partial
localization: complete
translation_en: complete
translation_fr: complete
mod:          RimScent Extended: Weather Expansion
packageId:    nelim.rimscent.extended.weather
repo:         Rimworld-RimScent-Extended-Weather-Expansion
visibility:   public
remote:       https://github.com/vbardales/Rimworld-RimScent-Extended-Weather-Expansion.git
detached:     yes
workflow_stage: playTests[1.0.0]
licence:      open
licence_at:   the same MIT base as RimScent Extended
upstream_mod_remotes:
  - https://github.com/ocarina0001/rimscent
dependencies: declared
workshop_required_items: n/a, not released yet
showcase:     complete
tested_on:
workshop:
remaining:
  - "2026-11-11: setupRepo closed (1.h upstream_mod_remotes set, ocarina0001/rimscent); stage playTests[1.0.0]. 1.a done: Search-Workshop on About.xml, no duplicate mod"
  - "2026-11-11: playTests open: tickets 20261111-180427-554-8bff (minimal) and 20261111-180430-089-aa63 (VEE) queued at fd8c213, wait RUN_DONE from TM; then triage Inbox/initial-minimal and Inbox/initial-vee. PiT added the steps for S2 to S8 (1c5ad1e): terrain floor set, weather set at once, game condition started, map temperature, decor placed; write Gherkin for S2 to S8 only after RUN_DONE (the tickets stage the working tree), one small ticket per scenario. 8.m code review open; 8.l tested_on empty; 2.a note: Art/ModIcon-source.png is only 106x89"
  - "2026-11-11: 1.i done: local history rebased onto origin/main (add/add conflicts kept local version) and pushed, a38eb63"
  - "2026-11-11: 1.j: Check-Status ERROR cleared by workflow_stage; WARN left: em dash in Mod/About/About.xml, no <url> in About.xml"
  - "2026-11-11: defect: Mod/LICENSE differs from root LICENSE; root TEST_SCENARIOS.md, Art/echo.png and Art/ModIcon-signature-candidate.png are off the closed lists"
  - defect: About.xml has neither a <url> nor the required final [url=...]Source code on GitHub[/url] description link
  - unverified: no in-game check that this Defs-and-patches-only mod exposes neither an empty Mod options page nor a MainButtons shortcut
  - unverified: no functional or Pickle test suite/results; weather, terrain, DLC and VEE patch behaviour remains untested in game
  - unverified: English and French display has not been checked in game
session:      audit:      2026-09-22, static evidence review
updated:      2026-11-11, replay-audit
protocols_read_sha: ac4114f1491f18329efb742dc7755f21a1f6e9bc
---

# RimScent Extended: Weather Expansion — status

## Static audit — 2026-09-22

Scope: the files distributed under `Mod/`, the root documentation/licences, image artifacts,
and repository metadata. This audit did not launch RimWorld.

- All eight shipped XML files parse successfully. `Check-DefInjected.ps1 -TransMod Mod -Targets Mod`
  indexed 11,597 defs, applied 81 patch operations, and checked all 22 French entries with 0 errors.
  The 11 owned `ThoughtDef`s supply the English source text; each has a French label and description.
  There is no C# source, Keyed text, settings definition, `ModSettings` implementation, or
  MainButtons definition in this mod.
- The two hard dependencies are declared in `About.xml`. Vanilla Events Expanded is only in
  `loadAfter`, and its patch folder is gated by `IfModActive="vanillaexpanded.vee"`.
- `ModIcon.png` is a 128 x 128 PNG (21,766 bytes); `Preview.png` is 896 x 504 (752,216 bytes,
  below Steam's 1 MiB limit). Both were opened and visually inspected. The preview uses distinct
  weather/terrain accents and is readable; `showcase: complete` is retained.
- The settings inventory supports `not_applicable`, but the required functional confirmation that
  no empty page or hidden shortcut is registered has not been performed. `settings_audit` therefore
  remains `partial`, rather than claiming a runtime result from the file scan.

## Gate result

The localization static gate is complete, but the mod cannot advance from its unconfirmed state:
it remains inside the monorepo (`detached: no`), lacks the mandatory final source link in its
distributed description, has no functional or Pickle evidence, and has never been run in game.

## Static recheck — 2026-09-26

- All eight shipped XML files parse successfully.
- `../scripts/Check-DefInjected.ps1 -TransMod Mod -Targets Mod` applied 81 patch
  operations, indexed 11,597 defs, and checked 22 French keys with 0 errors.
- `Tests/Test-Xml.ps1` passed: 8 XML files, 11 owned thoughts and 22 French
  entries validated.
- No `.dds` file or runtime-evidence directory is present in this checkout. The
  checkout-local `.gitignore` and `TESTING.md` now preserve that rule for an
  eventual autonomous repository.
- The `RimScentExtended` socle is an autonomous Git repository on `main`, with
  `origin` at `vbardales/Rimworld-RimScent-Extended`; its terrain extension and
  scanner are the implementation reference for a later focused PR.

## Dependencies — 2026-11-11 (revision 33548af, Mod/ edited after)

- Hard (`modDependencies`): RimScent `reo.RimScent` (Workshop 3645569466) and RimScent Extended
  `nelim.rimscent.extended` (Workshop 3811307392). Both are required: the mod patches RimScent
  thoughts by name and needs the `ModExtension_TerrainScent` of the Extended base.
- Optional integration: Vanilla Events Expanded `vanillaexpanded.vee` (Workshop 1938420742), in
  `loadAfter`, folder `VEE` gated by `IfModActive`, declared in `Mod/About/OptionalCompat.xml`
  (kind patch). `Check-OptionalCompat.ps1`: OK, 0 patched targets, 1 declared (the INFO "no patch targets it" is expected: the
  gate is also in `loadAfter`, so it counts as ordered, Audit 2026-11-11).
- DLC: Royalty, Ideology, Biotech, Anomaly and Odyssey defs are patched without `MayRequire`:
  a conditional operation whose xpath matches nothing does nothing. `supportedVersions` 1.6.
- No incompatibility declared. No animal added.
- `workshop_required_items: n/a, not released yet` (owner, 2026-11-10: "on verra en 1.0.0").

## Translation audit — 2026-11-11 (revision 33548af, Mod/ edited after)

- English is the source text: the 11 owned `ThoughtDef`s in `Mod/Defs/Scents_Weather.xml` carry a label and a
  description each. French lives in `Mod/Languages/French/DefInjected/ThoughtDef/Scents_Weather.xml`
  (22 keys). No Keyed text, no C#, no settings page: no other displayed text.
- `Check-Translations.ps1`: PASS, 22 source texts, 0 nested, 0 Keyed calls. `Check-DefInjected.ps1`: 22 keys,
  0 errors, 81 patch operations applied.
- Read in full: no tu, vous, nous, no gendered token (no text agrees with a pawn), no "(e)".
- `TRANSLATION_REVIEW.md` generated by `Make-TranslationReview.ps1`.
- Virginie reviewed the French and validated it on 2026-11-11 (revision abed6e5, `TRANSLATION_REVIEW.md`), no correction requested.
- unverified: display in game (raw keys, fallback text, clipping) until playTests.

## Tests — 2026-11-11 (tested revision d492409)

- Exists, written, offline and green on d492409: `Tests/Test-Xml.ps1` (PASS: 11 owned thoughts with mood effect, hard
  dependencies, VEE gate, no code), `Check-Translations.ps1` (PASS, 22 texts), `Check-DefInjected.ps1` (22 keys, 0 errors).
- Exists, written, not run: `Tests/Pickle/` features `01-minimal-load` and `02-vee`, maps `wsl-deps.sans-facultatifs.map`
  and `wsl-deps.vee.map`; scenarios S1 to S10 in `Tests/SCENARIOS.md`. Passes and the reason why S2 to S9 are not in
  Gherkin yet (steps requested from the PickleTools session): `TESTING.md`.
- Not applicable: unit tests (no code, `Run-UnitTests.ps1` n/a), incompatibility pass (no `incompatibleWith`).
- No run yet: `docs/runs/` is absent, `tested_on` stays empty until the first green Pickle run.
