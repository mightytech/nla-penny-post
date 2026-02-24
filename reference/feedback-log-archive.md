# Feedback Log Archive

Resolved feedback log entries, moved here from `feedback-log.md` during `/maintain` sessions. This keeps the active feedback log lean while preserving history for pattern analysis.

**How entries get here:** When `/maintain` resolves a feedback log entry, it moves the complete entry (including the `**Resolved:**` line) from the active log to this archive.

**Searching:** Use grep to search this archive when looking for historical patterns.

---

## Entries

*Archived entries in reverse chronological order.*

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

## 2026-02-23 — Update check-feedback.md "isn't built yet" caveat about close-the-loop

**Source:** [Issue #5](https://github.com/mightytech/nla-penny-post/issues/5)
**Verdict:** Accept — factual update, the framework now handles this
**Status:** resolved
**Resolved:** 2026-02-23 — Updated close-the-loop paragraph in `app/check-feedback.md` to note the framework's `/maintain` skill now handles implementation follow-up comments.

**What to do:**
Update the paragraph in `app/check-feedback.md` (lines 144-150) that says the close-the-loop
step "isn't built yet." The framework's `/maintain` skill now includes step 8: post a
follow-up comment when accepted items are implemented. Update the note to reflect current state.

**Why it was accepted:**
The documentation is now inaccurate. The framework's maintain skill handles this step.
Straightforward factual correction.

---

## 2026-02-23 — Add LLM self-aware diagnostic guidance to write-letter

**Source:** [Issue #7](https://github.com/mightytech/nla-penny-post/issues/7)
**Verdict:** Accept — well-reasoned quality improvement
**Status:** resolved
**Resolved:** 2026-02-23 — Added "Diagnostic Richness for Behavioral Friction" subsection to `app/write-letter.md` Judgment Calls. Covers instruction chains, exact quotes, proposed doc changes, and confidence flagging. Complements the framework's friction-log diagnostic guidance.

**What to do:**
Add guidance to `app/write-letter.md` (Step 2 and/or Judgment Calls) about enriching
letter items that describe behavioral friction: include instruction chains, use exact
quotes from docs (not paraphrases), propose documentation changes when possible, and flag
confidence honestly about reconstructed vs. traced reasoning. Consider noting the
"diagnostically rich NLA feedback" concept in voice-and-values or common-patterns.

**Why it was accepted:**
Aligns with penny post values (rationale over verdict, transparency). The framework has
already implemented the friction-log side; this completes the pipeline. The risk analysis
(confabulation, context decay, incomplete proposals) is sound with clear mitigations.
Implementation is documentation enrichment, not structural change.

---

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
