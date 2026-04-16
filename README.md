# Penny Post

Conventions and skills for how Natural Language Applications evolve through
feedback. The penny post provides structure for writing, triaging, and
synthesizing feedback — and uses them itself.

Named after the 1840 British postal reform that made sending a letter affordable
for everyone, not just the wealthy. This project is about making feedback
accessible and structured, not gated and bureaucratic.

Most users interact with the penny post from within their own NLA, where its
skills (`/write-letter`, `/check-feedback`) work as native capabilities. You
can also run the penny post directly to maintain the system itself or process
feedback about it.

## What Is an NLA?

A Natural Language Application is software where the runtime is an LLM and the
source code is written in prose. The documents in `app/` aren't documentation
about the application — they *are* the application. When behavior needs to
change, you edit the prose. The LLM reads it and does what it says.

If that sounds unusual, two paths for the curious:

- **Read about it:**
  [The Documentation Is the Application](https://github.com/mightytech/nla-framework)
  — a probe report exploring the paradigm
- **Talk to one:**
  [NLA Office Hours](https://github.com/mightytech/nla-office-hours) — an NLA
  you can talk to about NLAs

## Getting Started

### Prerequisites

- [Claude Code](https://docs.anthropic.com/en/docs/claude-code)
- The [NLA Framework](https://github.com/mightytech/nla-framework) — included
  as a git submodule at `packages/nla-framework/` (cloned automatically with
  `git submodule update --init`)

### Installing in your NLA

Most users add penny post as an extension to their existing NLA:

1. Add penny post as a git submodule in your NLA:
   ```
   git submodule add --depth 1 https://github.com/mightytech/nla-penny-post.git packages/nla-penny-post
   ```
   Your NLA should end up with both framework and extension as submodules:
   ```
   your-nla/
   ├── packages/
   │   ├── nla-framework/
   │   └── nla-penny-post/
   ```
2. Add skill wrappers to your NLA's `.claude/skills/` — see
   `install/skills-intent.md` for what's needed. The easiest path is to run
   `/install` in your NLA and point it at `packages/nla-penny-post/install/`.
3. Optionally configure your intake channel in your NLA's `config.md`

Then use `/write-letter` and `/check-feedback` from your NLA's sessions.

### Running the penny post directly

Clone this repo with `git clone --recurse-submodules` (or run `git submodule
update --init` after cloning), open the penny post directory in Claude Code,
and run `/startup`. This is for maintaining the penny post itself or processing
feedback about it.

## Using It

### From your NLA

Two skills are available once installed:

- **`/write-letter`** — Draft structured feedback and submit it as a GitHub
  Issue. Use it when you've noticed something worth sharing — a friction point,
  an idea, a pattern. The skill asks clarifying questions and handles formatting.
- **`/check-feedback`** — Scan for new feedback on your project, triage each
  item with proposed verdicts, and record accepted items for implementation.

You can also submit feedback as plain GitHub Issues without using the skills.
The conventions help structure feedback, but they're suggestions, not
requirements.

### Maintaining the penny post

When running the penny post directly, you have access to the full set of
framework skills (`/maintain`, `/validate`, `/friction-log`, etc.) plus the
penny post's own skills for processing its own feedback.

## How It Works

The documents in `app/` are the application:

```
app/
├── overview.md              — What the penny post does, how pieces connect
├── shared/
│   ├── values.md            — What it prioritizes and protects
│   ├── voice.md             — How it communicates
│   ├── common-patterns.md   — Shared processing patterns
│   └── output-spec.md       — Output format conventions
├── config-spec.md           — What users can configure
├── write-letter.md          — Letter drafting skill
├── check-feedback.md        — Feedback triage skill
└── synthesize.md            — Pattern synthesis conventions
```

These files define how the AI processes feedback — what verdicts to propose,
how to annotate items, when to synthesize patterns, what values to apply. You
can read them. They're prose.

If you want to understand why the penny post makes the decisions it makes,
start with `app/shared/values.md`.

## Improving It

The penny post improves the same way every NLA does: use it, notice friction,
capture it, maintain.

1. Use the system — write letters, triage feedback, synthesize patterns
2. Notice what works and what doesn't
3. Log observations with `/friction-log`
4. Process them with `/maintain`

Outside contributions are welcome through observations and feedback. See
[CONTRIBUTING.md](CONTRIBUTING.md) for how this project thinks about
contributions — it's different from most open source.

## Getting Help

Ask the AI. Run `/guide` for a contextual walkthrough, or just describe what
you're trying to do — the AI has read the documentation and can orient you.

## Learn More

- [NLA Framework](https://github.com/mightytech/nla-framework) — the
  foundation that NLAs (including this one) are built on
- [NLA Office Hours](https://github.com/mightytech/nla-office-hours) — an
  interactive introduction to NLAs
- [CONTRIBUTING.md](CONTRIBUTING.md) — how to contribute to this project
