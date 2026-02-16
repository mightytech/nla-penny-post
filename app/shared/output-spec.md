# Output Specification

Defines the output format for the penny post's tasks.

---

## Format

All output is clean Markdown. Letters, annotations, triage records, and synthesis documents use standard Markdown conventions:

- `#` through `######` for heading hierarchy
- `> ` for blockquotes (used for annotations with attribution)
- `**bold**` for emphasis, verdict keywords, and source names
- `[text](path)` for cross-references between letters
- `- ` for unordered lists

## Triage Output

A triage pass annotates the letter directly. Per-item verdicts use the annotation convention from common-patterns.md. A triage summary at the top of the letter or as a separate annotation captures the overall assessment:

```markdown
> **[Framework, 2026-02-16]** **Triage summary:** 11 items reviewed. Accepting
> items 1-3 (persistence patterns), adapting item 10 (NLA config), deferring
> items 5-6 (one data point), declining item 7 (already addressed). See
> individual annotations for rationale.
```

## Synthesis Output

Synthesis documents are new files that distill patterns across multiple letters. Structure:

```markdown
# [Pattern Name]

**Sources:** [List of letters and items that contributed]
**Confidence:** [Natural language assessment]
**Status:** [Emerging | Established | Recommended for framework]

## The Pattern

[Description of what multiple sources have observed]

## Evidence

[Specific observations from each source, with references]

## Implications

[What this means for the framework or for NLA builders]
```

## Mail Check Output

A mail check produces a conversational summary — not a formatted document. Something like:

"There are 2 new letters in the framework box. One is from a medical intake NLA about validation patterns (3 items, high confidence). The other is a quick note about path resolution from a policy platform NLA. No responses to previous letters."

The AI reads the config to filter and prioritize what it surfaces.

---

*Customize this spec as the penny post evolves. The format should serve communication, not constrain it.*
