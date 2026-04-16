# Installed Packages

Packages installed in this NLA, maintained by `/install` and `/update`.

Each entry records what package was installed, when, what state the package was in, and what changes were made. This log is how `/update` knows what's current and what needs changing.

---

## NLA Framework

**Installed:** Pre-convention tracking (original `/create-app` generation)
**Source:** `packages/nla-framework/` (git submodule; migrated 2026-04-16 from sibling `../nla-framework/`)

Original project generated via `/create-app` before the framework had formal package tracking.

### Convention Update — 2026-02-18

**Applied by:** Framework maintainer (manual, from framework side)
**Reason:** Framework removed scaffold directory and established intent files as single source of truth. Existing projects needed alignment with current conventions.

**Skill wrappers added:**
- `.claude/skills/install/SKILL.md` — thin wrapper delegating to `core/skills/install.md`
- `.claude/skills/update/SKILL.md` — thin wrapper delegating to `core/skills/update.md`

**Skill wrappers modified:**
- `.claude/skills/startup/SKILL.md` — added `disable-model-invocation: true` frontmatter

**Reference files created:**
- `reference/feedback-log-archive.md` — empty archive
- `reference/installed-packages.md` — this file

**CLAUDE.md updated:**
- Added `/install` and `/update` to Framework Skills table

**Note:** This project already had most framework conventions in place (config infrastructure, feedback-log, validate, preferences, friction-log). The gaps were limited to the newer /install and /update skills, the startup frontmatter flag, and package tracking infrastructure.

### Updated 2026-02-21

**Package state:** 05eb69e

| Intent File | What Changed | Changes Made |
|-------------|-------------|--------------|
| skills-intent.md | `/plan` skill removed from framework; `/export` skill added | Deleted `.claude/skills/plan/SKILL.md`. Created `.claude/skills/export/SKILL.md`. Updated CLAUDE.md, `app/overview.md`, and `reference/system-status.md` skills tables (removed /plan, added /export). |

**Notes:** Several core file changes (maintenance learnings, optional output-spec, startup extensibility, broadened Cardinal Rule) propagate automatically via `../nla-framework/` — no project changes needed. Session log reference to /plan in `reference/sessions/2026-02-16-first-review.md` left as historical record.

### Updated 2026-02-23

**Package state:** c4dc338

| Intent File | What Changed | Changes Made |
|-------------|-------------|--------------|
| CLAUDE-intent.md | Added "Values are visible" principle; startup references "values" instead of "voice"; added "Don't override values" guidance | Added "Values are visible" to CLAUDE.md Grounding Principles. Updated startup description to reference "values, patterns" instead of "voice, patterns". |
| skills-intent.md | New `/check-updates`, `/think`, `/debrief` skills; `/update` description broadened; `/unpack` moved to process helpers; voice-and-values prerequisite references updated | Created `.claude/skills/check-updates/SKILL.md`, `.claude/skills/think/SKILL.md`, `.claude/skills/debrief/SKILL.md`. Updated `.claude/skills/update/SKILL.md` description. Added all new skills to CLAUDE.md, `reference/system-status.md`. `/unpack` not applicable (was never installed). |
| structure-intent.md | `voice-and-values.md` split into `values.md` and `voice.md` | Split `app/shared/voice-and-values.md` into `app/shared/values.md` and `app/shared/voice.md`. Updated task doc prerequisites in `write-letter.md`, `check-feedback.md`, `synthesize.md`. Updated directory trees in `app/overview.md` and `README.md`. Deleted old `voice-and-values.md`. |
| package-intent.md | New file — describes how NLA packages differ from domain projects | No project changes needed — this is reference documentation for future `/create-package` use. |

**Notes:** Core file changes (startup friction log awareness, friction-log session awareness, maintain /think reference, validate values consistency, /unpack removal from core) propagate automatically via `../nla-framework/`. `/unpack` was never installed in this project — no action needed. Historical references to `voice-and-values.md` in `reference/feedback-log-archive.md` and `reference/sessions/` left as historical record.

### Updated 2026-03-08

**Package state:** db32216

| Intent File | What Changed | Changes Made |
|-------------|-------------|--------------|
| skills-intent.md | New `/close` and `/guide` skills | Created `.claude/skills/close/SKILL.md` and `.claude/skills/guide/SKILL.md`. Added both to CLAUDE.md, `app/overview.md`, and `reference/system-status.md` skills tables. |
| install.md | New Permissions section declaring filesystem access patterns | Added `Read(../nla-framework/**)`, `Bash(git:*)`, `Bash(ls:*)`, `Bash(test:*)` to `.claude/settings.local.json`. |
| structure-intent.md | `settings.local.json` documented as standard structure; `overview.md` description broadened | No structural changes needed — settings file already existed; description update is minor. |
| package-intent.md | Expanded Permissions Section documentation for package authors | No project changes needed — reference documentation for package creation. |

**Notes:** Core file changes (Working Rhythms in foundations, `/close` delegation in `/maintain`, `/guide` references in `/startup` and `/maintain`, permission checks in `/validate` and `/startup`) propagate automatically via thin wrappers. README already references `/guide`. Uncommitted changes (README.md, CONTRIBUTING.md) were present at update time — rollback branch `pre-update-2026-03-08` preserves committed state only.

### Updated 2026-04-16

**Package state:** a754ae3 (now tracked as submodule at `packages/nla-framework/`)

| Intent File | What Changed | Changes Made |
|-------------|-------------|--------------|
| structure-intent.md | `packages/` submodule replaces sibling directory convention | Added nla-framework as git submodule at `packages/nla-framework/`. Created `.gitmodules`. |
| skills-intent.md | All wrapper paths changed from `../nla-framework/` to `packages/nla-framework/`; new `/session-checkpoint` skill; `/export` description updated | Rewrote 13 existing thin wrappers in `.claude/skills/` with new paths. Updated `/export` description. Created `.claude/skills/session-checkpoint/SKILL.md`. Added `/session-checkpoint` to CLAUDE.md skills table. |
| CLAUDE-intent.md | Framework location referenced as `packages/nla-framework/` | Updated Environment section in CLAUDE.md (framework path and Key Files table). |
| install.md | `Read(../nla-framework/**)` permission no longer needed (reads are in-project) | Removed `Read(../nla-framework/**)` from `.claude/settings.local.json`. |
| package-intent.md | Packages convention changes affecting package authors | Deferred to Phase 2 — penny post is itself a package and its own install intents need updating to instruct other NLAs on the new `packages/` convention. |

**Docs updated:** `README.md` (Prerequisites + Running directly — now reference submodule), `app/overview.md` (foundations link + document hierarchy — framework path updated; sections describing how other NLAs install penny post left for Phase 2), `app/config-spec.md` (Framework Path default updated to `packages/nla-framework/`).

**Notes:** Phase 1 of packages/ migration — penny post as an installing NLA. Phase 2 (deferred) will update penny post's own install intents (`install/*.md`) so it ships the new convention to NLAs that install it, and will update the README/overview sections describing how other NLAs set up penny post. Core file changes in framework (foundational principles, coherence validation, `/export` view-source rewrite, lib/export.py) propagate automatically via the submodule. The `/session-checkpoint` core skill was promoted from facebook-moderation — thin wrapper now installed. Rollback branch `pre-update-2026-04-16` preserves pre-migration state.

---

<!-- /install and /update maintain this file. Each package gets a section with install
     history and update records. Don't remove old entries — they tell the full story. -->
