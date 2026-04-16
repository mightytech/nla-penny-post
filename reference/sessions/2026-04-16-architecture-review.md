# Architecture Review: Penny Post

**Date:** 2026-04-16
**Triggered by:** Phase 1+2 packages/ migration — restructuring the sibling→submodule
convention across thin wrappers, install intents, and user-facing docs.

---

## Document Chain

Session start → `/startup` loads:
- `packages/nla-framework/core/nla-foundations.md` (framework)
- `app/overview.md`
- `app/shared/values.md`
- `app/shared/common-patterns.md`
- `app/shared/output-spec.md` (if present — it is)
- `config.md` (if present — it is)
- `reference/friction-log.md` (for pending-entry check)

Task invocation (via wrappers in `.claude/skills/`):
- Wrapper → `packages/nla-framework/core/skills/[skill].md` (framework skills)
- Wrapper → `app/[skill].md` (penny post skills: check-feedback, write-letter, synthesize)

Task docs reference:
- `app/shared/values.md`, `app/shared/voice.md`, `app/shared/common-patterns.md`,
  `app/shared/output-spec.md` (as task-level prerequisites)

Maintenance mode additionally reads:
- `reference/design-rationale.md`, `reference/friction-log.md`,
  `reference/feedback-log.md`, `reference/installed-packages.md`

---

## Findings

### Fix
*(None — nothing that will cause incorrect behavior.)*

### Improve

- **`/synthesize` categorization wording differs across docs** — Consistency
  - `CLAUDE.md`: "penny post's own self-maintenance skill — it operates on the penny post's accumulated feedback and isn't shipped to other NLAs"
  - `app/overview.md` (Skills for Self-Maintenance table entry): "penny-post-specific, not installed in other NLAs"
  - `reference/system-status.md`: "penny-post-specific, not installed in other NLAs"
  - All three say the same thing but with different phrasing. The substance is consistent; only the wording varies. Low priority — a single canonical phrasing would read better but is not causing drift.

### Note

- **CLAUDE.md explanatory paragraph after Penny Post Skills table** — Layer boundaries
  - Phase 2 added a clarifying sentence after the skills table: "`/check-feedback` and `/write-letter` are the capabilities penny post installs in other NLAs as thin wrappers. `/synthesize` is penny post's own self-maintenance skill…"
  - This is meta-commentary about installation in a file that's primarily a runtime identity/config. Arguably belongs in `app/overview.md`, which already has a similar distinction. Kept in CLAUDE.md because removing it would leave the table ambiguous. Acceptable as-is; could be trimmed if CLAUDE.md gets noisier in future.

- **Multiple directory-tree depictions in `app/overview.md`** — Consistency/redundancy
  - Trees appear at lines ~22 (extension structure), ~190 ("For Humans" install steps), and ~216 ("Document Hierarchy"). All now show the `packages/` convention.
  - Each tree serves a different purpose (integration view, install steps, full hierarchy), so the overlap is intentional rather than redundant. Worth knowing if future edits need to keep them in sync.

- **`install/install.md` "What's in This Directory" table matches reality** — Cross-reference integrity
  - The table lists `CLAUDE-intent.md` and `skills-intent.md`. Both files exist. The framework's `package-intent.md` recommends this exact inventory for packages. Consistent.

- **Write-letter prerequisites don't include `output-spec.md`** — Prerequisite sufficiency
  - `check-feedback.md` and `synthesize.md` both list `output-spec.md` as a prerequisite; `write-letter.md` does not. This appears intentional — `/write-letter` produces a letter for submission (not a penny-post-formatted triage artifact), so output-spec doesn't apply. Noting because it could look like an oversight.

---

## Summary

**5 findings: 0 fix, 1 improve, 4 note. Overall assessment: the system is coherent
after Phase 1+2.**

The packages/ migration narrative is told consistently across CLAUDE.md, README, app/overview.md,
install intents, and reference files. Skill tables agree (CLAUDE.md ↔ app/overview.md ↔
system-status.md) on which skills exist and how they're categorized. The `/synthesize`
clarification introduced in Phase 2 closes the pre-existing miscategorization and is now
uniform in substance across the three places it appears.

The only improvement-class finding is a minor wording-consistency nit on how `/synthesize`'s
self-maintenance role is phrased — worth standardizing if another session touches these files,
not worth a dedicated fix.
