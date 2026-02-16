# System Overview

This document describes what this NLA does and how its pieces fit together. For what NLAs are and the principles behind them, see [nla-foundations.md](../nla-framework/core/nla-foundations.md).

---

## What This NLA Does

The penny post is a feedback mailbox for NLA projects. It manages the flow of learnings from domain NLAs back to the frameworks and communities they're built on. Letters come in, get triaged, and over time the accumulated feedback becomes institutional knowledge.

Named after the 1840 British postal reform that democratized communication — fitting for a project about democratizing software development.

| Task | Purpose | Trigger |
|------|---------|---------|
| **Triage** | Assess items in a feedback letter, record verdicts with rationale | A new letter arrives or maintainer initiates triage |
| **Check Mail** | Scan boxes for new or updated letters, surface what's relevant | At session start, during maintenance, or on request |
| **Synthesize** | Distill patterns across multiple letters into knowledge documents | When enough evidence accumulates on a theme |

### Triage

The core task. Takes a feedback letter and produces per-item assessments: accept, adapt, defer, or decline — with rationale for each. Triage doesn't implement changes; it decides what deserves implementation.

**Source:** `triage.md`

### Check Mail

A lightweight scan of the boxes. Surfaces new letters, responses to previous submissions, and updated annotations. Filters by config-defined notification patterns when available.

**Source:** `check-mail.md`

### Synthesize

The highest-value task. When multiple letters point to the same pattern, synthesis extracts and crystallizes it into a standalone document. This is how accumulated mail becomes institutional knowledge.

**Source:** `synthesize.md`

### How It Connects

```
                    ┌─────────────────┐
                    │  Shared Context │
                    │  - Voice/Values │
                    │  - Patterns     │
                    │  - Output Spec  │
                    └────────┬────────┘
                             │
              ┌──────────────┼──────────────┐
              ▼              ▼              ▼
        ┌──────────┐  ┌───────────┐  ┌────────────┐
        │  Triage  │  │ Check Mail│  │ Synthesize │
        └────┬─────┘  └─────┬─────┘  └─────┬──────┘
             │              │               │
             ▼              ▼               ▼
        ┌──────────┐  ┌───────────┐  ┌────────────┐
        │Annotated │  │ Summary   │  │ Knowledge  │
        │ Letters  │  │ of Mail   │  │ Documents  │
        └──────────┘  └───────────┘  └────────────┘
```

All tasks read shared context and operate on the contents of `boxes/`. The boxes are the data; the tasks are the processing.

### The Boxes

```
boxes/
├── framework/           # Community mail about the NLA framework
├── penny-post/          # Community mail about this mailbox NLA
└── [project-name]/      # Additional boxes added by forks
```

Community boxes (`framework/`, `penny-post/`) ship with the canonical repo. Private boxes are added in forks for project-specific feedback. `git pull` from upstream brings community mail without disturbing private boxes.

### Invocation via Skills

Each task has an explicit entry point — a Claude Code skill:

| Skill | Purpose |
|-------|---------|
| `/startup` | Load foundational context at session start |
| `/triage` | Process a feedback letter |
| `/check-mail` | Scan the mailbox for new or updated letters |
| `/synthesize` | Distill patterns across letters |
| `/preferences` | Create or edit user configuration |
| `/friction-log` | Log observations to the friction log from any context |
| `/maintain` | Edit the NLA system itself |
| `/validate` | Check system consistency, trace scenarios, debug behavior |
| `/plan` | Planning mode for new tasks or major changes |

### The Improvement Pipeline

The system improves through the friction log:

```
Observation from any context → /friction-log captures it → Friction Log → /maintain implements
```

`/friction-log` captures observations from any context — during triage, maintenance, or casual conversation. Entries accumulate in the friction log, where patterns emerge over time. `/maintain` processes them into doc changes. Resolved entries are archived to `friction-log-archive.md`.

---

## For Humans

**To change AI behavior:**
- Identify which document governs that behavior
- Edit the document
- The change takes effect immediately (next run)

**To debug unexpected output:**
- Check which documents the AI read
- Look for ambiguity or missing guidance
- Add clarification or examples

**To add a new box:**
- Create a directory under `boxes/` (e.g., `boxes/my-nla/`)
- That's it — letters are just markdown files in the directory

**To add a new task:**
1. Create a new file in `app/` (e.g., `app/my-new-task.md`)
2. Follow the structure of existing task docs
3. Create a skill in `.claude/skills/my-new-task/SKILL.md`
4. Add it to the skills table in this overview and in CLAUDE.md
5. The new task inherits all shared context

---

## Document Hierarchy

```
app/
├── overview.md                      ← This file
│
├── shared/
│   ├── voice-and-values.md          ← Communication tone and values
│   ├── common-patterns.md           ← Shared processing patterns
│   └── output-spec.md               ← Output format
│
├── config-spec.md                   ← What users can configure (developer-defined)
│
├── triage.md                        ← Feedback triage task
├── check-mail.md                    ← Mail scanning task
└── synthesize.md                    ← Pattern synthesis task

config.md                            ← User preferences (gitignored)
config/                              ← Context-specific sub-configs

boxes/
├── framework/                       ← Community mail about the NLA framework
└── penny-post/                      ← Community mail about this NLA

../nla-framework/core/
├── nla-foundations.md               ← What NLAs are (framework)
└── skills/                          ← Skill logic (framework)

reference/
├── design-rationale.md              ← Why the system is built this way
├── friction-log.md                  ← Learning journal (active entries)
├── friction-log-archive.md          ← Resolved entries (searchable history)
├── system-status.md                 ← Current state snapshot
└── sessions/                        ← Maintenance session archives
```

---

## Document Index

### Shared Context
- [Voice and Values](shared/voice-and-values.md) — Communication tone, values, annotation standards
- [Common Patterns](shared/common-patterns.md) — Letter processing, annotation conventions, sub-letter creation
- [Output Spec](shared/output-spec.md) — Output format for triage, synthesis, and mail checks
- [Config Spec](config-spec.md) — What users can configure and how

### Tasks
- [Triage](triage.md) — Process feedback letters, record verdicts with rationale
- [Check Mail](check-mail.md) — Scan boxes for new or updated letters
- [Synthesize](synthesize.md) — Distill cross-letter patterns into knowledge documents

### Reference
- [Design Rationale](../reference/design-rationale.md) — Why the system is built the way it is
- [Friction Log](../reference/friction-log.md) — Running log of issues and improvements
- [System Status](../reference/system-status.md) — Current state snapshot

---

*This is a living document. As the penny post evolves, update this overview to reflect the current state.*
