# Check Feedback

Discover new feedback about this NLA, triage it in context, and archive the results.

---

## Purpose

This is the core penny post skill for NLA maintainers. It combines discovery (what
feedback is new?) with triage (what does it mean for this NLA?) in a single flow. You're
running in the NLA's own session, with full project context — that context is what makes
triage meaningful.

The goal is not to implement changes — it's to assess what deserves implementation, what
needs more evidence, and what should be declined or deferred, with clear reasoning for each.
Triage is the end of the penny post's responsibility. The annotated letter is the handoff
artifact; implementation is the maintainer's work.

## Input

- Which intake channel to check (default: GitHub Issues on this NLA's repo, or as
  configured)
- Optionally: a specific issue/letter to triage, specific items to focus on, or a
  previous partial triage to continue
- Optionally: a previous feedback log to review for calibration

## Output

- A conversational summary of what's new
- Per-item verdicts with rationale (proposed to the human for review)
- After approval: accepted items deposited in the feedback log
- Intake item (e.g., GitHub Issue) updated with triage summary and closed

---

## Prerequisites

Before running this skill, read:

1. **This NLA's own docs** — You're already in the NLA's session, so its overview, design
   rationale, and task docs are your primary context for assessment.
2. **[Voice and Values](shared/voice-and-values.md)** — How to communicate about feedback.
3. **[Common Patterns](shared/common-patterns.md)** — Annotation conventions.
4. **[Output Spec](shared/output-spec.md)** — Output format for triage summaries.

---

## Processing Steps

### Step 1: Discover

Scan the intake channel for new feedback:

- **GitHub Issues (default):** Check all open issues on the repo specified in config
  (or this NLA's repo if not configured). By default, check all open issues regardless
  of labels — the AI judges relevance, not label filters. If config specifies label or
  state filters, apply them.
  Use `gh issue list --repo <repo> --json number,title,createdAt,labels` to discover.
  For reading full issue content, use `gh api repos/<owner>/<repo>/issues/<number>`
  (the REST API is more reliable across token types than the GraphQL-based `gh issue view`).
- **Other channels:** Follow the intake configuration in config.md.
Read `reference/last-checked.md` (if it exists) to determine what's new vs. already seen.

Present what's new in conversational form:
- How many new items
- What they're about (one line each)
- Whether any seem urgent or connect to ongoing work
- Whether there are responses to previous letters

If nothing's new: "No new feedback since last check." Done.

### Step 2: Read in Full Before Assessing

When the maintainer selects feedback to triage, read the entire submission before
assessing any item. Understand:

- Who sent this? What's their context?
- How many items? What themes emerge?
- Are items interconnected or independent?
- What's the author's confidence level?

Don't start triaging from the top — later items can change how you interpret earlier ones.

**Note:** GitHub Issues (and many other intake channels) support dialogue. If the
submission is unclear or you need more context before triaging, you can comment on the
issue to ask the submitter clarifying questions. Triage doesn't have to be one-shot —
it can be a conversation. Read all existing comments on an issue before assessing;
the submitter may have already provided clarification.

### Step 3: Check for Context

Before assessing items, look for connections:

- Are there previous entries from this source in the feedback log archive? Read them.
- Are there existing feedback log entries on similar topics? Note connections.
- Are there design rationale entries relevant to these items?
- Has this NLA already addressed any of these items?

### Step 4: Propose Verdicts

Evaluate each item against this NLA's goals, practices, and documented decisions.
For each, propose a verdict:

- **Accept** — The observation is sound, the recommendation is actionable, and there's
  enough evidence to act. Note where the change would land and what the impact is.
- **Adapt** — The observation is sound but the recommendation needs modification.
  Explain what you'd change and why.
- **Defer** — The observation may be valid but there isn't enough evidence or the timing
  isn't right. Be specific about what would trigger revisiting.
- **Decline** — The observation doesn't apply, contradicts this NLA's principles, or has
  been considered and rejected. Preserve the reasoning — this is the most important
  rationale to record.

These are convenient defaults, not an enum. "Accept the principle, defer the specific
implementation" is a valid verdict.

**Present verdicts to the human for review.** The AI proposes; the human decides. This is
assessment, not automation.

### Step 5: Check for Interconnections

After individual assessment, look across items:

- Do accepted items form a coherent theme? Note this — it may inform implementation order.
- Does the verdict on one item affect another? Flag the dependency.
- Are there items that should be combined or split?

### Step 6: Record

After the human approves (or adjusts) the verdicts:

1. **Deposit accepted items in the feedback log.** For each accepted (or adapted) item,
   add an entry to `reference/feedback-log.md` with: the source (link to the GitHub Issue
   or intake item), the verdict and rationale, and a concrete description of what to do.
   This makes accepted items visible to `/maintain` at the next session start. Items that
   are deferred or declined don't go in the feedback log — they're recorded in the triage
   summary comment on the intake item.
2. **Update the intake channel.** Add a triage summary comment to the GitHub Issue (or
   equivalent) covering all items — accepted, deferred, and declined — with verdicts and
   reasoning. Then close the issue. If this fails due to permission errors, note it and
   continue — the feedback log is the important artifact. Run `lib/check-setup.sh`
   to diagnose permission issues.
3. **Update last-checked.md** in `reference/` with the current date and what was seen.

---

## Judgment Calls

### How Much Evidence Is Enough?

One observation is a data point. Two from different contexts is a signal. Three is strong.
But a single observation with high confidence and clear reasoning can be enough —
especially if it identifies a gap rather than proposing a specific solution.

### The Author Knows Their Context

The feedback writer has experience you don't. When something seems wrong or inapplicable,
the gap might be in understanding, not in the feedback. Ask before dismissing.

### Triage Across Sessions

A complex letter doesn't have to be triaged in one session. Record partial triage progress
in annotations. The next session reads the annotations and continues.

### When to Split

Split feedback into separate letters when it helps processing — not as a default. Good
reasons: quick wins that can be acted on immediately, items that need different sessions
to resolve, themes that benefit from focused attention.

---

## Customization

NLA creators can customize any part of this process in their penny post fork:

- **Triage conventions** — modify verdict vocabulary, annotation format, evidence
  thresholds by editing this file in your fork
- **Config-level tuning** — adjust evidence thresholds, triage depth, notification
  patterns via config.md
- **Full replacement** — replace this skill entirely with a custom check-feedback flow

Most NLAs won't need to customize. The defaults work because the AI evaluates feedback
against the NLA's own loaded context — the conventions just provide structure for how
to communicate the assessment.

---

*The goal is thoughtful assessment, not speed. A well-reasoned "defer" is more valuable
than a hasty "accept."*
