# Penny Post Skills Need End-to-End Testing

**Source:** Penny post maintenance session (2026-02-16/17), self-filed
**Intake:** [GitHub Issue #1](https://github.com/mightytech/nla-penny-post/issues/1)
**Triaged:** 2026-02-17

> **[Penny Post, 2026-02-17]** **Triage summary:** 4 items reviewed. Accepting all four.
> Item 1 (untested loop) is being resolved by the act of triaging this letter. Items 2-4
> are concrete doc improvements that can be addressed in the next maintenance pass. Item 4
> was refined during triage — default should be all open issues with optional label
> filtering, not prescriptive config.

---

## Source & Context

From the penny post's own maintenance session (2026-02-16/17). The system was
architecturally reframed — core docs rewritten, skills restructured, install directory
created — but the feedback loop itself hasn't been exercised.

## Items

### 1. The feedback loop is untested (high confidence)

The skill docs (check-feedback.md, write-letter.md, synthesize.md) describe a complete
feedback loop: submit → discover → triage → archive → synthesize. None of these steps
have been run for real. The docs may be clear to the authors but unclear to an AI
following them cold. Gaps won't surface until someone actually runs the loop.

**Recommendation:** Run each skill end-to-end with real feedback. This letter is the
first test of /write-letter. Running /check-feedback to discover and triage it would
complete the core loop.

> **[Penny Post, 2026-02-17]** **Accept.** Self-evidently true, and being resolved by
> this triage session. /write-letter successfully drafted and submitted Issue #1.
> /check-feedback successfully discovered, triaged, and is now archiving it. Remaining
> gap: /synthesize needs multiple letters before it can be tested.

### 2. Source attribution convention not yet in docs (medium confidence)

During the session, we decided that /write-letter should add a source attribution footer
to submitted issues — something like "*Drafted with /write-letter from nla-penny-post
during a maintenance session.*" This convention is informational (not a filter) and helps
the receiving NLA understand how the feedback was produced. It hasn't been added to
write-letter.md yet.

> **[Penny Post, 2026-02-17]** **Accept.** The convention is already being used (this
> letter has the footer). Straightforward doc addition to write-letter.md's Step 4.

### 3. Two-way conversation on GitHub Issues not reflected in check-feedback.md (medium confidence)

GitHub Issues naturally support dialogue — the triaging NLA can ask clarifying questions,
the submitter can respond. check-feedback.md currently treats issues as things to
discover and triage but doesn't explicitly acknowledge that triage might involve asking
questions before rendering a verdict. A light mention would help.

> **[Penny Post, 2026-02-17]** **Accept.** A sentence or two in check-feedback.md
> acknowledging that the AI can comment on issues to ask clarifying questions before
> rendering a verdict. Not a new flow, just recognition.

### 4. Intake channel config needs concrete mechanics (medium confidence)

When an NLA runs /check-feedback, it needs to know which GitHub repo to scan.
config-spec.md mentions intake channels but the actual configuration mechanics (repo
URL, label filters, open vs. closed issues) aren't specific enough for an AI to act
on without guessing.

> **[Penny Post, 2026-02-17]** **Accept (refined).** The observation is valid, but the
> approach was refined during triage. Default should be: all open issues, no label filter.
> The LLM judges relevance — same principle as "LLM as spam filter." Label filters are
> an optional narrowing for high-volume repos. Config-spec.md should include: repo URL
> (required), label filter (optional, default: all), state filter (optional, default: open).
> check-feedback.md should describe this default and reference config for overrides.

## Relationships

Items 2-4 are all things that would likely surface naturally from item 1 (end-to-end
testing). They're listed here because they were observed during the session, but
resolving item 1 may resolve or refine them.

---
*Drafted with /write-letter from [nla-penny-post](https://github.com/mightytech/nla-penny-post) during a maintenance session.*
