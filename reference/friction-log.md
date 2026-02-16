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

---

## Patterns to Watch

*Recurring themes that may need deeper attention:*

1. **Triage consistency** — Do similar items from different sources get similar verdicts? Watch for drift.

2. **Annotation clarity** — Are annotations useful to the letter author? Do they provide enough rationale?

3. **Synthesis timing** — When is the right moment to synthesize? Watch for premature synthesis (too few data points) or missed synthesis (patterns obvious but not captured).

---

*This log is maintained by the `/friction-log` skill (which creates entries from any context) and the `/maintain` skill (which resolves and archives them). Resolved entries are moved to `friction-log-archive.md`.*
