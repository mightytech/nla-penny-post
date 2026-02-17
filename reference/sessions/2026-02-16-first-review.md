# Maintenance Session: First Review and Architectural Reframing

**Date:** 2026-02-16 / 2026-02-17
**Status:** Complete

## Intent

Review the penny post at the idea level after initial creation. The goal isn't perfecting
execution — it's discovering the right questions, surfacing architectural assumptions, and
right-sizing the system for its actual purpose: collecting feedback from NLAs and showcasing
what NLAs can do.

## Decisions Made

### 1. The penny post is an NLA extension, not just a standalone application

The penny post is the first NLA extension/plugin. For 99% of users, it's installed as a
sibling repo and used entirely from within their own NLAs. It's also an NLA in its own right
(self-maintenance, checking its own feedback, synthesis) and a mailbox (boxes/ with
git-based distribution).

This reframes the project from "a feedback processor you interact with directly" to
"a capability that other NLAs gain by installing it."

**Rationale:** Triage requires the context of the NLA receiving the feedback. The penny post
alone can't assess whether "artifact persistence is a missing framework pattern" — the
framework maintainer can, because they have full context. So triage naturally happens at the
NLA level, not the penny post level.

### 2. Triage moves to the NLA side

Triage doesn't happen in the penny post's session. It happens in the receiving NLA's session,
where the AI has full context and the human is already positioned to implement accepted items.

The penny post defines triage conventions (verdict vocabulary, annotation format, evidence
thresholds) — not as a rigid protocol, but as suggested structure with published reasoning.
NLAs apply these conventions with their own judgment and context.

### 3. The skill split between framework and penny post

- **Framework:** general NLA infrastructure — `/startup`, `/maintain`, `/friction-log`,
  `/validate`, `/plan`, `/preferences`
- **Penny post (as extension):** feedback-specific skills — `/write-letter` (draft
  feedback at end of maintenance), `/check-feedback` (check for triaged feedback
  relevant to this NLA), plus triage conventions, letter format, annotation conventions
- **Penny post (as standalone NLA):** self-maintenance, processes its own feedback like
  any other NLA

The penny post skills follow the same pattern as framework skills: thin wrappers in
the NLA point to actual skill logic in `../nla-penny-post/`. The framework doesn't know
about feedback letters — that's penny post's domain.

### 4. /check-mail is absorbed

The standalone /check-mail skill goes away. Its discovery function is absorbed by /triage
(for the penny post's own intake) and replaced by /check-feedback (framework-level skill
for NLAs checking their feedback).

### 5. Per-box last-checked.md for session memory

Each box gets its own last-checked.md (gitignored) rather than a global file. Reasons:
users typically work with one NLA at a time, and most users won't check community boxes
regularly. Config can specify default boxes to check.

### 6. NLA extensions: technically explicit, experientially native

The NLA's docs and skills know about penny post — where boxes are, how to read letters,
what conventions to follow. But users experience it as native capability of their NLA.
They don't context-switch to a different project.

This is proposed as a general design principle for NLA extensions.

### 7. Conventions, not protocol

The penny post's suggestions (letter format, triage conventions, annotation format) are
NLA-style: suggested structure with published reasoning, not a spec to conform to. "Here's
what we suggest and why; if you have something different to say, say it."

### 8. Synthesis always happens NLA-side — no special synthesis role for penny post

Synthesis follows the same rule as triage: it happens where the context lives. Each project
is an NLA (Duet, penny post, nla-framework). Each processes its own feedback — including
synthesis — within its own context.

The penny post doesn't need a special cross-cutting synthesis capability. It synthesizes
its own feedback (boxes/penny-post/) like any other NLA, using the same framework skills.

**Rationale:** The universal rule is simpler and more correct than giving the penny post a
special role. Context lives in the NLA. Processing happens in the NLA. No exceptions.

### 9. The penny post's identity

The penny post is three things:
1. **The mailbox** — box infrastructure, git-based distribution, fork model
2. **The conventions source** — letter format, triage guidance, annotation format
   (suggested with reasoning, not enforced)
3. **An NLA** — that processes its own feedback exactly the way every other NLA does

No special processing powers. No unique synthesis role. Infrastructure, conventions,
and self-maintenance.

### 10. GitHub Issues as the default intake channel

The mailbox is an abstraction. Feedback can arrive through any channel — GitHub Issues,
email, web forms, Jira, S3 buckets, Slack, whatever. The penny post's conventions govern
how feedback is processed, not how it arrives.

GitHub Issues is the default (and initial) implementation because:
- Universal for developers (most have GitHub accounts)
- Zero infrastructure to set up
- The `gh` CLI handles mechanics; the AI can operate it
- Closes the feedback loop (issue gets a triage summary comment)
- No special tokens needed for public repos — users authenticate as themselves

**The architecture treats GitHub Issues as one implementation from the start.** Adding
other channels (email, web forms, Jira, etc.) would just need the intake logic — config
describes where to look, the AI handles the mechanics. NLA creators choose which channels
work for their audience.

**Setup dependency:** The `gh` CLI must be installed and authenticated. The framework's
`/setup` or penny post's setup flow should detect and help configure this.

### 11. boxes/ becomes the archive, not the inbox

With GitHub Issues (or other channels) as the intake mechanism, `boxes/` in the penny post
fork becomes the archive of processed feedback — not the live inbox.

Flow: feedback arrives via intake channel → maintainer discovers via `/check-feedback` →
triage in NLA context → annotated letter saved to `boxes/` → intake item (e.g., GitHub
Issue) gets summary comment and is closed.

The archive is portable (markdown in git), searchable, offline-accessible, and
synthesizable. The intake channel is ephemeral — issues open, get processed, close.

### 12. LLM as spam filter

For intake channels that allow anonymous or low-friction submission, spam filtering is
a judgment call — and LLMs are good at judgment calls. "Ignore anything that isn't genuine
feedback" is a trivial instruction. No ML models, heuristics, or blocklists needed.

This is a small but illustrative example of the NLA advantage: a whole engineering
discipline (spam filtering) collapses into a sentence of instruction.

## What Didn't Work

- The original framing had the penny post as the active triage processor. This broke down
  when we realized triage needs the receiving NLA's context.
- Attempted to give the penny post a special synthesis role for cross-cutting patterns.
  The simpler answer: synthesis always happens NLA-side, and every project (including
  penny post) is an NLA.
- gh CLI token (fine-grained PAT) lacked permission to comment on and close issues.
  Could create issues but couldn't close the loop. Fixed by `gh auth refresh --scopes repo`.
  Led to building the check-setup script to catch this for future users.
- Initially proposed inferring the target repo from git remotes for /check-feedback.
  Wrong — ambiguous (which remote? which repo?) and fragile. Explicit config is better.

### 13. Intent-based package installation

NLA packages ship an `install/` directory with individual intent files per integration
point (CLAUDE.md, skills, etc.) plus an orchestrator (`install.md`) that ties them together.

The installing NLA's AI reads the intents and synthesizes them into the NLA's existing
files — matching voice, structure, and conventions. The NLA logs what it did and why
(an install log), enabling future updates, uninstalls, and overlap detection.

**Key design choices:**
- Intent files, not templates — each NLA gets tailored integration, not copy-paste
- Separate files per integration point — independently diffable and updatable
- NLA-side install log — provenance for every change, enabling updates and uninstalls
- Version = state of install directory — no manual version bumps

**The framework is also a package.** `/create-app` is the initial install; an `/install`
and `/update` skill (framework-level) would generalize this for all packages. `/create-app`
remains useful as the bootstrapping shortcut (you need an NLA before you can `/install`
anything into it).

**GitHub Issues as two-way channel:** Issues naturally support dialogue — maintainers
can ask clarifying questions, submitters can respond. `/check-feedback` should handle
this naturally (read all comments, post follow-ups when needed). Not a separate flow,
just recognition that the channel supports conversation.

### 14. Feedback log — sibling to friction log for external feedback

After triaging the first real feedback, we discovered a gap: accepted items had nowhere
to land as actionable work. The friction log handles internal observations; a new
feedback log handles external feedback that's been accepted through triage.

- **Friction log** — things you noticed while working (internal)
- **Feedback log** — things others noticed that you agreed with (external)

Both feed into `/maintain`. Both are queues of actionable items. This is a framework-level
concept, not penny-post-specific — any external feedback tool can deposit items.

Single file (`reference/feedback-log.md`), same archival pattern as friction log. Could
evolve to a directory later if needed, but a flat file is simplest for "what needs my
attention?"

### 15. Default intake: all open issues, no label filter

When /check-feedback scans GitHub Issues, the default is all open issues — no label
filtering. The LLM judges relevance (same principle as "LLM as spam filter"). Label
filters are an optional narrowing for high-volume repos, configured via config.

This keeps penny post maximally useful out of the box, including for non-NLA projects
that might use it for general issue triage.

### 16. Setup check script for prerequisites

A bash script (`lib/check-setup.sh`) that verifies penny post prerequisites: gh CLI
installed, authenticated, and has the right permissions on the target repo. Tests each
operation (list, create, comment, close issues) against the user's actual repo and
reports what's working and what's missing.

Suggests the fix command (`gh auth refresh --hostname github.com --scopes repo`) with
clear instructions for headless servers (open the URL on any device).

This is the kind of thing where traditional code is better than NLA prose — it's
mechanical, repeatable, and the LLM adds no value to the actual checking.

## Open Questions

1. **NLA extension pattern** — Is this worth formalizing in the framework, or just do it
   for penny post and see what emerges?
2. **Anonymous submission channels** — GitHub Issues requires a GitHub account. For truly
   anonymous feedback, other channels (web forms, email, public docs) could be added.
   The architecture supports this but no solution is clearly "right" yet. Worth exploring
   when there's a real audience beyond developers.
3. **Install log format and location** — `reference/installed-packages.md` is suggested
   but not finalized. The right shape will emerge from real use.

## Changes Implemented

All core docs were rewritten or created to reflect the architectural reframing:

### New files
- `app/check-feedback.md` — Combined discovery and triage, written for execution in any NLA's session
- `app/write-letter.md` — Letter drafting skill for end of maintenance sessions
- `.claude/skills/check-feedback/SKILL.md` — Thin wrapper for the new skill
- `.claude/skills/write-letter/SKILL.md` — Thin wrapper for the new skill
- `install/install.md` — Package manifest orchestrator
- `install/CLAUDE-intent.md` — Intent for NLA's CLAUDE.md integration
- `install/skills-intent.md` — Intent for skill wrapper creation

### Rewritten files
- `app/overview.md` — Reframed identity as extension + mailbox + conventions + NLA
- `app/synthesize.md` — Reframed to always happen NLA-side
- `CLAUDE.md` — Updated identity, skill table split into penny post vs framework skills
- `README.md` — Restructured for two audiences (NLA creators, feedback submitters)
- `reference/system-status.md` — Reflects current state post-reframing

### Updated files
- `app/config-spec.md` — Fixed stale reference, added Intake Channel section
- `app/check-feedback.md` — Added two-way conversation note, feedback log deposit step,
  concrete gh CLI commands, graceful error handling for permissions
- `app/write-letter.md` — Added source attribution footer convention, error handling
- `.claude/skills/synthesize/SKILL.md` — Minor reframe
- `reference/design-rationale.md` — Added new decision sections (including intent-based installation)
- `app/overview.md` — Added Installation section and install/ to document hierarchy
- `README.md` — Added install/ to file tree, referenced install manifest in setup instructions
- `.gitignore` — Added last-checked.md

### Removed files
- `app/triage.md` — Replaced by check-feedback.md
- `app/check-mail.md` — Absorbed into check-feedback.md
- `.claude/skills/check-mail/` — Replaced by check-feedback
- `.claude/skills/triage/` — Replaced by check-feedback

### End-to-end test (2026-02-17)
- Created GitHub repo: mightytech/nla-penny-post
- /write-letter test: drafted and submitted Issue #1 (self-feedback about untested loop)
- /check-feedback test: discovered Issue #1, triaged all 4 items (all accepted),
  archived to `boxes/penny-post/2026-02-17-end-to-end-testing.md`
- Created `reference/feedback-log.md` — new concept, sibling to friction log
- Deposited 3 accepted items in feedback log
- Commented triage summary on Issue #1 and closed it
- Created `boxes/penny-post/last-checked.md` (gitignored)
- Added last-checked.md to .gitignore

### Setup and infrastructure
- `lib/check-setup.sh` — prerequisite check script (tests gh CLI, auth, permissions)
- Fixed gh token permissions via `gh auth refresh --scopes repo`
- Cleaned up test issue (#2) from check-setup script

### Letters sent
- GitHub Issue #1 on nla-framework: install/ directory pattern
  (https://github.com/mightytech/nla-framework/issues/1)
- GitHub Issue #2 on nla-framework: feedback log concept
  (https://github.com/mightytech/nla-framework/issues/2)
- GitHub Issue #1 on nla-penny-post: end-to-end testing (self-feedback)
  (https://github.com/mightytech/nla-penny-post/issues/1) — triaged and closed

### Feedback log and friction log
- All 3 feedback log entries resolved (source attribution, two-way conversation, intake config)
- Friction log entry (token permissions) resolved

### Other
- Added "Natively Multilingual" section to `../nla-writings/the-case-for-nlas.md`

## State at Close

Architecture reframed, all docs rewritten, end-to-end tested, feedback loop working.

**What's done:**
- Core docs reflect the new architecture (extension + mailbox + conventions + NLA)
- /write-letter and /check-feedback tested end-to-end with real feedback
- Install directory with intent files created
- Feedback log concept created and working
- Setup check script built and tested
- 3 letters sent (2 to framework, 1 self-feedback — triaged and closed)
- All feedback log and friction log items resolved

**What's waiting on the framework:**
- Issue #1: Create install/ directory for framework package management
- Issue #2: Add feedback log as sibling to friction log
- Eventually: /install and /update skills

**What's not yet tested:**
- /synthesize (needs multiple letters)
- The full install flow on another NLA (manual setup works, automated /install doesn't exist yet)
- check-feedback with external feedback (all testing was self-feedback)
