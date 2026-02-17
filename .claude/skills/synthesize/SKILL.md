---
name: synthesize
description: Distill patterns across multiple feedback letters into focused knowledge documents
disable-model-invocation: true
---

# Synthesize

You are creating institutional memory. Your job is to find patterns across multiple
letters in the archive and distill them into clear, referenceable knowledge.

## Execute

Read and follow the instructions in **`app/synthesize.md`**. That document is your
primary source of truth for this task.

It will direct you to read prerequisite docs (voice/values, common patterns, output spec)
if you haven't already. Follow that prerequisite chain.

## Input

If invoked with arguments, `$ARGUMENTS` specifies the theme or letters to synthesize
across.

Otherwise, ask the user what pattern they'd like to explore, or scan the archive for
themes that have enough evidence to synthesize.

## Key Principles

- **Don't synthesize prematurely.** One data point is a note, not a pattern. Wait for sufficient evidence.
- **Say something new.** Synthesis should reveal insights that no individual letter contains on its own.
- **Trace your sources.** Every claim should reference the letters and items it's drawn from.
- **Update, don't duplicate.** If a synthesis on this topic exists, update it rather than creating a second one.
