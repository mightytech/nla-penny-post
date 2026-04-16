# Maintenance Session: Packages Migration (Phase 1)

**Date:** 2026-04-16
**Status:** Phase 1 and Phase 2 Complete

## Intent

Migrate penny post from the sibling-directory convention (`../nla-framework/`) to the
packages/submodule convention (`packages/nla-framework/`), per framework update notes
2026-04-15. This is Phase 1 of a two-phase update — it addresses penny post **as an
installing NLA**. Phase 2 (deferred to a follow-up session) will update penny post's
own install intents so it ships the new convention to NLAs that install it.

Also in scope: add the new `/session-checkpoint` skill (framework update 2026-04-16),
update `/export` wrapper description, apply smaller intent-file changes.

## Rollback

Rollback branch `pre-update-2026-04-16` captures pre-migration state.

## Changes Made

- **Added `packages/nla-framework/` as git submodule** (pinned at `a754ae3c`, matching
  the sibling's current commit). Created `.gitmodules`.
- **Rewrote 13 thin wrappers** in `.claude/skills/` to delegate to
  `packages/nla-framework/core/skills/...`: startup, maintain, friction-log, validate,
  preferences, install, update, check-updates, export, think, debrief, close, guide.
  `/validate`'s customized description preserved; `/export`'s description updated to the
  new reference text.
- **Added `/session-checkpoint` skill** — new wrapper at
  `.claude/skills/session-checkpoint/SKILL.md`; registered in CLAUDE.md, app/overview.md,
  and reference/system-status.md skills tables.
- **Updated path references** in top-level docs:
  - CLAUDE.md: Environment section now describes the submodule; Key Files table path
    updated
  - README.md: Prerequisites and "Running the penny post directly" now reference the
    submodule and `git submodule update --init` flow
  - app/overview.md: foundations link and Document Hierarchy tree updated
  - app/config-spec.md: Framework Path default updated
- **Removed `Read(../nla-framework/**)`** from `.claude/settings.local.json` — reads are
  now in-project.
- **Updated `reference/installed-packages.md`** — Source path changed, new 2026-04-16
  update entry appended recording the migration.
- **Updated `reference/system-status.md`** — Last Updated, System State with Phase 2
  pending note, Recent Changes, added /session-checkpoint to skills table.

## Decisions Made

- Used HTTPS URL for the submodule (`https://github.com/mightytech/nla-framework.git`)
  rather than an SSH alias — more portable for any future clones.
- Preserved `/validate`'s customized description ("Validate the NLA system's internal
  consistency, trace scenarios through docs, or debug unexpected behavior"). Per
  `/update`'s ejected-wrapper rule, don't overwrite customizations. Only updated the
  delegation path.
- Kept existing `dependencies/` symlink-related permission entries in
  `.claude/settings.local.json`. Those were artifacts of the permission retest
  (Issue #11) and cleanup is a separate concern.
- Left README and app/overview references to `../nla-framework/` and `../nla-penny-post/`
  in sections describing how OTHER NLAs install penny post (as siblings). Those are
  Phase 2 content — they describe the package-side convention penny post is telling its
  installers to use, which is exactly what Phase 2 will update.
- Updated `app/config-spec.md`'s Framework Path default to `packages/nla-framework/`.
  Open question for Phase 2: with submodules the framework path is effectively fixed,
  so this config option may be functionally dead. Deferred deciding whether to remove it.

## What Didn't Work

- [none yet]

## Friction Log Entries Processed

- **2026-04-16 /synthesize miscategorization** — resolved (fixed in Phase 2 CLAUDE.md edit)
- **2026-02-23 letter-to-boxes** — archived (long-resolved catch-up)

## Feedback Log Entries Processed

- **Issue #9 — Permissions section in install manifest** — resolved in Phase 2. Noted that the packages/ migration obviated the original `Read(../nla-penny-post/**)` recommendation; only `Bash(gh:*)` was declared.

## Debrief

- [captured at /close]

## State at Close

**Phase 1 committed as `9773310`. Phase 2 complete and ready to commit.**

Phase 2 changes (9 files):
- `install/install.md` — Prerequisites now describes submodule; Permissions section added with `Bash(gh:*)` only
- `install/skills-intent.md` — Wrapper paths and prose updated to `packages/nla-penny-post/`
- `install/CLAUDE-intent.md` — Sibling reference updated
- `README.md` — Installing-in-your-NLA section updated with submodule-add command and new directory tree
- `app/overview.md` — First NLA Extension directory tree updated
- `CLAUDE.md` — Penny Post Skills section header corrected; `/synthesize` clarified as self-maintenance skill
- `reference/feedback-log.md` — Issue #9 removed (archived)
- `reference/feedback-log-archive.md` — Issue #9 added with resolution
- `reference/friction-log.md` — `/synthesize` + 2026-02-23 entries removed (archived)
- `reference/friction-log-archive.md` — both entries added

**Pending:**
- Commit Phase 2
- Post follow-up comment on Issue #9 closing the loop
- Unrelated pending: feedback log has 3 remaining items (Issues #10.1, #10.2, #4.3);
  Issue #4.3 is a passive watch item
- Deferred: `app/config-spec.md`'s Framework Path option may be functionally obsolete
  after packages/ migration
- Deferred: `.claude/settings.local.json` still contains symlink-related permission
  entries from the Issue #11 retest; cleanup is separate
- Push to origin (penny post has 2 unpushed commits after Phase 2 commit)

**Rollback:** `pre-update-2026-04-16` branch captures pre-migration state (before
Phase 1). Phase 1 commit `9773310` preserves state between phases.
