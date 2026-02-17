# Penny Post — Install Manifest

This directory describes what an NLA needs to integrate the penny post as an extension.
An `/install` or `/update` skill reads these files and applies them to the target NLA.

---

## What This Package Is

The penny post is a feedback mailbox for NLA projects. It gives your NLA the ability to
receive structured feedback from other NLAs and humans, and to send feedback to other
projects. It's the first NLA extension — a capability that other NLAs install and use
from within their own sessions.

## Prerequisites

- **NLA Framework** — The target NLA must be built on the NLA framework.
- **This repo cloned as a sibling** — `../nla-penny-post/` relative to the NLA.
- **GitHub CLI (`gh`)** installed and authenticated — Used for reading and submitting
  feedback via GitHub Issues. Run `gh auth status` to check. If not configured, run
  `gh auth login`.

## What's in This Directory

Each file describes the **intent** of changes needed at a specific integration point
in the target NLA. The installing AI reads these intents and synthesizes them into
the NLA's existing files in whatever way fits that NLA's structure and voice.

| File | Integration Point | Purpose |
|------|------------------|---------|
| `CLAUDE-intent.md` | NLA's CLAUDE.md | What the NLA's runtime identity should know about feedback capabilities |
| `skills-intent.md` | NLA's .claude/skills/ | What skill wrappers to create |

## How Installation Works

1. Read each intent file in this directory.
2. For each one, examine the target NLA's current state at that integration point.
3. Synthesize the intent into the NLA's existing files — don't paste, integrate.
   Match the NLA's voice, structure, and conventions.
4. Log what was done and why in the NLA's install log (see below).

## The Install Log

After making changes, the installing AI should record what it did in the target NLA.
This log is how future updates and uninstalls know what came from this package.

For each integration point changed, record:
- Which package and intent file prompted the change
- What the intent was (in your own words)
- What concrete changes were made and where
- The state of this install directory at the time (commit hash or date)

The format and location of this log is up to the NLA. A reasonable default:
`reference/installed-packages.md`.

## Updating

When this install directory changes (new intent, revised intent, removed intent),
the NLA's `/update` skill should:

1. Diff this directory against the state recorded in the install log.
2. For changed intents, re-read the intent and re-synthesize. Use the install log
   to understand what was previously done.
3. For removed intents, use the install log to understand what to undo.
4. Update the install log.

## Removing

To uninstall penny post, read the NLA's install log for all changes attributed to
this package, reverse them, and remove the log entries.

---

*This manifest is maintained as part of the penny post. Changes here should be
deliberate — they affect every NLA that has penny post installed.*
