# CLAUDE.md Integration Intent

What the NLA's CLAUDE.md (or equivalent runtime identity file) should know after
installing penny post.

---

## Core Awareness

The NLA should understand that it has feedback capabilities provided by the penny post
extension. Specifically:

- **It can receive feedback.** Other NLAs and humans can submit feedback about this
  project via GitHub Issues (or other configured intake channels). The NLA can discover
  and triage this feedback using `/check-feedback`.

- **It can send feedback.** After maintenance sessions or significant work, the NLA
  can draft and submit feedback to other projects using `/write-letter`.

- **Feedback processing happens here, not in the penny post.** Triage and synthesis
  happen in this NLA's session, where the AI has full project context. The penny post
  provides conventions and infrastructure, not processing.

## Skills to Reference

The NLA's available skills section should include:

- `/check-feedback` — Discover and triage feedback from intake channels. Run
  periodically or when the maintainer wants to see what's arrived.
- `/write-letter` — Draft and submit a feedback letter to another project. Best used
  at the end of maintenance sessions when learnings are fresh.

These are penny post skills, distinct from framework skills like `/maintain` or
`/startup`.

## Feedback File Locations

The NLA should know:

- Feedback arrives through intake channels (GitHub Issues by default).
- After triage, accepted items are deposited in `reference/feedback-log.md`.
- Resolved items move to `reference/feedback-log-archive.md`.
- The feedback log feeds into `/maintain` — it's the sibling of the friction log
  (internal observations vs. external feedback).
- The penny post repo is a sibling directory at `../nla-penny-post/`.

## What NOT to Change

This intent should not alter:
- The NLA's core identity or purpose
- Framework-provided sections of CLAUDE.md
- The NLA's voice or grounding principles

Feedback capabilities are additive — they extend what the NLA can do without
changing what it is.

---

*This describes intent, not literal text. The installing AI should synthesize these
concepts into the NLA's CLAUDE.md in whatever way fits its existing structure and voice.*
