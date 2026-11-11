---
settings_audit: partial
localization: complete
translation_en: complete
translation_fr: unchecked
mod:          RimScent Extended: Weather Expansion
packageId:    nelim.rimscent.extended.weather
repo:         Rimworld-RimScent-Extended-Weather-Expansion
visibility:   public
detached:     no
workflow_stage: setupRepo
licence:      open
licence_at:   the same MIT base as RimScent Extended
dependencies: declared
showcase:     complete
tested_on:
workshop:
remaining:
  - "2026-11-11: replay stops at setupRepo. 1.a unverified: duplicate-mod search not run (needs owner OK for Search-Workshop)"
  - "2026-11-11: 1.f/1.i defect: local .git has 6 commits on main and no remote; GitHub repo vbardales/Rimworld-RimScent-Extended-Weather-Expansion is public and not empty, history unknown, nothing pushed"
  - "2026-11-11: 1.h defect: STATUS.md front matter lacks remote and upstream_mod_remotes; detached: no is stale"
  - "2026-11-11: 1.j: Check-Status ERROR cleared by workflow_stage; WARN left: em dash in Mod/About/About.xml, no <url> in About.xml"
  - "2026-11-11: defect: Mod/LICENSE differs from root LICENSE; root TEST_SCENARIOS.md, Art/echo.png and Art/ModIcon-signature-candidate.png are off the closed lists"
  - defect: About.xml has neither a <url> nor the required final [url=...]Source code on GitHub[/url] description link
  - unverified: no in-game check that this Defs-and-patches-only mod exposes neither an empty Mod options page nor a MainButtons shortcut
  - unverified: no functional or Pickle test suite/results; weather, terrain, DLC and VEE patch behaviour remains untested in game
  - unverified: English and French display has not been checked in game
session:      audit:      2026-09-22, static evidence review
updated:      2026-11-11, replay-audit
protocols_read_sha: d454cebad7bf5d49ad97a9ab5655f7de42e585ad
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
