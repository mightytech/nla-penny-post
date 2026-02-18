# Configuration Spec

This document defines what users of the penny post can configure. The `/preferences` skill reads this to guide the configuration conversation and enforce constraints.

---

## What's Configurable

Users can adjust how the penny post behaves without changing the core application docs. The main areas:

### Notification Patterns

Users can define what they want surfaced when checking mail:

- **Topic filters** — "Highlight letters that mention persistence or lifecycle patterns."
- **Source filters** — "Show responses to my previous letters first."
- **Priority filters** — "Flag high-confidence items from NLAs I haven't seen before."
- **Custom patterns** — Any natural language description of what matters to them.

**Default:** Surface everything with a brief summary, no filtering.

### Triage Preferences

Users can adjust triage behavior:

- **Evidence threshold** — How much evidence is needed before accepting vs. deferring. Some maintainers want to act on strong single observations; others prefer waiting for corroboration.
- **Triage depth** — How detailed verdicts and rationale should be. Range from "brief — verdict and one sentence" to "thorough — full reasoning for each item."

**Default:** Moderate evidence threshold (single strong observations can be accepted, weaker ones deferred). Thorough rationale.

### Synthesis Preferences

Users can adjust when and how synthesis happens:

- **Synthesis threshold** — How many related observations before suggesting synthesis. Some users want aggressive synthesis; others prefer accumulating more data first.

**Default:** Suggest synthesis when three or more sources point to the same pattern.

### Intake Channel

How /check-feedback discovers new feedback:

- **Repo URL** — Which GitHub repo to scan for issues (e.g., `mightytech/my-nla`). This is the repo where feedback is submitted, typically the NLA's own repo.
- **Label filter** — Only check issues with these labels (e.g., `feedback`, `penny-post`). Optional — by default, all open issues are checked and the AI judges relevance.
- **State filter** — Which issue states to check. Optional — default is `open`.

**Default:** All open issues on the configured repo, no label filtering. The AI assesses each issue for relevance.

### Penny Post Location

If the penny post is not at the standard sibling location:

- **Local path** — Where the penny post repo is cloned

**Default:** `../nla-penny-post/` (sibling directory).

### Framework Path

If the NLA Framework is not at the standard sibling location (`../nla-framework/`), users can specify the actual path.

**Default:** `../nla-framework/`

### Tracing

Runtime tracing logs the LLM's decisions during work sessions — which documents it read, what directives it found, what it decided and why. Useful for debugging unexpected triage behavior or understanding how the application's docs interact.

**Trace level:**

- **Off** — No tracing. Default.
- **Standard** — Log major decisions: which docs read, what directives found, what was decided, and why.
- **Detailed** — Log everything including routine operations, alternatives considered, and directives that were read but didn't apply.
- **Custom** — User writes natural language describing exactly what to trace.

**Trace output:** `reference/sessions/trace-YYYY-MM-DD.md`.

**Defaults:** Tracing off.

---

## Constraints

- Voice values (respect for effort, transparency, honest calibration) are communication standards, not preferences. Users cannot configure the system to dismiss feedback dismissively or skip rationale.
- Triage rationale cannot be disabled. Every verdict must include reasoning, even if brief.
- The annotation convention (blockquoted with attribution) is a standard, not a preference. Consistency enables cross-letter readability.

---

## Guidance for the Config Conversation

When users aren't sure what to configure, start with notification patterns — they have the most visible effect on the check-feedback experience. Triage preferences are useful after a few triage sessions when the user has opinions about depth and evidence thresholds.

For first-time users, suggest trying the defaults first and coming back to `/preferences` after they've processed a few letters.

---

*This spec is maintained by the app developer via `/maintain`. Users interact with config through `/preferences`.*
