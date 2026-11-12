# Testing and evidence

## Evidence retention

Runtime evidence is local and ignored by Git.  For each scenario and the
revision being tested, retain only the newest terminal report that proves the
current result, plus an older report only where it is the sole proof of a
check the newest report did not repeat.  Keep the smallest useful set: the
terminal result, the relevant log excerpt, and at most the screenshot(s)
needed to prove a visual observation.  Do not copy the shared Pickle report
tree or a launcher archive into this mod.

Before replacing evidence, list the files being removed and retained; repoint
`STATUS.md` first if it names a removed file.  Delete superseded reports from
disk after that check.  Record each retained run as one text line in
`Docs/runs/`, including date, tested revision, scenario, verdict and local
evidence path.  Never commit runtime captures, `Player.log`, archives or
generated `.dds` textures.

## Requirement to mark `tested`

`tested` requires a terminal, green result for every applicable scenario on
the revision delivered.  No scenario may remain marked as work in progress; every scenario
with a condition must have run with that condition satisfied; and every manual
check must be completed green.  A missing scenario, conditional run or manual
validation remains `unverified`, not a pass.  In-game checks must also cover
the absence of an empty Mod options page and default-visible/greyed
MainButtons shortcut, plus English and French display.

## Current static checks — 2026-09-26

- All 8 shipped XML files parsed successfully.
- `Tests/Test-Xml.ps1` is the revision-bound static contract for the XML,
  owned thoughts, French coverage, dependency split, conditional VEE folder,
  and absence of shipped code/settings.
- `../scripts/Check-DefInjected.ps1 -TransMod Mod -Targets Mod` checked 22
  French keys with 0 errors after 81 patch operations over 11,597 defs.
- This is static evidence only.  It does not satisfy any runtime, conditional
  scenario, manual-validation or `tested` requirement.

## Scenarios and passes — 2026-11-11

- `Tests/SCENARIOS.md` holds one scenario per promised behaviour (S1 to S10). None has run.
- Offline: `Tests/Test-Xml.ps1` (XML, 11 owned thoughts and their mood effect, French coverage, dependency
  split, VEE gate, no code), `../scripts/Check-Translations.ps1`, `../scripts/Check-DefInjected.ps1`. No unit-test
  project: the mod ships no code, so `Run-UnitTests.ps1` has nothing to build.
- Pickle, written and not run: `Tests/Pickle/` holds two features, `01-minimal-load` and `02-vee`.
  Two passes are needed: without optional mods (`wsl-deps.sans-facultatifs.map`), and with Vanilla Events Expanded
  (`wsl-deps.vee.map`). The mod declares no `incompatibleWith`, so no incompatibility pass.
- Not applicable in Gherkin today: scenarios S2 to S9 (a colonist feels a terrain or weather scent). They need
  steps to set a terrain, force a weather, start a game condition and set the temperature. These steps are not
  in the catalogue and were requested from the PickleTools session on 2026-11-11; no local step is written.
  Mood values and the dependency contract are proven offline and are not repeated in Gherkin.
