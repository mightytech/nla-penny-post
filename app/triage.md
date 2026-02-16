# Triage

Process incoming feedback letters — assess each item, record verdicts with rationale, and identify what's ready to act on.

---

## Purpose

Triage takes a feedback letter and produces per-item assessments. The goal is not to implement changes — it's to decide what deserves implementation, what needs more information, and what should be declined or deferred, with clear reasoning for each.

## Input

- A feedback letter (markdown file in a box)
- Optionally: specific items to focus on, or a previous partial triage to continue

## Output

- The letter annotated with per-item verdicts and rationale
- A triage summary (annotation at the top of the letter or as conversation)
- Optionally: sub-letters splitting items by theme or actionability

---

## Prerequisites

**Before running this task, read:**

1. **[NLA Foundations](../nla-framework/core/nla-foundations.md)** — Understand the framework you're triaging feedback for
2. **[Voice and Values](shared/voice-and-values.md)** — How to communicate about feedback
3. **[Common Patterns](shared/common-patterns.md)** — Annotation conventions, sub-letter creation
4. **[Output Spec](shared/output-spec.md)** — Triage output format

---

## Processing Steps

### Step 1: Read the Full Letter

Read the entire letter before assessing any item. Understand:
- What kind of NLA sent this? What's their context?
- How many items? What themes emerge?
- Are items interconnected or independent?
- What's the author's overall confidence level?

Don't start triaging from the top — later items can change how you interpret earlier ones.

### Step 2: Check for Context

Before assessing items:
- Are there previous letters from this source? Read them for context.
- Are there existing letters from other sources on similar topics? Note connections.
- Are there framework design rationale entries relevant to these items?
- Has the framework already addressed any of these items?

### Step 3: Assess Each Item

For each item, determine a verdict:

- **Accept** — The observation is sound, the recommendation is actionable, and there's enough evidence to act. Note where in the framework the change would land and what the blast radius is.
- **Adapt** — The observation is sound but the recommendation needs modification. Explain what you'd change and why.
- **Defer** — The observation may be valid but there isn't enough evidence or the timing isn't right. Be specific about what would trigger revisiting: "defer until a second NLA reports this" or "defer until the persistence pattern is established."
- **Decline** — The observation doesn't apply, contradicts framework principles, or has been considered and rejected. Preserve the reasoning — this is the most important rationale to record.

These are convenient defaults, not an enum. "Accept the principle, defer the specific implementation" is a valid verdict.

### Step 4: Check for Interconnections

After individual assessment, look across items:
- Do accepted items form a coherent theme? Note this — it may inform implementation order.
- Does the verdict on one item affect another? Flag the dependency.
- Are there items that should be combined or split? Use the sub-letter pattern if helpful.

### Step 5: Record and Summarize

Annotate the letter with per-item verdicts (using the annotation convention). Add a triage summary that helps someone quickly understand the outcome without reading every annotation.

If the letter is large, consider creating sub-letters for different verdict groups (quick wins, needs discussion, declined with rationale).

---

## Judgment Calls

### How Much Evidence Is Enough?

One NLA's observation is a data point. Two NLAs reporting the same pattern is a signal. Three is a strong signal. But a single observation with high confidence and clear reasoning can be enough — especially if it identifies a gap rather than proposing a specific solution.

The whitepapers and design documents in `../nla-whitepapers/` (if available) provide additional data points for patterns that haven't been observed in production yet.

### When to Split a Letter

Split when it helps processing — not as a default. Good reasons to split:
- Quick wins that can be processed immediately while complex items get deeper triage
- Items that need different people or different sessions to resolve
- Themes that would benefit from focused conversation

### Triage Across Sessions

A complex letter doesn't have to be triaged in one session. Record partial triage progress in annotations. The next session reads the annotations and continues.

---

*The goal is thoughtful assessment, not speed. A well-reasoned "defer" is more valuable than a hasty "accept."*
