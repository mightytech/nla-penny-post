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

## 2026-04-02 — Adopt framework's richer "What Is an NLA?" paragraph in README

**Source:** [Issue #10](https://github.com/mightytech/nla-penny-post/issues/10), Item 1
**Verdict:** Accept
**Status:** pending

**What to do:**
Add the framework's bridging paragraph to penny post's README "What Is an NLA?" section,
between the current explanation and the "two paths for the curious" links. The paragraph:

> This isn't prompt engineering. These are systems with persistence, learning loops, and
> modularity — where boundaries between modules are prose rather than function calls. A spam
> filter becomes "ignore anything that isn't genuine feedback." An update system becomes a
> full package manager — with rollback branches, merge strategies, and dependency resolution
> — expressed entirely in prose.

Take it as-is or near-as-is. The consistency across ecosystem READMEs has value — readers
encountering both projects benefit from recognizing the same concept explained the same way.

**Why it was accepted:**
The paragraph bridges a gap that exists in penny post's README too — the jump from "prose
executed by LLM" to "learn more" is abrupt. Consistency across the ecosystem reinforces
the concept rather than confusing readers. The coupling cost (change one, change both) is
low for a foundational concept that rarely changes.

---

## 2026-04-02 — Add blast radius note to CONTRIBUTING.md

**Source:** [Issue #10](https://github.com/mightytech/nla-penny-post/issues/10), Item 2
**Verdict:** Accept
**Status:** pending

**What to do:**
Add a paragraph to CONTRIBUTING.md's "What makes a good contribution" section explaining
penny post's blast radius: changes to `app/shared/` affect all NLAs using penny post skills,
changes to individual skill files (`app/write-letter.md`, `app/check-feedback.md`) affect
that specific capability. Analogous to the framework's existing blast radius note.

**Why it was accepted:**
Blast radius helps observation-senders calibrate the weight of what they're noticing, even
though they're not editing files directly. "I noticed something in values.md" hits
differently when you understand it shapes every decision across all NLAs. The framework's
CONTRIBUTING has the same contribution model (observations, not PRs) and already includes
this — same reasoning applies here.

---

## 2026-03-08 — Add Permissions section to penny post install manifest

**Source:** [Issue #9](https://github.com/mightytech/nla-penny-post/issues/9)
**Verdict:** Accept
**Status:** pending

**What to do:**
Add a Permissions section to `install/install.md` declaring the filesystem access
patterns that installing NLAs should pre-approve:
- `Read(../nla-penny-post/**)` — read feedback skill logic and conventions
- `Bash(gh:*)` — GitHub CLI for feedback intake and letter submission

**Why it was accepted:**
The framework now supports permission declarations in package manifests. Without
them, every NLA installing penny post gets repeated Claude Code permission prompts
on `/check-feedback` and `/write-letter`. Reported from direct experience during
process-helpers installation. Straightforward gap — the convention exists, penny
post just hasn't adopted it yet.

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
