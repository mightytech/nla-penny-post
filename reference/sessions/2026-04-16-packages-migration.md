# Maintenance Session: Packages Migration (Phase 1)

**Date:** 2026-04-16
**Status:** Complete

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

Refined conclusions from the `/debrief` conversation:

- **Validate mode selection should be offered, not defaulted.** I ran structural
  validation by default and only reached architecture + coherence when the
  maintainer prompted twice. For update-scale work (which touches intent files
  and cross-references), architecture review is the mode that matches the
  territory. Framework-feedback material — `/update`'s closing step could
  suggest appropriate validation modes based on what the update touched, not
  just "run structural."

- **Two-phase migration with mid-point checkpoint was the right pattern.** The
  maintainer's suggestion to split into Phase 1 (penny post as installing NLA)
  and Phase 2 (penny post as package), with verify-and-commit between, was
  cleaner than bundling. Worth preserving as a pattern: when work has dual-hat
  concerns, phase-with-checkpoint beats bundle.

- **Tagging wasn't proactively suggested.** After Phase 2 commit, the maintainer
  prompted "we should probably create a tag." `/update`'s own docs describe the
  tag-vs-HEAD choice in its fetch logic, but nothing in `/update`'s closing step
  suggests tagging when an update represents a stable milestone. Framework-
  feedback material.

- **Architecture review caught what structural couldn't.** Structural check
  found the `/synthesize` surface symptom (table mismatch between CLAUDE.md and
  overview). Architecture review would have caught the deeper consistency
  issue (how `/synthesize` is described across three files). Both have value,
  but structural tests mechanics while architecture tests design.

- **CWD spot-check before push was healthy.** The maintainer paused to verify
  working directory before the consequential push action. Good pre-flight
  instinct; no issue to fix, worth noting as a pattern for maintainers working
  across multiple related projects.

The Shippability distinction (framework-internal vs consumer-facing content)
emerged during the letter-drafting conversation and became [nla-framework#22](https://github.com/mightytech/nla-framework/issues/22).
That insight didn't exist at the start of the session — it came from the
back-and-forth of trying to explain the cross-reference annoyance cleanly.

## State at Close

### Context for next time

- **Penny post v0.0.1 is released** (tag at commit `1ef501e`, pushed to origin).
  This is penny post's first tagged release — aligned with framework's
  `packages/` submodule convention.
- **Framework is a submodule at `packages/nla-framework/` pinned at `a754ae3c`.**
  The sibling `../nla-framework/` still exists at the OS level but penny post
  no longer references it.
- **Origin remote switched to SSH alias** (`github-mightytech:`) during the
  session, matching the framework's convention.
- **Rollback branch `pre-update-2026-04-16`** preserves pre-migration state if
  needed.
- **Shippability question outstanding upstream** — see
  [nla-framework#22](https://github.com/mightytech/nla-framework/issues/22).
  When the framework codifies the consumer-facing vs framework-internal
  distinction, penny post may need to apply the same convention to its own
  commits.

### Decisions awaiting implementation

- **Cleanup of `.claude/settings.local.json`** — the `dependencies/` symlink-
  related permission entries from the Issue #11 retest are now dead
  (`mkdir -p dependencies`, two `ln -s ...` entries). Safe to remove. Left in
  place because cleanup is unrelated to the migration.
- **Fate of `app/config-spec.md`'s Framework Path option** — with submodules,
  the framework path is effectively fixed at `packages/nla-framework/`. The
  config option may be functionally dead but wasn't removed in Phase 1 to avoid
  scope creep. Worth a deliberate decision in a future session.

### Pending items (unrelated to this session)

- **Feedback log**: Issue #10.1 (README "What Is an NLA?" paragraph),
  Issue #10.2 (CONTRIBUTING blast radius), Issue #4.3 (triage calibration
  watch item — passive monitoring).
- **Friction log**: `/synthesize` wording variance (improve-class, pending)
  from 2026-04-16 architecture review.

### Where to pick up

Three natural starting points:
1. **Apply to framework** — do the framework-side packages/ migration (update
   its references to penny post and process-helpers). That's the task the
   letter to [nla-framework#22](https://github.com/mightytech/nla-framework/issues/22)
   anticipates; the shippability convention question is downstream of it.
2. **Process remaining feedback items** — Issues #10.1/#10.2 are straightforward
   README/CONTRIBUTING edits that don't depend on anything else.
3. **Cleanup** — `settings.local.json` dead entries, config-spec Framework Path
   decision.
