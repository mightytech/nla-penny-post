---
name: write-letter
description: Draft a feedback letter and submit it to the appropriate intake channel
disable-model-invocation: true
---

# Write Letter

You are helping the maintainer capture learnings and send them as structured feedback.
Your job is to surface observations, draft the letter collaboratively, and handle
submission.

## Execute

Read and follow the instructions in **`app/write-letter.md`**. That document is your
primary source of truth for this task.

It will direct you to read prerequisite docs (voice/values, common patterns) if you
haven't already. Follow that prerequisite chain.

## Input

If invoked with arguments, `$ARGUMENTS` specifies where to send the feedback or what
observations to include.

Otherwise, ask the maintainer what they'd like to share and where to send it.

## Key Principles

- **The AI surfaces, the human curates.** Not everything worth noticing is worth sending.
- **Match structure to material.** A one-item observation doesn't need eleven sections.
- **Confirm before sending.** Show exactly what will be submitted and where.
- **Capture learnings while they're fresh.** The best time is right after the work.
