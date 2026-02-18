# System Overview

This document describes what this NLA does and how its pieces fit together. For what NLAs are and the principles behind them, see [nla-foundations.md](../nla-framework/core/nla-foundations.md).

---

## What the Penny Post Is

The penny post is two things:

1. **A conventions source** — suggested structure for writing, triaging, and annotating feedback, with published reasoning, plus the skills that implement them
2. **An NLA** — that processes its own feedback exactly the way every other NLA does

Named after the 1840 British postal reform that democratized communication — fitting for a project about democratizing software development.

### The First NLA Extension

For most users, the penny post is an extension installed alongside their NLA. They interact with it entirely from within their own NLA's sessions — checking feedback, triaging items, writing letters — without ever opening the penny post project directly.

The penny post's skills follow the same pattern as framework skills: thin wrappers in the NLA point to actual skill logic in `../nla-penny-post/`. The NLA knows about penny post technically; the user experiences it as native capability.

```
your-nla/
  .claude/skills/
    write-letter/SKILL.md      → ../nla-penny-post/app/write-letter.md
    check-feedback/SKILL.md    → ../nla-penny-post/app/check-feedback.md
../nla-framework/              # Foundation
../nla-penny-post/             # Extension (conventions + skills)
```

---

## How Feedback Flows

```
Feedback submitted            Maintainer discovers          Triaged and recorded
(GitHub Issue, etc.)    →     (/check-feedback)       →     (feedback log in the NLA)
                                     │
                              Triage in NLA context
                              (AI proposes verdicts,
                               human reviews)
```

### 1. Submission

Anyone can submit feedback — end users, NLA developers, the AI itself. The default intake channel is GitHub Issues on the target project's repo. The `/write-letter` skill formats feedback as a well-structured issue, but raw issues work too — the AI applies judgment, not a parser.

The intake channel is pluggable. GitHub Issues is the default; other channels (email, web forms, Jira, etc.) can be configured. The penny post's conventions govern how feedback is processed, not how it arrives.

### 2. Discovery and Triage

The NLA maintainer runs `/check-feedback` in their own NLA's session. The skill scans the intake channel for new feedback and presents it.

Triage happens where the context lives — in the NLA's session, where the AI has full project context and the human is positioned to act on accepted items. The AI proposes verdicts (accept, adapt, defer, decline — or something more nuanced) with rationale. The human reviews, adjusts, and approves.

The penny post provides triage conventions — suggested verdict vocabulary, annotation format, evidence thresholds — as guidance, not requirements. NLAs apply these with their own judgment.

### 3. Record

After triage, accepted items are deposited in the NLA's feedback log (`reference/feedback-log.md`) as actionable work for `/maintain`. The intake item (e.g., GitHub Issue) gets a triage summary comment and is closed.

The feedback log is the NLA's record of accepted external feedback — the sibling of the friction log (which captures internal observations). Both feed into `/maintain`. The GitHub Issue remains the canonical source for the original submission and full triage reasoning.

### 4. Synthesis

When feedback across multiple sources points to the same pattern, synthesis extracts and crystallizes it into a standalone knowledge document. Like triage, synthesis happens in the NLA's own context — each NLA synthesizes its own feedback, drawing on its feedback log history (`reference/feedback-log-archive.md`) and the original GitHub Issues when needed.

---

## The Conventions

The penny post suggests — never requires — conventions for feedback communication. These exist to save NLA creators from reinventing feedback management, not to standardize an ecosystem.

### Letter Format

A suggested structure for feedback:
- **Source & context** — who's writing, what kind of NLA, what prompted this
- **Items** — observations with enough context to assess, confidence where relevant
- **Recommendations** — what the author thinks should change (optional)
- **Relationships** — connections between items, if any

Freeform is fine. The reader is an LLM. A well-written paragraph is better than a poorly filled template.

### Triage Conventions

- **Verdict vocabulary** — accept, adapt, defer, decline as convenient defaults. "Accept the principle, defer the implementation" is valid. These are suggestions, not an enum.
- **Annotation format** — blockquoted with attribution and date: `> **[Source, YYYY-MM-DD]** Content`
- **Evidence thinking** — one observation is a data point, two is a signal, three is strong. But a single observation with clear reasoning can be enough.
- **The author knows their context** — when something seems wrong, ask before dismissing.

### Why Conventions, Not Protocol

The penny post says what it likes to receive and why, but accepts feedback in whatever form it arrives. NLA creators can modify, replace, or ignore any convention. Most will use the defaults because they're good enough — not because they're required.

See [design-rationale.md](../reference/design-rationale.md) for the reasoning behind each convention.

---

## Where Feedback Lives

Feedback files live in the NLA that receives the feedback — not in the penny post:

- **`reference/feedback-log.md`** — Pending items accepted from external feedback, waiting for implementation
- **`reference/feedback-log-archive.md`** — Resolved items (searchable history for synthesis and calibration)

The GitHub Issue (or other intake item) remains the canonical source for the original submission. The feedback log captures what was accepted and why — the actionable output of triage. This keeps the entire feedback lifecycle in the NLA where the context lives.

The penny post's own feedback lives in the penny post's own `reference/` directory, because the penny post is an NLA too.

---

## Skills Provided

The penny post provides two skills that NLAs install as thin wrappers:

| Skill | Purpose | Trigger |
|-------|---------|---------|
| `/write-letter` | Draft a feedback letter and submit it | End of a maintenance session, or when observations accumulate |
| `/check-feedback` | Check for new feedback and triage it | During maintenance, or on request |

These are penny post skills, not framework skills. NLAs that install penny post get thin wrappers in `.claude/skills/` pointing to the skill logic here.

### Skills for Self-Maintenance

When running as a standalone NLA (maintaining itself), the penny post also uses framework skills:

| Skill | Purpose |
|-------|---------|
| `/startup` | Load foundational context |
| `/maintain` | Edit the penny post's own docs and conventions |
| `/friction-log` | Capture observations about how the system works |
| `/validate` | Check system consistency |
| `/preferences` | Configure user preferences |
| `/plan` | Plan major changes |

---

## Installation

The penny post ships an `install/` directory that describes what an NLA needs to
integrate it. Each file in that directory describes the **intent** of changes at a
specific integration point — what the NLA's CLAUDE.md should know, what skill wrappers
to create, etc.

An `/install` skill (framework-level, when available) reads these intent files and
synthesizes them into the NLA's existing structure. Until that skill exists, manual
setup works fine — the intent files serve as documentation of what's needed.

See `install/install.md` for the full manifest.

## For Humans

**To install penny post for your NLA:**
1. Clone the penny post repo as a sibling to your NLA: `../nla-penny-post/`
2. Add skill wrappers to your NLA's `.claude/skills/` (see `install/skills-intent.md` for details)
3. Optionally configure your intake channel in your NLA's `config.md`

**To submit feedback about an NLA:**
- Open a GitHub Issue on the NLA's repo (or whatever intake channel the NLA uses)
- Or use `/write-letter` from within any NLA session

**To keep up with upstream:**
- `git pull` the penny post repo for convention and skill updates

---

## Document Hierarchy

```
app/
├── overview.md                      ← This file
│
├── shared/
│   ├── voice-and-values.md          ← Communication tone and values
│   ├── common-patterns.md          ← Shared processing patterns
│   └── output-spec.md              ← Output format
│
├── config-spec.md                   ← What users can configure
│
├── write-letter.md                  ← Letter drafting skill logic
├── check-feedback.md                ← Feedback discovery and triage skill logic
└── synthesize.md                    ← Pattern synthesis conventions

config.md                            ← User preferences (gitignored)

install/
├── install.md                       ← Package manifest (orchestrator)
├── CLAUDE-intent.md                 ← Intent for NLA's CLAUDE.md
└── skills-intent.md                 ← Intent for skill wrappers

../nla-framework/core/
├── nla-foundations.md               ← What NLAs are (framework)
└── skills/                          ← Framework skill logic

reference/
├── design-rationale.md              ← Why the system is built this way
├── friction-log.md                  ← Learning journal (active entries)
├── friction-log-archive.md          ← Resolved entries (searchable history)
├── feedback-log.md                  ← Accepted external feedback (pending)
├── feedback-log-archive.md          ← Resolved feedback (searchable history)
├── system-status.md                 ← Current state snapshot
└── sessions/                        ← Maintenance session archives
```

---

*This is a living document. As the penny post evolves, update this overview to reflect the current state.*
