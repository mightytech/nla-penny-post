# Feedback Log Archive

Resolved feedback log entries, moved here from `feedback-log.md` during `/maintain` sessions. This keeps the active feedback log lean while preserving history for pattern analysis.

**How entries get here:** When `/maintain` resolves a feedback log entry, it moves the complete entry (including the `**Resolved:**` line) from the active log to this archive.

**Searching:** Use grep to search this archive when looking for historical patterns.

---

## Entries

*Archived entries in reverse chronological order.*

## 2026-02-17 — Record mailbox elimination as architectural pattern

**Source:** [Issue #4](https://github.com/mightytech/nla-penny-post/issues/4), Item 1
**Verdict:** Accept — already implemented
**Status:** resolved
**Resolved:** 2026-02-17 — Mailbox eliminated in this session. All docs updated.
Design rationale captures the reasoning.

---

## 2026-02-17 — "Do we need this at all?" as architectural decision pattern

**Source:** [Issue #4](https://github.com/mightytech/nla-penny-post/issues/4), Item 2
**Verdict:** Accept as general pattern

**What to do:**
Note in design rationale or NLA writings that architectural decisions compound —
structures that were load-bearing before a change may become dead weight after.
Periodically re-evaluate whether existing structures still serve a purpose.

**Why it was accepted:**
The mailbox survived the first reframing intact, but the decisions made during that
reframing (triage NLA-side, synthesis NLA-side) had hollowed out its purpose. It took
a second session to notice. This is a general pattern worth remembering.

**Status:** resolved
**Resolved:** 2026-02-17 — Captured in session log (decision #17) and in
nla-writings/the-case-for-nlas.md (Two Kinds of NLA Innovation section).

---

## 2026-02-17 — Add source attribution footer convention to write-letter.md

**Source:** [boxes/penny-post/2026-02-17-end-to-end-testing.md](../boxes/penny-post/2026-02-17-end-to-end-testing.md), Item 2
**Verdict:** Accept
**Status:** resolved
**Resolved:** 2026-02-17 — Added footer convention and error handling to write-letter.md Step 4.

---

## 2026-02-17 — Acknowledge two-way conversation in check-feedback.md

**Source:** [boxes/penny-post/2026-02-17-end-to-end-testing.md](../boxes/penny-post/2026-02-17-end-to-end-testing.md), Item 3
**Verdict:** Accept
**Status:** resolved
**Resolved:** 2026-02-17 — Added dialogue note after Step 2 in check-feedback.md.

---

## 2026-02-17 — Add concrete intake channel config to config-spec.md and check-feedback.md

**Source:** [boxes/penny-post/2026-02-17-end-to-end-testing.md](../boxes/penny-post/2026-02-17-end-to-end-testing.md), Item 4
**Verdict:** Accept (refined)
**Status:** resolved
**Resolved:** 2026-02-17 — Added Intake Channel section to config-spec.md (repo URL,
label filter, state filter with defaults). Updated check-feedback.md Step 1 with
concrete discovery mechanics and default behavior.
