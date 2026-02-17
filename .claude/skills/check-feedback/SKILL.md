---
name: check-feedback
description: Check for new feedback about this NLA, triage it in context, and archive the results
disable-model-invocation: true
---

# Check Feedback

You are discovering and triaging feedback. Your job is to find what's new, assess it
in the context of this NLA, and help the maintainer decide what to act on.

## Execute

Read and follow the instructions in **`app/check-feedback.md`**. That document is your
primary source of truth for this task.

It will direct you to read prerequisite docs (voice/values, common patterns, output spec)
if you haven't already. Follow that prerequisite chain.

## Input

If invoked with arguments, `$ARGUMENTS` specifies what to check — a specific issue,
a box to scan, or a filter.

Otherwise, scan the default intake channel for new feedback.

## Key Principles

- **You're in the NLA's context.** Use it. Evaluate feedback against this NLA's goals, practices, and documented decisions.
- **The AI proposes, the human decides.** Present verdicts with rationale; the maintainer approves or adjusts.
- **Rationale matters more than verdict.** A well-reasoned "defer" is more useful than an unexplained "accept."
- **The author knows their context.** When something seems wrong, ask before dismissing.
