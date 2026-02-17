# Skills Integration Intent

What skill wrappers the NLA should have after installing penny post.

---

## Skills to Create

### /check-feedback

**Purpose:** Discover and triage feedback from intake channels.

**Wrapper location:** `.claude/skills/check-feedback/SKILL.md`

**What the wrapper should do:** Point to the penny post's skill logic at
`../nla-penny-post/app/check-feedback.md`. The wrapper is thin — it tells the
AI to read and follow that document. The actual skill logic lives in the penny
post repo so it stays current when the repo is pulled.

**Reference implementation:**
```
Read and follow `../nla-penny-post/app/check-feedback.md`.
```

The NLA can add context to the wrapper (e.g., "When checking feedback, also
consider our project's current priorities in `reference/roadmap.md`") but the
core delegation to the penny post's skill logic should remain.

### /write-letter

**Purpose:** Draft and submit a feedback letter to another project.

**Wrapper location:** `.claude/skills/write-letter/SKILL.md`

**What the wrapper should do:** Point to the penny post's skill logic at
`../nla-penny-post/app/write-letter.md`. Same thin wrapper pattern.

**Reference implementation:**
```
Read and follow `../nla-penny-post/app/write-letter.md`.
```

As with check-feedback, the NLA can add project-specific context to the wrapper.

## Wrapper Pattern

Both skills follow the NLA extension pattern: thin wrappers in the NLA that
delegate to skill logic in a sibling repo. This means:

- Pulling the penny post repo updates the skill logic without touching the NLA.
- The NLA can customize the wrapper with project-specific additions.
- The skill runs in the NLA's session with full project context.

## Naming

The skill names `/check-feedback` and `/write-letter` are suggestions. If the NLA
already has skills with these names, or prefers different names, the installing AI
should ask the maintainer what to call them. The wrapper content matters more than
the directory name.

---

*This describes intent, not literal text. The installing AI should create wrappers
that fit the NLA's existing skill conventions, using the reference implementations
as a starting point.*
