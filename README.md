# Penny Post

A feedback mailbox for NLA projects, built on the [NLA Framework](../nla-framework/).

Named after the 1840 British postal reform that democratized communication — fitting for a project about democratizing software development beyond coders.

---

## What It Does

The penny post manages feedback between NLA projects and the frameworks they're built on. Domain NLAs send feedback letters describing patterns, gaps, and learnings. The penny post triages them, tracks responses, and over time synthesizes accumulated feedback into institutional knowledge.

**Tasks:**
- `/triage` — Process a feedback letter: assess each item, record verdicts with rationale
- `/check-mail` — Scan boxes for new or updated letters, surface what's relevant
- `/synthesize` — Distill patterns across multiple letters into knowledge documents

---

## Prerequisites

**NLA Framework** must be available at `../nla-framework/` (sibling directory to this project).

```bash
# If you haven't cloned it yet:
git clone <framework-repo-url> ../nla-framework
```

**Claude Code** must be installed. This project runs inside Claude Code sessions.

---

## Quick Start

1. Start Claude Code in this directory
2. Run `/startup` to load foundational context
3. Run `/check-mail` to see what's in the boxes
4. Run `/triage` to process a letter
5. Use `/friction-log` to capture observations about how the process works

---

## The Mailbox

```
boxes/
├── framework/           # Community mail about the NLA framework
├── penny-post/          # Community mail about this mailbox NLA
└── [your-project]/      # Add boxes for your own projects (in your fork)
```

**Community boxes** (`framework/`, `penny-post/`) ship with this repo. Anyone can submit letters via PR. `git pull` brings new community mail.

**Private boxes** — fork the repo and add directories under `boxes/` for your own projects. Private boxes stay in your fork; community mail flows from upstream.

**Letters** are markdown files. Drop a `.md` file in a box, and the penny post can process it.

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
│   ├── config-spec.md               # What users can configure (developer-defined)
│   ├── triage.md                    # Feedback triage task
│   ├── check-mail.md                # Mail scanning task
│   └── synthesize.md                # Pattern synthesis task
├── boxes/                           # The mailbox
│   ├── framework/                   # Community mail about the NLA framework
│   └── penny-post/                  # Community mail about this NLA
├── config.md                        # User preferences (gitignored)
├── config/                          # Context-specific sub-configs
├── reference/                       # Maintenance records (not loaded at runtime)
│   ├── design-rationale.md          # Why the system is built this way
│   ├── friction-log.md              # Learning journal (active entries)
│   ├── friction-log-archive.md      # Resolved entries
│   ├── system-status.md             # Current state snapshot
│   └── sessions/                    # Maintenance session archives
├── .claude/skills/                  # Skill entry points
│   ├── startup/                     # Framework wrapper
│   ├── maintain/                    # Framework wrapper
│   ├── friction-log/                # Framework wrapper
│   ├── plan/                        # Framework wrapper
│   ├── preferences/                 # Framework wrapper
│   ├── validate/                    # Framework wrapper
│   ├── triage/                      # Domain skill
│   ├── check-mail/                  # Domain skill
│   └── synthesize/                  # Domain skill
└── lib/                             # Traditional code helpers
```

---

## Writing a Letter

Letters are markdown files with a suggested structure:

- **Summary** at the top — what the letter is about, what kind of NLA, roughly how many items
- **Source** — NLA name, context, repo URL (optional)
- **Items** with natural language confidence — observations and how confident the author is they're general

Everything else is freeform. The format is a suggestion with published reasoning, not a mandate. The reader is an LLM that applies judgment, not a parser.

---

## Configuration

Users can personalize how the penny post behaves by running `/preferences`. This creates `config.md` with user preferences — notification patterns, triage preferences, workflow modifications.

Example config directives:
- "When checking mail, highlight letters that mention persistence or lifecycle patterns."
- "Show responses to my previous letters first."
- "Flag high-confidence items from NLAs I haven't seen before."

Config files are separate from the application. `app/config-spec.md` defines what's configurable.

---

## The Improvement Loop

```
Observe something → /friction-log captures it → Friction log stores it → /maintain implements changes
```

1. Use the penny post normally
2. Notice something that could be better (triage patterns, synthesis quality, annotation conventions)
3. Run `/friction-log` to record the observation
4. When ready, run `/maintain` to process accumulated observations into doc changes
5. The docs improve, and the penny post's behavior improves with them

---

## Contributing

Submit feedback about the NLA framework by adding a letter to `boxes/framework/` via PR.

Submit feedback about the penny post itself by adding a letter to `boxes/penny-post/` via PR.

---

## Framework Updates

```bash
cd ../nla-framework
git pull
```

Framework updates (skill logic, NLA foundations) take effect immediately through the thin wrapper pattern. Your domain content is never touched.

---

*For more about the NLA Framework, see the [framework README](../nla-framework/README.md).*
