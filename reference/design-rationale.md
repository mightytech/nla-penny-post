# Design Rationale

This document explains WHY the penny post is built the way it is. It captures the reasoning, trade-offs, and principles that shaped the design.

**Audience:** Future maintainers (human or AI) who need to understand the decisions behind the system before modifying it.

**Purpose:** Prevent well-intentioned "improvements" that break things that work. Provide context that won't be obvious from the docs alone.

---

## Why an NLA?

The penny post is a communication and knowledge management system. Its core operations — reading letters, assessing whether observations are general, connecting patterns across sources, synthesizing knowledge — are judgment tasks. Traditional software would need a ticketing system, a schema, a workflow engine, API endpoints, and notification services. The NLA version: markdown files in a git repo, conventions described in prose, interpreted by LLMs.

The penny post demonstrates NLA principles it was designed to support: natural language as interface, judgment over rules, flexible on top / structured underneath, documentation as application.

---

## Why This Structure

### Feedback Lives in the NLA

Each NLA stores its own feedback files — `reference/feedback-log.md` for pending items,
`reference/feedback-log-archive.md` for resolved history. The penny post provides
conventions and skills; it doesn't store other NLAs' feedback.

**Why not a central archive?** Earlier designs had a `boxes/` directory in the penny post
for archiving processed letters. But this conflicted with the principle that processing
happens where context lives. If triage happens in the NLA, and synthesis happens in the
NLA, why does the archive live somewhere else? The feedback log and its archive are the
NLA's record. The GitHub Issue (or other intake item) remains the canonical source for
the original submission. No separate archive step needed.

**What we rejected:** Central mailbox with per-project boxes, fork model for distributing
archived letters. Simpler to keep everything in the NLA that owns it.

### The Feedback Log as Tracker

The feedback log is the tracker. No separate tracking infrastructure. Accepted items
from triage are deposited with their verdict, rationale, and what to do. Resolved items
move to the archive file. The GitHub Issue comment has the full triage reasoning for
all items including rejections and deferrals.

**What we rejected:** Separate issue trackers, status databases, tracking spreadsheets,
local letter archives. Each would add infrastructure that needs maintenance. The feedback
log plus the GitHub Issue comment captures everything needed.

---

## Key Design Decisions

### Freeform Format with Suggested Structure

The letter format is a suggestion, not a mandate. Required fields are minimal (source, context, items with confidence). Everything else is freeform.

**Why:** The reader is an LLM that applies judgment, not a parser. Rigid formatting would constrain communication without improving processing. A well-written freeform letter is better than a poorly filled form.

**What we rejected:** JSON schemas, required templates, structured submission forms. All would reduce the quality of communication in the name of consistency.

### Annotation Convention

Responses use blockquoted annotations with attribution and date. Annotations go wherever they make most sense — inline, at the end, or as new sections.

**Why:** Non-linear conversation fits better than email chains. A response to item 7 belongs next to item 7, not at the bottom of a thread. The convention is simple enough to remember and flexible enough to adapt.

### Natural Language Verdicts

Triage verdicts (accept, adapt, defer, decline) are convenient defaults, not an enum. "Accept the principle, defer the implementation" is valid.

**Why:** NLA config principle — enums are convenient defaults, prose is the real interface. The LLM can interpret nuanced verdicts; there's no reason to flatten them to four categories.

### Community Boxes Are Public

The canonical repo is public. Community boxes are readable by anyone. This enables visible decision-making, community signal amplification, and cross-pollination between NLA developers.

**Risks acknowledged:** Noise, authority dilution, scope creep, toxic behavior, privacy concerns, maintainer burnout. The governance section in the README establishes light norms. These risks are real but manageable at current scale.

### The Penny Post Is a Forkable NLA

The penny post is designed so others can use it for their own purposes — feedback channels for their own NLAs, team coordination, inter-NLA communication, general knowledge management. This requires clean separation between domain-specific content (framework feedback norms) and general patterns (letter format, annotation conventions).

### The Penny Post as NLA Extension

The penny post is primarily an extension that other NLAs install, not a standalone
application users interact with directly. 99% of usage happens from within other NLAs
via penny post skills (/check-feedback, /write-letter).

**Why:** Triage requires the context of the receiving NLA. The penny post alone can't
assess domain-specific feedback — the NLA maintainer can, with full project context loaded.
Triage naturally happens where the context lives.

**What it affects:** The penny post's scope narrows to: feedback conventions (suggested,
not enforced), skills, and self-maintenance. The active processing and all feedback
storage happen in the NLA.

**What we rejected:** The penny post as active triage processor (original design). This
would require either the penny post reading other NLAs' files (cross-project coupling)
or triaging without context (poor judgment). Neither is acceptable. Also rejected: central
mailbox with per-project boxes — simpler and more consistent to keep everything in the NLA.

### Conventions Over Protocol

The penny post's suggestions — letter format, triage conventions, annotation format — are
NLA-style conventions: suggested structure with published reasoning, not a rigid protocol.
The penny post says what it likes to receive and why, but accepts feedback in whatever
form it arrives.

**Why:** The reader is an LLM that applies judgment, not a parser. Rigid formatting
constrains communication without improving processing. A well-written freeform letter
is better than a poorly filled form. This is the same principle already applied to letter
format, now extended to the entire interaction model.

### NLA Extensions: Technically Explicit, Experientially Native

When one NLA extends another (as penny post extends other NLAs), the integration should be
explicit in the wiring (docs and skills know about the dependency) but invisible in the user
experience (the user feels like they're using native capabilities of their own NLA).

**Why:** Users shouldn't context-switch between projects. The NLA they're in is their
workspace. Extensions add capabilities to that workspace, not destinations outside it.

### Pluggable Intake

The intake channel is pluggable — GitHub Issues by default, but the architecture supports
any channel (email, web forms, Jira, Slack, S3, etc.). Config describes where to look;
the AI handles the mechanics. NLA creators choose channels appropriate for their audience.

GitHub Issues is the default because it's universal for developers, requires zero
infrastructure, closes the feedback loop via issue comments, and supports two-way
conversation (clarifying questions, follow-ups).

**What we rejected:** Tying the penny post to any single intake mechanism. The conventions
govern how feedback is processed, not how it arrives. Also rejected: requiring contributors
to fork and PR — too much friction for casual feedback.

### Intent-Based Package Installation

NLA packages (like the penny post) ship an `install/` directory containing intent files
rather than literal text to paste. Each file describes the *intent* of changes needed at
a specific integration point (CLAUDE.md, skills, etc.). The installing NLA's AI reads
these intents and synthesizes them into the NLA's existing files — matching its voice,
structure, and conventions.

**Why intent, not templates?** Templates produce uniform results regardless of context.
Intent-based installation lets each NLA integrate the package in a way that fits its
existing structure. Two NLAs installing penny post will have different CLAUDE.md sections
that accomplish the same thing — tailored integration, not copy-paste.

**Why an install directory, not a single manifest?** Separating intents by integration
point (one file for CLAUDE.md, one for skills) makes each concern independently diffable
and independently updatable. When only the skills intent changes, the NLA can re-process
just that file.

**The install log:** After installation, the NLA records what it did and why — which
package, which intent, what concrete changes were made. This log is how future updates
know what came from where, and how uninstalls know what to reverse. It also handles
overlap: if two packages both need the NLA to know about external data sources, the AI
integrates it once but logs both packages as the source.

**What we rejected:** Literal text injection (paste this into CLAUDE.md), rigid templates,
and version-specific migration scripts. All of these fight against the NLA principle that
the AI applies judgment. Intent-based installation works *with* the AI, not around it.

### Processing Happens Where Context Lives

Triage and synthesis always happen in the receiving NLA's session — never in the penny
post's session (unless the penny post is processing its own feedback). Each project is
an NLA: Duet, penny post, nla-framework. Each processes its own feedback within its own
context.

**Why:** Assessment requires understanding. To decide whether "artifact persistence is a
missing pattern" is valid framework feedback, you need to understand the framework.
The penny post can't do that — the framework maintainer can.

**What it affects:** The penny post has no special processing role. It provides conventions
and infrastructure. Every NLA (including penny post) processes its own feedback using
the same framework-level skills.

**What we rejected:** Penny post as centralized triage/synthesis engine. Also rejected
giving penny post a special cross-cutting synthesis role — the simpler rule (processing
happens where context lives, no exceptions) is both simpler and more correct.

---

## Adding Decisions

When you make architectural changes (not just wording fixes), add an entry here documenting:
- What was decided
- Why (including what alternatives were considered)
- What it affects

This prevents future maintainers from re-introducing approaches that already failed or undoing decisions that had good reasons.

---

*This document is updated by the `/maintain` skill when architectural decisions are made.*
