# Synthesize

Distill patterns across feedback into focused knowledge documents.

---

## Purpose

Synthesis creates the institutional memory layer. When feedback from different sources,
different contexts, different times points to the same pattern, synthesis extracts and
crystallizes that pattern into a standalone document that's easier to reference than
reading every original source.

Like triage, synthesis happens in the NLA's own session, where the AI has full project
context to assess whether a pattern is meaningful.

## Input

- A set of feedback log entries or intake items to synthesize across (can be specified
  or discovered)
- A theme or question to synthesize around ("what do we know about persistence?",
  "what patterns have emerged around startup?")

## Output

- A synthesis document (markdown file) capturing the cross-source pattern
- References back to every contributing source
- Confidence assessment based on breadth and depth of evidence

---

## Prerequisites

Before running this task, read:

1. **This NLA's own docs** — You're already in the NLA's session. Its overview, design
   rationale, and task docs provide the context for assessing whether patterns are
   meaningful.
2. **[Voice and Values](shared/voice-and-values.md)** — How to communicate about patterns.
3. **[Common Patterns](shared/common-patterns.md)** — Cross-reference conventions.
4. **[Output Spec](shared/output-spec.md)** — Synthesis output format.

---

## Processing Steps

### Step 1: Gather Sources

Identify all relevant sources:
- Feedback log entries (pending and archived) on the theme
- Original intake items (GitHub Issues, etc.) for full context when needed
- Friction log entries on related topics
- Previous synthesis documents (to update rather than duplicate)

### Step 2: Extract and Compare

For each source, extract the relevant observations:
- What was observed?
- In what context? (What kind of source, what situation?)
- What was the author's confidence?
- What was the triage verdict (if triaged)?

Compare across sources:
- Where do observations agree?
- Where do they differ? Is the difference context-dependent or contradictory?
- What's the combined confidence?

### Step 3: Distill the Pattern

Write the synthesis document following the output spec format:
- Name the pattern clearly
- Describe it in a way that's useful without reading every source
- Include enough evidence that the pattern feels grounded, not asserted
- Note where the pattern is strong vs. where it's still emerging
- Flag open questions or areas where more evidence would help

### Step 4: Cross-Reference

- Link back to every contributing source (feedback log entries, GitHub Issues, friction log entries)
- Note in the feedback log entries that they've been synthesized
  ("This item contributed to synthesis: [link]")
- If updating an existing synthesis, note what changed and why

---

## Judgment Calls

### When Is Synthesis Warranted?

Not every pair of related items needs synthesis. Synthesis is valuable when:
- Three or more sources point to the same gap or pattern
- Two sources describe the same pattern from meaningfully different contexts
- A pattern has been deferred pending more evidence, and that evidence has arrived
- The maintainer needs a concise reference instead of reading multiple full letters

One letter about persistence is a data point — file it. Two letters about persistence
from different contexts is a signal — consider synthesis. Three is strong enough to
synthesize confidently.

### Synthesis vs. Summary

A summary compresses one letter. Synthesis extracts a pattern across letters. The test:
does the output say something that no individual letter says on its own? If yes, it's
synthesis. If it's just a shorter version of one letter, it's a summary.

### Where Synthesis Documents Live

Synthesis documents live in the NLA's `reference/` directory alongside the feedback
and friction logs they draw from.

Naming: `synthesis-[topic]-[date].md` — e.g., `reference/synthesis-persistence-patterns-2026-03-01.md`.

---

## Customization

NLA creators can customize synthesis:

- **Synthesis thresholds** — adjust how much evidence is needed before suggesting
  synthesis via config.md
- **Output format** — modify the synthesis document structure in output-spec.md
- **Full replacement** — replace this with a custom synthesis flow

---

*Synthesis is the highest-value output of accumulated feedback — it turns individual
observations into institutional knowledge. Don't rush it; don't force it before there's
enough material.*
