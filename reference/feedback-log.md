# Feedback Log

Accepted items from external feedback, waiting for implementation. Each entry captures
what was accepted, why, and where to find the full context.

The feedback log is the sibling of the friction log:
- **Friction log** — things *you* noticed while working
- **Feedback log** — things *others* noticed that you agreed with

Both feed into `/maintain`. Both are queues of actionable items.

---

## How to Use This Log

**When items are added:**
- After triaging feedback (via `/check-feedback` or any external feedback tool), accepted
  items are deposited here with their verdict rationale and a reference to the source.

**When items are resolved:**
- During `/maintain` sessions, the maintainer reviews pending items and implements them.
  Resolved entries are moved to `feedback-log-archive.md`.

**At session start:**
- `/maintain` checks this log alongside the friction log to surface what's waiting
  for attention.

---

## Entry Format

```markdown
## [DATE] — [Brief description of the accepted item]

**Source:** [Link to GitHub Issue or intake item]
**Verdict:** [Accept / Adapt — and the reasoning]
**Status:** pending | in-progress | resolved

**What to do:**
[Concrete description of the change needed]

**Why it was accepted:**
[The rationale from triage — why this matters, what it improves]

**Resolved:** [DATE] — [brief description of what was changed and where]
```

Not every entry needs all fields. The essentials are: Source, What to do, Why it was
accepted, Status. Include what you have; don't force what you don't.

---

## Entries

*Entries are added chronologically, newest first.*

## 2026-02-23 — Write-letter should support friction log compilation

**Source:** [Issue #8](https://github.com/mightytech/nla-penny-post/issues/8)
**Verdict:** Accept
**Status:** resolved
**Resolved:** 2026-02-23 — Added "Compiling friction log entries" subsection to `app/write-letter.md` Step 1 (Gather Material). Covers reading pending entries, grouping by recipient, reframing from internal observation to external feedback.

**What to do:**
Add guidance to `app/write-letter.md` for a "compile my friction log entries" starting point.
When invoked with this intent, write-letter should: read pending friction log entries, group
by likely recipient (framework, package maintainers, etc.), draft one letter per recipient
compiling relevant entries with context, then follow the normal review/approve/deliver flow.
Fits naturally in Step 1 (Gather Material) or as a recognized starting point pattern.

**Why it was accepted:**
Clean division of responsibility — penny post can assume every NLA has a friction log;
the framework can't assume every NLA has penny post. The framework side (startup awareness,
session boundary nudges) is already built. This completes the path from observation to
delivery. Capability addition, not structural change.

---

## 2026-02-17 — Monitor whether feedback log + GitHub Issues suffice for triage calibration

**Source:** [Issue #4](https://github.com/mightytech/nla-penny-post/issues/4), Item 3
**Verdict:** Accept with caveat — medium confidence, revisit after more triage sessions

**What to do:**
After several more triage sessions, assess whether the feedback log archive plus
GitHub Issues provide enough historical context for the AI to calibrate triage
decisions. If not, consider adding optional local archives of full letter text.

**Why it was accepted:**
The architecture assumes the feedback log archive ("what was accepted and why") plus
the original GitHub Issue (retrievable via `gh`) is sufficient. This is untested
beyond one session. Worth watching.

**Status:** pending

---

*This log is populated by `/check-feedback` (or any external feedback tool) and consumed
by `/maintain`. Resolved entries are moved to `feedback-log-archive.md`.*
