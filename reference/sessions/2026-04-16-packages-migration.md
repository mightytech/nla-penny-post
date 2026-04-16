# Maintenance Session: Packages Migration (Phase 1)

**Date:** 2026-04-16
**Status:** Phase 1 Complete (Phase 2 pending)

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

- None this session (resolved 2026-02-23 entry remains pending archival; separate)

## Debrief

- [captured at /close]

## State at Close

**Phase 1 complete, awaiting verification and commit.** 21 files changed (including
new `.gitmodules` and `packages/nla-framework` submodule pointer). All thin-wrapper
targets verified to resolve. Working tree has uncommitted Phase 1 changes.

**Pending:**
- Commit Phase 1 (recommended discrete commit before starting Phase 2)
- Phase 2 — update penny post's own install intents (`install/install.md`,
  `install/skills-intent.md`, `install/CLAUDE-intent.md`, `install/structure-intent.md`,
  `install/package-intent.md`) plus the README and app/overview sections describing
  how OTHER NLAs install penny post, so penny post ships the `packages/` convention
- Decide fate of `app/config-spec.md`'s Framework Path option (likely obsolete)
- Unrelated pending: feedback log has 4 items (Issues #9, #10.1, #10.2, #4.3); friction
  log has one resolved entry awaiting archival

**Rollback:** `pre-update-2026-04-16` branch captures pre-migration state.
