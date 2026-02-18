# Penny Post

A feedback conventions and skills package for NLA projects, built on the [NLA Framework](../nla-framework/).

Named after the 1840 British postal reform that democratized communication — fitting for a project about democratizing software development beyond coders.

---

## What It Is

The penny post is two things:

1. **A conventions source** — suggested structure for writing, triaging, and annotating feedback, plus the skills that implement them
2. **An NLA** — that processes its own feedback exactly the way every other NLA does

It's the first **NLA extension** — a capability that other NLAs install and use from within their own sessions. Most users never open the penny post directly; they interact with it through `/check-feedback` and `/write-letter` in their own NLA.

All feedback files (feedback log, archive) live in the NLA that receives the feedback — not in the penny post. The penny post provides conventions and skills; each NLA manages its own feedback lifecycle.

---

## For NLA Creators: Installing Penny Post

### Prerequisites

- **NLA Framework** at `../nla-framework/`
- **Claude Code** installed
- **GitHub CLI** (`gh`) installed and authenticated (for submitting/reading feedback via GitHub Issues)

### Setup

1. Clone this repo as a sibling to your NLA: `../nla-penny-post/`
2. Add skill wrappers to your NLA (see `install/skills-intent.md` for details):

```
# .claude/skills/check-feedback/SKILL.md
Read and follow `../nla-penny-post/app/check-feedback.md`.

# .claude/skills/write-letter/SKILL.md
Read and follow `../nla-penny-post/app/write-letter.md`.
```

3. Optionally configure your intake channel in `config.md`

The `install/` directory contains the full package manifest — intent files describing what your NLA needs to integrate penny post. When a framework-level `/install` skill is available, it will automate this setup.

### Usage from Your NLA

```
/check-feedback          # Discover and triage new feedback
/write-letter            # Draft and send a feedback letter
```

These run in your NLA's session with full project context. The AI evaluates feedback against your NLA's goals, practices, and documented decisions.

---

## For Feedback Submitters

The easiest way to submit feedback about an NLA is to **open a GitHub Issue** on that NLA's repo. No special tools, no forking, no understanding of penny post internals.

If you're in a Claude Code session, you can also use `/write-letter` to draft well-structured feedback collaboratively with the AI.

---

## How Feedback Flows

```
Feedback submitted            Maintainer discovers          Triaged and recorded
(GitHub Issue, etc.)    →     (/check-feedback)       →     (feedback log in NLA)
```

1. **Submit** — Anyone opens a GitHub Issue (or uses `/write-letter`)
2. **Discover** — Maintainer runs `/check-feedback` in their NLA's session
3. **Triage** — AI proposes verdicts with rationale; human reviews and decides
4. **Record** — Accepted items deposited in feedback log; issue gets summary and closes
5. **Synthesize** — When patterns emerge across feedback, `/synthesize` distills them

---

## What's Inside

```
├── CLAUDE.md                        # Runtime identity and configuration
├── app/                             # The application (LLM reads and executes)
│   ├── overview.md                  # What this NLA does, how pieces connect
│   ├── shared/
│   │   ├── voice-and-values.md      # Communication tone and values
│   │   ├── common-patterns.md       # Shared processing patterns
│   │   └── output-spec.md           # Output format
│   ├── config-spec.md               # What users can configure
│   ├── check-feedback.md            # Feedback discovery and triage
│   ├── write-letter.md              # Letter drafting and submission
│   └── synthesize.md                # Pattern synthesis
├── install/                         # Package manifest (for NLA integration)
│   ├── install.md                   # Orchestrator — what this package needs
│   ├── CLAUDE-intent.md             # Intent for NLA's CLAUDE.md
│   └── skills-intent.md             # Intent for skill wrappers
├── config.md                        # User preferences (gitignored)
├── reference/                       # Maintenance records
│   ├── design-rationale.md          # Why the system is built this way
│   ├── friction-log.md              # Learning journal (active entries)
│   ├── friction-log-archive.md      # Resolved entries
│   ├── system-status.md             # Current state snapshot
│   └── sessions/                    # Maintenance session archives
├── .claude/skills/                  # Skill entry points
│   ├── check-feedback/              # Penny post skill
│   ├── write-letter/                # Penny post skill
│   ├── synthesize/                  # Penny post skill
│   ├── startup/                     # Framework wrapper
│   ├── maintain/                    # Framework wrapper
│   ├── friction-log/                # Framework wrapper
│   ├── validate/                    # Framework wrapper
│   ├── plan/                        # Framework wrapper
│   └── preferences/                 # Framework wrapper
└── lib/                             # Traditional code helpers
```

---

## Conventions

The penny post suggests conventions for feedback — letter format, triage vocabulary, annotation format. These are suggestions with published reasoning, not requirements.

See `app/overview.md` for the conventions and `reference/design-rationale.md` for why they exist.

---

## Running Penny Post Directly

Most interaction happens from other NLAs. But when maintaining the penny post itself:

1. Start Claude Code in this directory
2. Run `/startup` to load foundational context
3. Run `/check-feedback` to see feedback about the penny post
4. Run `/maintain` to edit the system's own docs and conventions
5. Use `/friction-log` to capture observations

---

## The Improvement Loop

```
Observe something → /friction-log captures it → /maintain implements changes
```

The penny post improves by improving its documentation. The friction log captures observations; maintenance sessions turn them into doc changes; the docs improve; behavior improves.

---

## Contributing

Submit feedback about the **NLA framework** by opening an issue on the framework repo.

Submit feedback about the **penny post** by opening an issue on this repo.

---

*For more about the NLA Framework, see the [framework README](../nla-framework/README.md).*
