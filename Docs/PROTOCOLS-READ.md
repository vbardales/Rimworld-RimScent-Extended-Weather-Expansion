# Protocols read — RimScent Extended: Weather Expansion

Recorded 2026-09-26.  A document is current for this pass only when both its
UTC modification time and SHA-256 prefix below match.  Re-read a document on
a hash change only when its `Use now` column says it governs the action being
taken; otherwise retain this record and defer it until that action arises.

| Document | Version read (UTC; SHA-256 prefix) | Use now |
| --- | --- | --- |
| `../AGENTS.md` | `2026-09-24T06:33:14Z`; `36631E730433` | Yes — ordered gates, evidence retention, CI authority. |
| `../AUDIT.md` | `2026-09-26T08:33:00Z`; `D5DC23B06E35` | Yes — audit evidence and the exclusive Pickle/dispatcher test route. |
| `../MOD_SETTINGS.md` | `2026-09-12T22:46:50Z`; `404916BC99A7` | Yes — this mod's settings audit remains runtime-unverified. |
| `../PUBLISHING.md` | `2026-09-26T08:33:00Z`; `7D34F55D583D` | Yes — source link, autonomous-repository and stage requirements. |
| `../TRANSLATIONS.md` | `2026-09-25T17:19:05Z`; `298F74D226DA` | Yes — static EN/FR result versus pending in-game display checks. |
| `../STYLE_RIMWORLD.md` | `2026-09-25T13:49:56Z`; `DE13CBE5E1F9` | Deferred — only for a new/reworked icon or preview; current assets were already visually checked. |
| `../WORKSHOP_COMMENTS.md` | `2026-09-26T08:41:42Z`; `6C69A05BB424` | Not useful now — reopen only to post/register a Workshop comment. |
| `../scripts/SEARCHING.md` | `2026-09-17T11:26:36Z`; `9DBD52B2BCD4` | Deferred — use for a corpus-wide ownership/collision question. |
| `../PickleTools/README.md` | `2026-09-25T17:37:34Z`; `628350C7BCC3` | Deferred — needed when writing or maintaining a suite. |
| `../PickleTools/Headless/README.md` | `2026-09-25T22:43:25Z`; `488A0BB2CA83` | Deferred — needed only when submitting a headless run. |
| `../PickleTools/docs/steps.md` | `2026-09-25T21:38:05Z`; `0F897B4557A9` | Deferred — step catalogue for a future Pickle scenario. |
| `../Rimworld-Release-Admin/docs/OPERATIONS.md` | `2026-09-25T20:15:32Z`; `F6F85474F6D3` | Not useful now — mandatory again before any CI dry-run, publish, tag, release or Steam-secret work. |
| `../Rimworld-Ticket-Dispatcher/docs/WELCOME.md` | `2026-09-26T08:43:49Z`; `135D16D524E8` | Deferred — registration/owner convention for a future Pickle request. |
| `../Rimworld-Ticket-Dispatcher/docs/SUBMIT.md` | `2026-09-25T20:44:44Z`; `90B7385B1BDA` | Deferred — submission options for a future Pickle request. |
| `STATUS.md` | `2026-09-22T21:44:14Z`; `4166F16C2B94` | Yes — authoritative current evidence and pending work. |
| `README.md` | `2026-09-01T22:36:02Z`; `C2F2786F115B` | Yes — shipped behaviour/claims to test. |
| `ATTRIBUTION.md` | `2026-09-20T09:30:21Z`; `E1D456EFDAB4` | Yes — dependency and reuse attribution. |
| `LICENSE` | `2026-09-20T09:30:21Z`; `AE6AE5FA894C` | Yes — MIT scope. |
| `Mod/About/About.xml` | `2026-09-20T09:30:21Z`; `6FDDC836D990` | Yes — package, dependencies, description and publication-link gap. |

## Requested paths not present in this checkout

These were not substituted with monorepo files: `CHANGELOG.md`,
`PUBLICATION.md`, `TESTING.md`, `BACKLOG.md` (the instruction excludes the
monorepo backlog), `NOTES.md`, `BUGS.md`, `docs/runs/`, `Tests/Pickle/`, and
the pre-existing `docs/PROTOCOLS-READ.md` itself.  They need no reread until
they are actually added here.  Their absence is evidence, not an implicit
pass for their associated gates.

## Active conclusions carried into the next audit action

- Keep `settings_audit: partial`: source inspection supports no useful
  settings, but only an in-game check can establish the absence of an empty
  Mod options page and hidden MainButtons shortcut.
- Static localization is recorded complete; English and French in-game display
  remains unverified.
- Do not publish or create a tag/release: this checkout is not autonomous,
  lacks the mandatory distributed source link, and has no functional/Pickle
  evidence.
