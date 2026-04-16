# Friction Log Archive

Resolved entries from the friction log, preserved for searchable history.

---

*Entries are moved here by `/maintain` when resolved. Newest first.*

## 2026-04-16 — `/synthesize` miscategorized in CLAUDE.md skill table

**Type:** documentation
**Severity:** minor
**Task:** maintain (surfaced during /validate structural check)
**Status:** resolved
**Resolved:** 2026-04-16 — Rewrote the Penny Post Skills section header in CLAUDE.md. Removed the "(also installed in other NLAs as thin wrappers)" parenthetical and added a clarifying paragraph: `/check-feedback` and `/write-letter` are the skills penny post installs in other NLAs; `/synthesize` is a self-maintenance skill. Bundled with Phase 2 of the packages/ migration since skills-intent.md was already being revised.

**Observation:**
CLAUDE.md line 69 lists `/synthesize` under "Penny Post Skills (also installed in
other NLAs as thin wrappers)". But `install/skills-intent.md` only instructs other
NLAs to install `/check-feedback` and `/write-letter`. `app/overview.md`'s "Skills
Provided" section correctly lists only those two. The `/synthesize` wrapper exists
in penny post itself for self-use.

**Affected documentation:**
`CLAUDE.md` — the Penny Post Skills table at line 63-69.

**Proposed fix:**
Options: (a) move `/synthesize` to the Framework Skills table or a third "Penny post
self-maintenance" category, or (b) remove from CLAUDE.md's "installed in other NLAs"
table while keeping the wrapper. Decide during Phase 2 of the packages/ migration
since that session will also be reviewing `install/skills-intent.md` and related
install intents.

**Notes:**
Pre-existing inconsistency — surfaced during the 2026-04-16 packages/ migration
(Phase 1) structural validation but not caused by it. Bundle with Phase 2.

---

## 2026-02-23 — Letter delivered to boxes/ instead of GitHub Issues

**Type:** process
**Severity:** minor
**Task:** write-letter (from framework session)
**Status:** resolved
**Resolved:** 2026-02-23 — Resubmitted as Issue #8. Original file removed from boxes/.

**Observation:**
A framework maintenance session (2026-02-23) drafted a letter for the penny post using
/write-letter but saved it to `boxes/penny-post/` instead of submitting via `gh issue create`.
The session log says "Penny post letter delivered to `boxes/penny-post/`" — the old delivery
mechanism that was eliminated in the architectural reframing.

**Confirmed reason:**
The letter was drafted from the framework's session, not a penny post session. The framework
AI used the pre-elimination boxes/ pattern as the delivery target. The penny post's
write-letter.md clearly specifies GitHub Issues as the submission channel (Step 4), but the
cross-project session didn't have the penny post's updated architecture fully loaded.

**Generalizable:** partially
This is a transition-period issue — the boxes/ directory still exists with historical files,
making it look like a valid destination. As more sessions use the correct flow, this should
fade. Worth watching for recurrence.

**Affected documentation:**
No penny post doc change needed — write-letter.md already specifies the correct flow. The
framework's write-letter wrapper or the AI's understanding of cross-project delivery is
the gap.

---

## 2026-02-17 — gh CLI token lacks issue comment/close permissions

**Type:** process
**Severity:** major
**Task:** /check-feedback end-to-end test
**Status:** resolved
**Resolved:** 2026-02-17 — Token fixed via `gh auth refresh --scopes repo`. Built
`lib/check-setup.sh` to detect permission issues. Updated check-feedback.md Step 6
and write-letter.md Step 4 with graceful error handling and reference to check-setup.
install/install.md already lists gh CLI as prerequisite.

**Observation:**
During the first end-to-end test of /check-feedback, the archive step succeeded but
the "close the loop on GitHub" step failed. The `gh` CLI token can create issues and
repos but cannot comment on or close issues (HTTP 403, "Resource not accessible by
personal access token").

**Generalizable:** yes — any NLA using penny post with GitHub Issues will need a token
with sufficient permissions. The check-feedback and write-letter docs should note the
required token scopes, and ideally detect and report permission issues gracefully rather
than failing mid-flow.
