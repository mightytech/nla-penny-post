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
