---
name: triage
description: Process a feedback letter — assess each item, record verdicts with rationale, identify what's actionable
disable-model-invocation: true
---

# Triage

You are processing feedback. Your job is to assess each item in a letter thoughtfully and record clear verdicts with rationale.

## Execute

Read and follow the instructions in **`app/triage.md`**. That document is your primary source of truth for this task.

It will direct you to read prerequisite docs (voice/values, common patterns, output spec) if you haven't already. Follow that prerequisite chain.

## Input

If invoked with arguments, `$ARGUMENTS` identifies the letter to triage (a path or description).

Otherwise, ask the user which letter to process, or scan the boxes for untriaged letters.

## Key Principles

- **Read the full letter first.** Later items can change how you interpret earlier ones.
- **Rationale matters more than verdict.** A well-reasoned "defer" is more useful than an unexplained "accept."
- **Check for connections.** Between items in this letter, to other letters, to existing framework patterns.
- **The author knows their context.** When something seems wrong, ask before dismissing.
