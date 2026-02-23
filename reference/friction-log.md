# Friction Log

Running log of learnings from penny post operation and human feedback. Each entry captures something worth remembering — problems, surprises, or things that worked well.

---

## How to Use This Log

**When to add entries:**
- After observing a correction or gap in triage, synthesis, or mail-checking
- When you notice a pattern across multiple processing sessions
- When something works surprisingly well
- When something fails unexpectedly

**Entry types:**
- `processing` — How the penny post handled a letter or synthesis
- `process` — How the workflow functioned
- `documentation` — Clarity or gaps in the docs

**Severity includes positive:** Capture what works, not just what breaks.

---

## Entry Format

```markdown
## [DATE] — [CONTENT or CONTEXT]

**Type:** processing | process | documentation
**Severity:** positive | minor | major
**Task:** [which task]
**Status:** pending | resolved | deferred | wont-fix

**Observation:**
[What happened or was noticed]

**Before:** [What the penny post produced]
**After:** [What the human wanted]

**Confirmed reason:**
[The human's explanation — their words, not a summary]

**Generalizable:** [yes | no | partially]
[Under what conditions does this apply?]

**Affected documentation:**
[Which app/ file and section would need to change]

**Proposed fix:**
[Specific enough for /maintain to act on]

**Notes:**
[Additional context, related entries, patterns noticed]
```

Not every entry needs all fields. The essentials are: Observation, Type, Severity, Status. Include what you have; don't force what you don't.

**When `/maintain` resolves an entry**, it updates the Status field:
```markdown
**Status:** resolved
**Resolved:** [DATE] — [brief description of what was changed and where]
```

---

## Entries

*Entries are added chronologically, newest first.*

## 2026-02-23 — Letter delivered to boxes/ instead of GitHub Issues

**Type:** process
**Severity:** minor
**Task:** write-letter (from framework session)
**Status:** resolved
**Resolved:** 2026-02-23 — Resubmitted as Issue #8. Original file removed from boxes/.

**Observation:**
A framework maintenance session (2026-02-23) drafted a letter for the penny post using
/write-letter but saved it to `boxes/penny-post/` instead of submitting via `gh issue create`.
The session log says "Penny post letter delivered to `boxes/penny-post/`" — the old delivery
mechanism that was eliminated in the architectural reframing.

**Confirmed reason:**
The letter was drafted from the framework's session, not a penny post session. The framework
AI used the pre-elimination boxes/ pattern as the delivery target. The penny post's
write-letter.md clearly specifies GitHub Issues as the submission channel (Step 4), but the
cross-project session didn't have the penny post's updated architecture fully loaded.

**Generalizable:** partially
This is a transition-period issue — the boxes/ directory still exists with historical files,
making it look like a valid destination. As more sessions use the correct flow, this should
fade. Worth watching for recurrence.

**Affected documentation:**
No penny post doc change needed — write-letter.md already specifies the correct flow. The
framework's write-letter wrapper or the AI's understanding of cross-project delivery is
the gap.

---

## Patterns to Watch

*Recurring themes that may need deeper attention:*

1. **Triage consistency** — Do similar items from different sources get similar verdicts? Watch for drift.

2. **Annotation clarity** — Are annotations useful to the letter author? Do they provide enough rationale?

3. **Synthesis timing** — When is the right moment to synthesize? Watch for premature synthesis (too few data points) or missed synthesis (patterns obvious but not captured).

---

*This log is maintained by the `/friction-log` skill (which creates entries from any context) and the `/maintain` skill (which resolves and archives them). Resolved entries are moved to `friction-log-archive.md`.*
