# Write Letter

Draft a feedback letter and submit it to the appropriate intake channel.

---

## Purpose

This skill helps NLA maintainers capture learnings from their work and send them as
structured feedback — to the framework, to the penny post, or to any project that
accepts feedback. It's typically run at the end of a maintenance session, when patterns
and insights are fresh.

The AI drafts the letter collaboratively with the human. The human decides what goes in,
what stays out, and when it's ready to send.

## Input

- Where to send the feedback (which project's intake channel)
- Optionally: specific observations the human wants to include
- Optionally: a maintenance session log or friction log entries to draw from

## Output

- A well-structured feedback letter submitted to the intake channel (e.g., GitHub Issue)
- Optionally: a local copy saved for reference

---

## Prerequisites

Before running this skill, read:

1. **[Voice and Values](shared/voice-and-values.md)** — How to communicate about feedback.
2. **[Common Patterns](shared/common-patterns.md)** — Letter structure conventions.

---

## Processing Steps

### Step 1: Gather Material

Look for observations worth sharing:

- **Session context** — What was built, fixed, or discovered in this session?
- **Friction log entries** — Any observations that seem general, not just local?
- **Patterns noticed** — Did something come up that other NLAs would likely hit too?
- **The human's input** — Ask what they think is worth sending upstream.

The AI surfaces candidates; the human curates. Not everything worth noticing is worth
sending as feedback.

#### Compiling friction log entries

When the user wants to share accumulated friction observations upstream — either prompted
by a startup nudge or on their own initiative — read `reference/friction-log.md` for
pending entries and use them as the starting material.

Not all entries belong in the same letter. Group by likely recipient:
- Entries about framework behavior → letter to the framework maintainer
- Entries about a package's behavior → letter to that package's maintainer
- Entries about this NLA's own behavior → probably not a letter (handle via `/maintain`)

Draft one letter per recipient, compiling the relevant entries with context. Each entry
becomes a letter item — preserve the diagnostic detail (instruction chains, exact quotes)
but reframe from internal observation to external feedback. The friction log captures what
you noticed; the letter explains why the recipient should care.

Then continue with the normal flow: draft, review with the human, submit.

### Step 2: Draft the Letter

Structure the letter using the suggested format (or whatever structure fits the material):

- **Source & context** — who's writing, what kind of NLA, what prompted this letter
- **Items** — observations with enough context to assess, confidence where relevant
- **Recommendations** — what the author thinks should change (optional — some letters
  are observations without prescriptions)
- **Relationships** — connections between items, if any

The suggested structure is scaffolding, not a form. Sections can be dropped, added, or
rearranged as the material demands. A three-item letter about one theme doesn't need the
same structure as an eleven-item letter spanning four topics.

### Step 3: Review with the Human

Present the draft to the human. They may:

- Add items the AI didn't surface
- Remove items that aren't general enough
- Adjust confidence levels or framing
- Restructure the letter entirely

The letter represents the human's assessment, informed by the AI's observations. It's
their name on it.

### Step 4: Submit

Submit the letter to the appropriate intake channel:

- **GitHub Issues (default):** Use `gh issue create` on the target repo. Format the
  letter as the issue body. Use a clear title summarizing the feedback.
- **Other channels:** Follow the intake configuration for the target project.

Add a source attribution footer to the submission:

```
---
*Drafted with /write-letter from [nla-name](repo-url) during a maintenance session.*
```

This helps the receiving NLA understand how the feedback was produced — it's
informational context, not a filter. Feedback without this footer (manually filed
issues, etc.) is equally valid.

Confirm with the human before submitting. Show them exactly what will be sent and where.

**If submission fails** (e.g., permission errors with `gh`), save the letter locally
and tell the human what went wrong. The letter content is the important part — the
submission channel is just delivery. Run `lib/check-setup.sh` to diagnose permission
issues.

### Step 5: Save Locally (Optional)

If the human wants a local copy, save it to a reference location. This isn't required —
the submitted issue IS the record — but some maintainers prefer keeping a local copy of
what they've sent.

---

## Judgment Calls

### What's Worth Sending?

Not every friction log entry deserves a letter. Good candidates:

- Patterns that seem general — "any NLA with multi-session work would hit this"
- Gaps in the framework or conventions — "the docs don't cover this at all"
- Things that were harder than they should have been — "I built this from scratch but
  the framework could have provided it"
- Things that worked surprisingly well — positive feedback is signal too

Poor candidates:

- Highly specific to this NLA's domain
- Already known or documented
- Complaints without observations ("this was hard" without "here's why")

### How Much Structure?

Match the material. A single observation about a naming convention doesn't need eleven
sections. A session that produced four distinct architectural insights might. The AI
should suggest structure proportional to the content, not impose a fixed template.

### Confidence Calibration

Use natural language for confidence. "High" and "high for persistent NLAs, less sure
about stateless ones" are both valid. Calibrate honestly rather than picking from a menu.

### Diagnostic Richness for Behavioral Friction

When a letter item describes behavioral friction — the NLA did the wrong thing, or didn't
do the right thing — the AI has a unique advantage: it was there. It read the instructions,
made the judgment call, and can trace the full chain. Use that when drafting.

For items about behavioral friction:

- **Include the instruction chain** — which docs were read, what specific guidance led to
  the behavior or inaction. This turns a problem report into a diagnostic.
- **Use exact quotes from docs**, not paraphrases. "common-patterns.md step 3 says 'always
  start in 4/4 time'" is verifiable by the receiving maintainer. "The patterns doc
  recommends simple time signatures" sounds plausible whether accurate or not.
- **Propose documentation changes** when possible — even tentative ones. "Consider
  rewording step 3 to handle experienced users" gives the maintainer a starting point,
  not just a problem to investigate. Frame proposals as suggestions, not patches — the
  maintainer has context you don't about all the cases a doc serves.
- **Flag confidence honestly.** If the instruction chain is reconstructed from memory
  rather than traced in the moment, say so. Friction-log entries captured close to the
  moment are more reliable than end-of-session reconstructions. When drawing from friction
  log entries, rely on what they recorded; when adding context from memory, note the
  difference.

This doesn't apply to all letter items. Structural feedback, process observations, and
positive feedback don't need instruction chains — they're different kinds of signal. The
diagnostic richness matters specifically when the feedback is "the NLA behaved wrong
because the docs say X."

---

## Customization

NLA creators can customize this skill in their penny post fork:

- **Letter structure** — modify the suggested format to match what the receiving project
  prefers
- **Submission channel** — configure where letters go (GitHub Issues, email, etc.)
- **Auto-draft from friction log** — configure whether the AI should automatically
  surface friction log entries as letter candidates

---

*The best time to capture learnings is right after the work that produced them. The
second best time is now.*
