# Pickle test suite

Development-only companion for RimScent Extended: Weather Expansion. It is never included in `Mod/`
or uploaded to the Workshop.

- `01-minimal-load.feature`: the minimal pass with the two hard dependencies (RimScent, RimScent
  Extended). The 11 owned thoughts load in a real RimWorld process and the load logs no error.
  Runtime counterpart of `Tests/Test-Xml.ps1`; it does not test RimScent's own scan.
- `02-vee.feature`: the same load with Vanilla Events Expanded active, so the conditional `VEE` folder
  loads. Needs `wsl-deps.vee.map`.

Run only through the shared WSL launcher, one pass per map:

```powershell
powershell.exe -ExecutionPolicy Bypass -File scripts/Run-PickleWsl.ps1 -Mod RimScentExtendedWeatherExpansion -DepMap wsl-deps.sans-facultatifs.map -Language English
powershell.exe -ExecutionPolicy Bypass -File scripts/Run-PickleWsl.ps1 -Mod RimScentExtendedWeatherExpansion -DepMap wsl-deps.vee.map -Language English
```

The behaviour scenarios (a colonist feels the scent of water, marsh, a storm...) are written in
`Tests/SCENARIOS.md` and are not in Gherkin yet: they need steps to set a terrain, force a weather,
start a game condition and set the temperature, which the step catalogue does not have. They were
requested from the PickleTools session on 2026-11-11. No local step is written meanwhile.
