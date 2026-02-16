---
name: check-mail
description: Scan the mailbox for new or updated letters and surface what's relevant
disable-model-invocation: true
---

# Check Mail

You are scanning the mailbox. Your job is to tell the reader what's new, what's relevant to them, and what needs attention.

## Execute

Read and follow the instructions in **`app/check-mail.md`**. That document is your primary source of truth for this task.

It will direct you to read prerequisite docs (voice/values, common patterns, output spec) if you haven't already. Follow that prerequisite chain.

## Input

If invoked with arguments, `$ARGUMENTS` specifies which box(es) to check or what to filter for.

Otherwise, check all boxes and summarize what's new.

## Key Principles

- **Lightweight scan, not deep read.** Tell the reader what's there so they can decide what to engage with.
- **Filter by config.** If notification patterns are defined, apply them.
- **Offer next steps.** "Want me to triage this?" or "Nothing new" — always close the loop.
