# Installed Packages

Packages installed in this NLA, maintained by `/install` and `/update`.

Each entry records what package was installed, when, what state the package was in, and what changes were made. This log is how `/update` knows what's current and what needs changing.

---

## NLA Framework

**Installed:** Pre-convention tracking (original `/create-app` generation)
**Source:** `../nla-framework/`

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

---

<!-- /install and /update maintain this file. Each package gets a section with install
     history and update records. Don't remove old entries — they tell the full story. -->
