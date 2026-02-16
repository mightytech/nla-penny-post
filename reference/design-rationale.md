# Design Rationale

This document explains WHY the penny post is built the way it is. It captures the reasoning, trade-offs, and principles that shaped the design.

**Audience:** Future maintainers (human or AI) who need to understand the decisions behind the system before modifying it.

**Purpose:** Prevent well-intentioned "improvements" that break things that work. Provide context that won't be obvious from the docs alone.

---

## Why an NLA?

The penny post is a communication and knowledge management system. Its core operations — reading letters, assessing whether observations are general, connecting patterns across sources, synthesizing knowledge — are judgment tasks. Traditional software would need a ticketing system, a schema, a workflow engine, API endpoints, and notification services. The NLA version: markdown files in a git repo, conventions described in prose, interpreted by LLMs.

The mailbox demonstrates NLA principles it was designed to support: natural language as interface, judgment over rules, flexible on top / structured underneath, documentation as application.

---

## Why This Structure

### The Apartment Building (boxes/)

The mailbox uses a multi-box architecture: one repo, many boxes, one per project. This solves several problems at once:

- **One repo per developer** regardless of how many NLAs they maintain
- **Community and private** — community boxes ship with the canonical repo, private boxes stay in forks
- **Self-referential** — the penny post's own feedback has a natural home (`boxes/penny-post/`), no special-casing
- **Git-native** — `git pull` from upstream brings community mail without disturbing private boxes

**Why not one box?** Different projects need different feedback spaces. Framework feedback and Duet feedback have different audiences, different triage criteria, different contexts. Mixing them makes every letter harder to process.

**Why not separate repos per box?** Too much overhead. A box is just a directory. Adding one is `mkdir`.

### Letters as Tracker

Letters are the tracker. No separate tracking infrastructure. Triage verdicts, responses, and status updates are annotations on the letter itself. This keeps everything in context — you can read a letter and see its full history without consulting another system.

**What we rejected:** Separate issue trackers, status databases, tracking spreadsheets. Each would add infrastructure that needs maintenance and would separate the assessment from the thing being assessed.

### Sub-Letters

Large letters can be split into focused sub-documents. This emerged from the observation that a twenty-item letter about four different themes is hard to process as one unit, but four five-item sub-letters are natural.

Sub-letters reference the original. The original is annotated noting the split. Relationships are sentences, not foreign keys.

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

The mailbox is designed so others can fork it for their own purposes — feedback channels for their own NLAs, team coordination, inter-NLA communication, general knowledge management. This requires clean separation between domain-specific content (framework feedback norms) and general patterns (letter format, annotation conventions).

---

## Adding Decisions

When you make architectural changes (not just wording fixes), add an entry here documenting:
- What was decided
- Why (including what alternatives were considered)
- What it affects

This prevents future maintainers from re-introducing approaches that already failed or undoing decisions that had good reasons.

---

*This document is updated by the `/maintain` skill when architectural decisions are made.*
