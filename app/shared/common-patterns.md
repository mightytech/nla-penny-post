# Common Patterns

Patterns shared across all penny post tasks. When triage, synthesis, and mail-checking need the same logic, it lives here.

---

## Letter Processing

### Reading a Letter

Before processing any letter:
1. Read the full letter to get the lay of the land
2. Note how many items, what themes, what confidence levels
3. Check for connections to existing letters or known framework patterns
4. Then begin task-specific processing

Don't start triaging or synthesizing from the first paragraph — context from later items can change how you interpret earlier ones.

### Item Independence

Assess whether items are independent before processing them separately. Two items that look independent might be connected:
- "The startup skill needs extensibility" and "lifecycle operations need a template" are separate requests but share the assumption that the framework should support persistent NLAs
- Processing one might change the verdict on the other

When in doubt, note the potential connection and flag it.

---

## Annotation Conventions

### Attribution Format

```markdown
> **[Source, YYYY-MM-DD]** Content of the annotation.
```

Source is whoever is writing: the framework maintainer, the letter author's NLA name, or a community contributor's identifier.

### Verdict Annotations

When recording triage decisions:

```markdown
> **[Framework, 2026-02-16]** **Accept.** This addresses a real gap in persistence
> guidance. Will add to nla-foundations.md.

> **[Framework, 2026-02-16]** **Defer.** Good observation but only one data point
> so far. Revisit when a second NLA reports similar friction.
```

Verdicts are natural language — accept, adapt, defer, decline are convenient defaults, not an enum. "Accept items 1-3, adapt item 4 into something broader" is valid.

### Cross-References

When one letter connects to another:

```markdown
See also: [Duet letter 2026-02-14, item 3](../framework/2026-02-14-duet-maintenance-learnings.md)
— same pattern observed from a different angle.
```

---

## Sub-Letter Creation

When splitting a letter into focused sub-documents:

1. Create the sub-letter as a new file in the same box
2. Reference the original: "From [original letter name], items X-Y"
3. Annotate the original: "Items from this letter have been split into: [list with links]"
4. The original stays intact as the primary source

### Naming Convention

Sub-letters use the original's date with a descriptive suffix:

```
2026-02-14-duet-maintenance-learnings.md          # Original
2026-02-14-duet-persistence-items.md               # Sub-letter: persistence theme
2026-02-14-duet-quick-wins.md                      # Sub-letter: immediately actionable items
```

---

## Box Management

### Box Structure

Each box is a directory under `boxes/`. A box contains letters — markdown files — and nothing else is required. Letters accumulate; resolved letters stay (annotated with outcomes).

### Community vs. Private Boxes

Community boxes (`boxes/framework/`, `boxes/penny-post/`) are shared via the canonical repo. Private boxes (added in forks) stay local. The distinction is by convention, not enforcement — git handles the mechanics.

---

*These patterns apply across all tasks. Task-specific patterns live in the task docs themselves.*
